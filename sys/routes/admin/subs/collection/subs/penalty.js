var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			b.*,
			c.*,
			d.*,
			if( sum( e.paid ) is null,
				0,
				sum( e.paid )
			) as paid,
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
			a.driver_id=d.driver_id left join
			penalty_payment_log e
			on
				a.offense_rec_id=e.offense_rec_id
		group by
			a.offense_rec_id,
			d.driver_fn, d.driver_mn, d.driver_ln
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "")
		res.render( "Penalty", {
			offense_records: out
		})
	})	
})

module.exports = router