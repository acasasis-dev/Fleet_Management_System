var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	res.render( "MechanicRepair" )
})

router.get( "/requests", ( req, res ) => {
	q = `
		select
			a.*,
			b.*,
			c.*,
			d.repair_report_id, d.repair_status
		from
			for_repair a join
			unit b join
			unit_number c
		on
			a.unit_id=b.unit_id and
			b.unitnum_id=c.unitnum_id left join
			repair_report d
				on
					a.for_repairs_id=d.for_repair_id
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		console.log( out )
		res.render( "MechanicRepairRequests", {
			requests: out
		})
	})	
})

router.post( "/requests", ( req, res ) => {
	q = `
		update for_repair
		set
			for_repairs_status="Under Repair"
		where
			for_repairs_id=${ req.body.id }
	`

	q0 = `
		insert into
			repair_report(
				for_repair_id,
				repair_report_content,
				repair_status
			) values(
				${ req.body.id },
				NULL,
				NULL
			)
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )

		db.query( q0, ( err, out ) => {
			console.log( err? err: "" )
			res.redirect( "/mechanic/repair/requests" )
		})		
	})	
})

router.post( "/fixation", ( req, res ) =>{
	r = req.body
	id = r.id
	fid = r.fid
	status = r.status
	content = r.content

	q = `
		update repair_report
		set
			repair_report_content="${ content }",
			repair_status="${ status }"
		where
			repair_report_id=${ id };
		update for_repair
		set
			for_repairs_status="${ status == 1? "Fixed": "Unfixed" }"
		where
			for_repairs_id=${ fid }
	`

	db.query( q, ( err, out ) =>{
		console.log( err? err: "" )
		an_q = `
			insert into
				admin_notifs(
					an_desc,
					seen,
					for_date
				) values(
					concat(
						(
							select
								c.unitplate_no
							from
								for_repair a join
								unit b join
								unit_number c
							on
								a.for_repairs_id=${ fid } and
								a.unit_id=b.unit_id and
								b.unitnum_id=c.unitnum_id
						), ", has been ${ status == 1? "fixed": "unfixed" } by ",
						(
							select 
								concat( staff_ln, ", ", staff_fn, " ", staff_mn )
							from
								staffs
							where
								staff_id=${ req.session.user.staff_id }
						) 
					),
					0,
					now()
				)
		`

		console.log( an_q )
		db.query( an_q, ( err, out ) => {
			console.log( err? err: "" )
			res.redirect( "/mechanic/repair/requests" )
		})		
	})
})

module.exports = router