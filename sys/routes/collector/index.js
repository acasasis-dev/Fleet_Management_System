var router = require( "express" ).Router()
var fs = require( "fs" )
var db = require( "db" )() 
var mid = require( "midwares" )

router.use( mid.collector_check )

router.get( "/", ( req, res ) => {	
	q = `
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
			balance != 0;
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
			b.penalty_id >= 5 and b.penalty_id <= 8 and 
			a.driver_id=d.driver_id left join
			penalty_payment_log e
			on
				a.offense_rec_id=e.offense_rec_id
		group by
			a.offense_rec_id,
			d.driver_fn, d.driver_mn, d.driver_ln
		having
			balance != 0;
	`

	db.query( q, ( err, out ) => {
		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			console.log( out )
			drivers = out[0]
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


			console.log( penalty_q )
			db.query( penalty_q, ( err, out1 ) => {
				res.render( "CollectorDashboard", {
					records: out[1]
				})
			})		
		})		
	})	
})

fs.readdir( __dirname + "/subs", ( err, mods ) => {
	mods.forEach( cur => {
		cur = cur.split( "." )[0]
		router.use( `/${ cur }`, require( `./subs/${ cur }` ) )
	})
})

module.exports = router