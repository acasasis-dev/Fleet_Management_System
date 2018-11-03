var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	const q = `
		select
			a.*,
			b.*,
			c.driver_fn, c.driver_mn, c.driver_ln,
			d.*,
			j.*,
			f.route_from, f.route_to,
			g.unitplate_no,
			h.*, i.*,
			k.for_repairs_status as rstatus
		from
			dispatch_inspection_record a join
			schedule b join
			drivers c join
			unit d join
			unit_type j join
			unit_route e join
			route f join
			unit_number g
		on
			a.sched_id=b.sched_id and
			a.for_date=date( now() ) and
			b.driver_id=c.driver_id and
			b.unit_id=d.unit_id and
			d.unittype_id=j.unittype_id and
			d.unitroute_id=e.unitroute_id and
			e.route_id=f.route_id and
			d.unitnum_id=g.unitnum_id left join
				unit_body_inspection h
					on
						a.u_parts_inspection_id=h.u_parts_inspection_id
				left join
					\`unit_engine/fluid_inspection\` i
						on
							a.u_ef_inspection_id=i.u_ef_inspection_id left join
							for_repair k
							on
								b.unit_id=k.unit_id and
								k.for_repairs_status!="Fixed";
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		console.log( out)
		res.render( "DispatchInspectionReport", {
			dispatch_reports: out,
		})
	})
})

router.post( "/let", ( req, res ) => {
	q = `
		update dispatch_inspection_record
		set
			u_inspection_status=1
		where
			dispatch_inspection_id=${ req.body.id }
	`

	db.query( q, ( err, out ) => {
		res.redirect( "/admin/reports/inspections/dispatch" )
	})
})

router.post( "/repair", ( req, res ) => {
	console.log( req.body )
	r = req.body
	unit = r.uid
	deadl = r.date
	content = r.content

	q = `
		insert into
			for_repair(
				staff_id,
				unit_id,
				for_repairs_deadline,
				for_repairs_content,
				for_repairs_status,
				recorded
			) values(
				NULL,
				${ unit },
				"${ deadl }",
				"${ content }",
				"Pending",
				date( now() )
			)
	`

	console.log( q )
	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/admin/reports/inspections/dispatch" )
	})
})

router.post( "/warranty_repair", ( req, res ) => {
	id = req.body.id
	
	q = `
		insert into
			for_repair(
				staff_id,
				unit_id,
				for_repairs_deadline,
				for_repairs_content,
				for_repairs_status,
				recorded
			) values(
				NULL,
				${ id },
				NULL,
				NULL,
				"Warranty Repair",
				date( now() )
			)
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/admin/reports/inspections/dispatch" )
	})	
})

module.exports = router