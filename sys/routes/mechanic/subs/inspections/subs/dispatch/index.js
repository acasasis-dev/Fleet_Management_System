var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	const q = `
		select
			a.*,
			b.*,
			c.driver_id, c.driver_fn, c.driver_mn, c.driver_ln,
			d.*,
			f.route_from, f.route_to,
			g.unitplate_no,
			h.offense_rec_id,
			i.u_inspection_status as arrival_status,
			j.for_repairs_status as repair_availability,
			k.sctype_id as sctype_id_temp,
			l.*,
			m.*
		from
			dispatch_inspection_record a join
			schedule b join
			drivers c join
			unit d join
			unit_route e join
			route f join
			unit_number g
		on
			a.sched_id=b.sched_id and
			a.for_date=date( now() ) and
			b.driver_id=c.driver_id and
			b.unit_id=d.unit_id and
			d.unitroute_id=e.unitroute_id and
			e.route_id=f.route_id and
			d.unitnum_id=g.unitnum_id left join
			offense_record h
			on
				b.driver_id=h.driver_id and
				h.for_date=date( now() ) left join
				arrival_inspection_record i
				on
					i.sched_id=a.sched_id and
					i.for_date=a.for_date left join
					for_repair j
					on
						b.unit_id=j.unit_id and
						j.for_repairs_status!="Fixed" left join
						shift_lift k
						on
							k.sched_id=b.sched_id and
							k.for_date=date( now() ) left join
							unit_body_inspection l
								on
									a.u_parts_inspection_id=l.u_parts_inspection_id left join
								\`unit_engine/fluid_inspection\` m
									on
										a.u_ef_inspection_id=m.u_ef_inspection_id
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: out )
		morning_dispatched = []

		out.forEach( cur => {
			if( cur.sctype_id == 1 ) {
				morning_dispatched.push(
					{
						"unit": cur.unit_id,
						"available": cur.arrival_status? cur.arrival_status: 0
					}
				)
			}
		})

		res.render( "MechanicDispatch", {
			dispatches: out,
			mdispatches: morning_dispatched
		})
	})
})

router.post( "/inspect", ( req, res ) => {
	r = req.body
	id = r.diid
	comment = r.comment
	brake = r.brake? 1: 0
	light = r.lights? 1: 0
	mirror = r.mirror? 1: 0
	horn = r.horn? 1: 0
	tires = r.tires? 1: 0
	steer = r.smechanism? 1: 0
	seatbelt = r.seatbelts? 1: 0
	door = r.doors? 1: 0
	air_conditioning = r.aconditioning? 1: 0
	body_condition = r.bcondition? 1: 0
	cleanliness = r.cliness? 1: 0
	fuel = r.fuel
	engine_oil = r.eoil
	brake_fluid = r.bfluid
	battery_charge = r.bcharge
	if( brake == 0 || 
		light == 0 || 
		mirror == 0 || 
		horn == 0 || 
		tires == 0 || 
		steer == 0 || 
		seatbelt == 0 || 
		door == 0 || 
		air_conditioning == 0 || 
		body_condition == 0 || 
		cleanliness == 0 ||
		fuel == "Low" ||
		engine_oil == "Low" ||
		brake_fluid == "Low" ||
		battery_charge == "Low"  )
			status = 0
	else
		status = 1

	const body_insp_q = `
		insert into
			unit_body_inspection(
				brake,
				light,
				mirror,
				horn,
				tires,
				steer,
				seatbelt,
				door,
				air_conditioning,
				body_condition,
				cleanliness
			) values(
				${ brake },
				${ light },
				${ mirror },
				${ horn },
				${ tires },
				${ steer },
				${ seatbelt },
				${ door },
				${ air_conditioning },
				${ body_condition },
				${ cleanliness }
			)
	`

	console.log( body_insp_q )
	db.query( body_insp_q, ( err, out ) => {
		if( err )
			console.log( err )
		biid = out.insertId
		liquid_insp_q = `
			insert into
				\`unit_engine/fluid_inspection\`(
					fuel,
					engine_oil,
					brake_fluid,
					battery_charge
				) values(
					"${ fuel }",
					"${ engine_oil }",
					"${ brake_fluid }",
					"${ battery_charge }"
				)
		`

		console.log( liquid_insp_q )
		db.query( liquid_insp_q, ( err, out ) => {
			if( err )
				console.log( err )
			liid = out.insertId
			edit_q = `
				update dispatch_inspection_record
				set
					staff_id=${ req.session.user.staff_id },
					inspection_time=now(),
					u_parts_inspection_id=${ biid },
					u_ef_inspection_id=${ liid },
					u_inspection_comment="${ comment }",
					u_inspection_status=${ status }
				where
					dispatch_inspection_id=${ id }
			`

			console.log( edit_q )
			db.query( edit_q, ( err, out ) => {
				if( err )
					console.log( err )
				if( status == 0 ) {
					an_q = `
						insert into
							admin_notifs(
								an_desc,
								seen,
								for_date
							) values(
								concat( ( 
									select 
										unitplate_no 
									from 
										dispatch_inspection_record a join
										schedule b join
										unit c join 
										unit_number d 
									on
										a.dispatch_inspection_id=${ id } and
										a.sched_id=b.sched_id and
										b.unit_id=c.unit_id and
										c.unitnum_id=d.unitnum_id
								), ", inspected by ", (
									select
										concat( a.staff_ln, ", ", a.staff_fn, " ", a.staff_mn )
									from
										staffs a
									where
										a.staff_id=${ req.session.user.staff_id }
								), ", has failed to dispatch" ),
								0,
								now()
							)
					`

					db.query( an_q, ( err, out ) => {
						console.log( err? err: "" )
						res.redirect( "/mechanic/inspections/dispatch" )
					})
				} else {
					res.redirect( "/mechanic/inspections/dispatch" )
				}				
			})
		})
	})	
})

module.exports = router