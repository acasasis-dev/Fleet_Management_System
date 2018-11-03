var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	const q = `
		select
			a.*,
			b.*,
			c.driver_fn, c.driver_mn, c.driver_ln,
			f.route_from, f.route_to,
			g.unitplate_no
		from
			arrival_record a join
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
			d.unitnum_id=g.unitnum_id
	`

	db.query( q, ( err, out ) => {
		if( err )
			console.log( err )
		res.render( "DispatcherArrival", {
			arrivals: out
		})
	})	
})

router.post( "/", ( req, res ) => {
	id = req.body.id
	boundary_type = req.body.boundary_type
	const q = `
		update arrival_record
		set
			time_arrived=now(),
			staff_id=${ req.session.user.staff_id }
		where
			sched_id=${ id } and
			for_date=date( now() )
	`

	db.query( q, ( err, out ) => {
		if( err )
			console.log( err )
		const insert_q = `
			insert into	
				arrival_inspection_record(
					sched_id,
					for_date
				) values(
					${ id },
					date( now() )
				)
		`

		db.query( insert_q, ( err, out ) => {
			if( err )
				console.log( err )
			req_q = `
				select
					a.*,
					b.*,
					c.*,
					d.*,
					e.*,
					f.*,
					h.*,
					time( i.sctype_to ) - time( i.sctype_from ) as tdiff
				from
					schedule a join
					drivers b join
					unit c join
					unit_type d join
					unit_number e join
					unit_route f join
					route g join
					unit_boundary h join
					sched_type i
				on
					a.sched_id=${ id } and
					a.driver_id=b.driver_id and
					a.unit_id=c.unit_id and
					c.unittype_id=d.unittype_id and
					c.unitnum_id=e.unitnum_id and
					c.unitroute_id=f.unitroute_id and
					f.route_id=g.route_id and
					c.unit_boundary_id=h.unit_boundary_id and
					a.sctype_id=i.sctype_id;					
				select time_dispatched from dispatching_record where sched_id=${ id }				
			`

			db.query( req_q, ( err, out ) => {
				console.log( "OUT:", out )
				console.log( "ID:", id, "!!!" )
				o = out[0][0]
				minimum = o.unittype_minimum
				time_dispatched = out[1][0].time_dispatched.toTimeString().split( " " )[0]
				time_arrived = new Date().toTimeString().split( " " )[0]

				console.log( time_dispatched, time_arrived )

				reqs = o.sctype_id == 1?
									[ o.morning_boundary, Math.abs( o.tdiff / 10000 ) ]:
									o.sctype_id == 2?
										[ o.afternoon_boundary, Math.abs( o.tdiff / 10000 ) ]:
										[ o.wholeday_boundary, Math.abs( o.tdiff / 10000 ) ]
				console.log( reqs )
				req_amount = reqs[0]
				req_hours = reqs[1]
				rate_per_hour = Number( req_amount ) / req_hours

				console.log( "RPH:", rate_per_hour )

				time_diff_q = `
					select time( "${ time_arrived }" ) - time( "${ time_dispatched }" ) as time_diff
				`
				db.query( time_diff_q, ( err, out ) => {
					time_diff = Math.abs( out[0].time_diff / 10000 )
					short_b = Math.round( rate_per_hour * time_diff ) < minimum? minimum: Math.round( rate_per_hour * time_diff )
					console.log( "TIME DIFF:", time_diff )
					final_rate = boundary_type == 2? short_b: req_amount
					console.log( "FINAL RATE:", final_rate )

					console.log( "BOUNDARY TYPE:", boundary_type )
					boundary_q = `
						insert into
							boundary_record(
								sched_id,
								amount,
								brecord_type,
								for_date
							) values(
								${ id },
								${ final_rate },
								${ boundary_type },
								date( now() )
							)
					`

					console.log( boundary_q )
					db.query( boundary_q, ( err, out ) => {
						console.log( err? err: "" )
						res.redirect( "/dispatcher/arrival" )
					})
				})								
			})
		})		
	})
})

module.exports = router