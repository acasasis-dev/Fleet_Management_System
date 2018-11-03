var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			b.*,
			c.*,
			d.*,
			e.*
		from			
			for_repair a join
			unit b join
			unit_number c
		on
			a.unit_id=b.unit_id and
			b.unitnum_id=c.unitnum_id left join
				staffs d
				on
					a.staff_id=d.staff_id left join
					repair_report e
					on
						a.for_repairs_id=e.for_repair_id
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.render( "OperatorRepair", {
			repair_reports: out
		})
	})	
})

router.post( "/", ( req, res ) => {
	q = `
		update for_repair
		set
			for_repairs_status="Fixed"
		where
			for_repairs_id=${ req.body.id }		
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/admin/repair" )
	})	
})

module.exports = router