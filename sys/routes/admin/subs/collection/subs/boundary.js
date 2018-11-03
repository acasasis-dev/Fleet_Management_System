var router = require( "express" ).Router()
var db = require( "db" )() 

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			b.*,
			c.*,
			d.*,
			e.*,
			f.*,
			if( sum( g.paid ) is null,
				0,
				sum( g.paid )
			) as paid,
			if( a.amount - sum( g.paid ) is null,
				a.amount,
				a.amount - sum( g.paid )
			) as balance
		from
			boundary_record a join
			schedule b join
			sched_type c join
			drivers d join
			unit e join
			unit_number f
		on
			a.sched_id=b.sched_id and
			b.sctype_id=c.sctype_id and
			b.driver_id=d.driver_id and
			b.unit_id=e.unit_id and
			e.unitnum_id=f.unitnum_id left join
			payment_log g
			on
				a.brecord_id=g.brecord_id
		group by
			a.brecord_id,
			d.driver_fn, d.driver_mn, d.driver_ln
	`

	db.query( q, ( err, out ) => {
		res.render( "Boundary", {
			boundary_records: out
		})
	})	
})

module.exports = router