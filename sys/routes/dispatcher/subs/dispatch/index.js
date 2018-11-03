var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	const q = `
		select
			a.*,
			b.*,
			c.driver_fn, c.driver_mn, c.driver_ln,
			f.route_from, f.route_to,
			g.unitplate_no,
			h.time_dispatched
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
			a.u_inspection_status=1 and
			a.for_date=date( now() ) and
			b.driver_id=c.driver_id and
			b.unit_id=d.unit_id and
			d.unitroute_id=e.unitroute_id and
			e.route_id=f.route_id and
			d.unitnum_id=g.unitnum_id
		left join
			dispatching_record h
		on
			h.sched_id=a.sched_id and
			a.for_date=h.for_date
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		console.log( err? err: "" )
		res.render( "DispatcherDispatch", {
			dispatches: out
		})
	})
})

router.post( "/", ( req, res ) => {
	r = req.body
	id = r.id

	const q = `
		insert into
			dispatching_record(
				sched_id,
				time_dispatched,
				staff_id,
				for_date
			) values(
				${ id },
				now(),
				${ req.session.user.staff_id },
				date( now() )
			)
	`

	db.query( q, ( err, out ) => {
		const aq = `
			insert into
				arrival_record(
					sched_id,
					time_arrived,
					staff_id,
					for_date
				) values(
					${ id },
					NULL,
					NULL,
					date( now() )
				)
		`

		db.query( aq, ( err, out ) => {
			res.redirect( "/dispatcher/dispatch" )
		})		
	})
})

module.exports = router