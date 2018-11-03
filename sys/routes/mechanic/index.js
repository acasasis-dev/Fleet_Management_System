var router = require( "express" ).Router()
var fs = require( "fs" )
var mid = require( "midwares" )
var db = require( "db" )()
var mech_latest_dsched
var mech_latest_asched
var mech_latest_repair

router.use( mid.mechanic_check )

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
			b.offensecat_id!=4 and b.offensecat_id !=8 and
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
	deadlines_q = `
		select 
			a.*,
			b.*,
			c.* 
		from 
			for_repair a join
			unit b join
			unit_number c
		where
			a.unit_id=b.unit_id and
			b.unitnum_id=c.unitnum_id and 
			a.for_repairs_deadline>=now() and
			for_repairs_status!="Fixed"
	`

	db.query( offs_and_penalties_q + deadlines_q, ( err, out ) => {
		console.log( err? err: "" )
		out.forEach( cur => {			
			if( cur.offense_no == 1 ) {
				cur.offense_no = "1st Offense"
			} else if( cur.offense_no == 2 ) {
				cur.offense_no = "2nd Offense"
			} else if( cur.offense_no == 3 ) {
				cur.offense_no = "3rd Offense"
			}
		})
		res.render( "MechanicDashboard", {
			offs_and_penalties: out[0],
			deadlines: out[1]
		});
	})	
})

router.get( "/", ( req, res ) => {
	q = `
		select max( for_date ) max_date from dispatch_inspection_record;
		select max( for_date ) max_date from arrival_inspection_record;
	`

	db.query( q, ( err, out ) => {
		o = out
		mech_latest_dsched = o[0][0].max_date.toLocaleDateString()
		mech_latest_asched = o[1][0].max_date.toLocaleDateString()
		res.redirect( "/mechanic/inspections/dispatch" )
	})	
})

router.get( "/check", ( req, res ) => {
	q = `
		select max( for_date ) max_date from dispatch_inspection_record
	`

	db.query( q, ( err, out ) => {
		mls = out[0].max_date.toLocaleDateString()
		console.log( "MLS: ", mls )
		console.log( "OTHER MLS: ", mech_latest_dsched )
		if( new Date( mls ) > new Date( mech_latest_dsched ) ) {
			mech_latest_dsched = mls
			res.send( "dispatch, " + mech_latest_dsched )
		} else {
			res.send( "F" )
		}
	})
})

router.post( "/", ( req, res ) => {
	r = req.body
	id = r.id
	amount = r.amount
	q = ` 
		update offense_record
		set
			penalty_amount=${ r.amount }
		where
			offense_rec_id=${ id }
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/mechanic" )
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