var router = require( "express" ).Router()
var fs = require( "fs" )
var midware = require( "midwares" )
var db = require( "db" )()

router.use( midware.admin_check )

router.get( "/", (req, res) => {
	offs_and_penalties_q = `
		select
			a.*,
			b.*,
			c.*,
			d.*,			
			if( a.penalty_amount - sum( e.paid ) is null,
				a.penalty_amount,
				a.penalty_amount - sum( e.paid )
			) as balance
		from
			offense_record a join
			penalty b join
			offense_category c join
			drivers d
		on
			a.penalty_id=b.penalty_id and
			b.offensecat_id=c.offensecat_id and
			b.offensecat_id!=4 and b.offensecat_id!=8 and
			a.driver_id=d.driver_id left join
			penalty_payment_log e
			on
				a.offense_rec_id=e.offense_rec_id
		group by
			a.offense_rec_id,
			d.driver_fn, d.driver_mn, d.driver_ln;
	`
	for_repair_q = `
		select
			a.*,
			c.unitplate_no,
			d.unittype_desc
		from
			for_repair a join
			unit b join
			unit_number c join
			unit_type d
		on
			a.unit_id=b.unit_id and
			b.unitnum_id=c.unitnum_id and
			b.unittype_id=d.unittype_id and
			a.for_repairs_status!="Fixed";
	`
	termination_q = `
		select
			a.*
		from
			drivers a join
			offense_record b
		where
			b.penalty_id=4 or b.penalty_id=8;
	`
	boundary_offense_q = `
		select
			a.*,
			c.driver_id,
			@did:=c.driver_id,
			if( a.amount - sum( e.paid ) is null,
				a.amount,
				a.amount - sum( e.paid )
			) as balance,
			d.offense_rec_id,
			if( d.penalty_id is null,
				0,
				d.penalty_id
			) as penalty_id,
			d.penalty_amount			
		from
			boundary_record a join
			schedule b join
			drivers c
		on
			a.sched_id=b.sched_id and
			if( b.reliever_id is null and b.relieve_date != date( now() ),
				b.driver_id=c.driver_id,
				b.reliever_id=c.driver_id
			) and
			datediff( now(), a.for_date ) >= 8 left join
			offense_record d
			on
				d.penalty_id=(
					select max( penalty_id ) from offense_record where driver_id=@did
				) and
				c.driver_id=d.driver_id left join
				payment_log e
				on
					a.brecord_id=e.brecord_id				
		group by
			a.brecord_id,
			c.driver_id,
			d.penalty_id, d.penalty_amount, d.offense_rec_id
		having
			balance != 0
	`

	q = offs_and_penalties_q + for_repair_q + termination_q
	console.log( q )

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		console.log( out )
		out[0].forEach( cur => {			
			if( cur.offense_no == 1 ) {
				cur.offense_no = "1st Offense"
			} else if( cur.offense_no == 2 ) {
				cur.offense_no = "2nd Offense"
			} else if( cur.offense_no == 3 ) {
				cur.offense_no = "3rd Offense"
			}
		})

		db.query( boundary_offense_q, ( err, drivers ) => {
			db.query( boundary_offense_q, ( err, drivers ) => {
				penalties = []

				penalty_q = `
					insert into
						offense_record(
							penalty_id,
							driver_id,
							penalty_amount,
							for_date
						) values
				`

				drivers.forEach( cur => {
					if( cur.penalty_id == 0 ) {			
						console.log( "MAIN IF ENTERED")
						penalties.push( `
							(
								${ Number( cur.penalty_id ) + 1 },
								${ cur.driver_id },
								NULL,
								now()
							)
						` )
					} else {
						d = new Date()
						if( cur.forDate >= d.setDate( d.getDate() + 8 ) && cur.penalty_id <= 3 ) {
							console.log( "OTHER IF ENTERED")
							penalties.push( `
								(
									${ Number( cur.penalty_id ) + 1 },
									${ cur.driver_id },
									NULL,
									now()
								)
							` )
						}
					}			
				})

				penalty_q += penalties.join( ", " )

				db.query( penalty_q, ( err, tmp ) => {
					res.render( "dashboard", {
						penalties: out[0],
						for_repair: out[1],
						termination: out[2]
					})
				})		
			})
		})		
	})	
})

fs.readdir( __dirname + "/subs", ( err, mods ) => {
	if(err) console.err

	mods.forEach( cur => {
		route = cur.split( "." )[0]
		router.use( `/${ route }`, require( `./subs/${ route }` ) )
	})
})

module.exports = router
