var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			b.*,
			if( sum( c.paid ) is null,
				0,
				sum( c.paid )
			) as paid,
			if( a.penalty_amount - sum( c.paid ) is null,
				a.penalty_amount,
				a.penalty_amount - sum( c.paid )
			) as balance
		from
			offense_record a join
			drivers b
		on
			a.driver_id=b.driver_id left join
			penalty_payment_log c
			on
				a.offense_rec_id=c.offense_rec_id
		group by
			a.offense_rec_id,
			c.pplog_id,
			b.driver_fn, b.driver_mn, b.driver_ln
	`

	console.log( q )
	db.query( q, ( err, out ) => {
		console.log( out )
		console.log( err? err: "" )
		res.render( "collector/PenaltyRecord", {
			penalty_records: out
		})
	})	
})

router.post( "/", ( req, res ) => {
	r = req.body
	id = r.id
	amount = r.amount
	q = `
		insert into
			penalty_payment_log(
				offense_rec_id,
				paid,
				pplog_time,
				staff_id
			) values(
				${ id },
				${ amount },
				current_timestamp(),
				${ req.session.user.staff_id }
			)
	`

	console.log( q )
	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/collector/records/penalty" )
	})	
})

module.exports = router