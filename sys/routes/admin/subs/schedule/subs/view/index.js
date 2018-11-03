var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	r = req.query
	date = r.date

	const q = `
		select * from drivers where driver_type_id=2;
		select
			schedule.*,
			unit.*,
			unit_number.*,
			route.*,
			unit_type.*,
			drivers.driver_fn, drivers.driver_mn, drivers.driver_ln,
			dispatch_inspection_record.dispatch_inspection_id,
			sched_type.*,
			if( offense_record.penalty_id is null,
				0,
				offense_record.penalty_id
			) as penalty_id,
			shift_lift.sctype_id as sctype_id_temp		
		from
			schedule join
			unit join
			unit_number join
			unit_route join
			unit_type join
			drivers join
			route join
			sched_type
		on
			"${ date }" between schedule.sched_from and schedule.sched_to and
			schedule.unit_id=unit.unit_id and
			if( schedule.reliever_id is not null and schedule.relieve_date="${ date }",
				schedule.reliever_id=drivers.driver_id,
				schedule.driver_id=drivers.driver_id
			) and
			schedule.sctype_id=sched_type.sctype_id and
			dayname( "${ date }" )!=unit.unit_coding and
			unit.unitnum_id=unit_number.unitnum_id and
			unit.unitroute_id=unit_route.unitroute_id and
			unit_route.route_id=route.route_id and
			unit.unittype_id=unit_type.unittype_id left join
				dispatch_inspection_record
					on
						schedule.sched_id=dispatch_inspection_record.sched_id and
						dispatch_inspection_record.for_date="${ date }" left join
						offense_record
						on
							if( schedule.reliever_id is not null and schedule.relieve_date="${ date }",
								schedule.reliever_id=offense_record.driver_id,
								schedule.driver_id=offense_record.driver_id
							) left join
							shift_lift
							on
								shift_lift.sched_id=schedule.sched_id;
		select
			schedule.*,
			unit.*,
			unit_number.*,
			route.*,
			unit_type.*,
			drivers.driver_fn, drivers.driver_mn, drivers.driver_ln,			
			sched_type.*,
			code_lift.*,
			if( offense_record.penalty_id is null,
				0,
				offense_record.penalty_id
			) as penalty_id,
			shift_lift.sctype_id as sctype_id_temp		
		from
			schedule join
			unit join
			unit_number join
			unit_route join
			unit_type join
			drivers join
			route join
			code_lift join
			sched_type
		on
			"${ date }" between schedule.sched_from and schedule.sched_to and			
			schedule.unit_id=unit.unit_id and
			( case when( schedule.reliever_id is not null and schedule.relieve_date="${ date }" )
				then
					schedule.reliever_id=drivers.driver_id
				else					
					schedule.driver_id=drivers.driver_id
				end
			) and
			schedule.sctype_id=sched_type.sctype_id and
			unit.unitnum_id=unit_number.unitnum_id and
			unit.unitroute_id=unit_route.unitroute_id and
			unit_route.route_id=route.route_id and
			unit.unittype_id=unit_type.unittype_id  left join
			offense_record
			on
				( case when( schedule.reliever_id is null )
					then
						schedule.driver_id=offense_record.driver_id
					else
						schedule.reliever_id=offense_record.driver_id
					end
				) left join
				shift_lift
				on
					shift_lift.sched_id=schedule.sched_id
		where
			code_lift.for_date="${ date }" and
			code_lift.route_id=route.route_id
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		ids = []
		records = []

		out[1].forEach( cur => {
			ids.push( cur.sched_id )
			records.push( cur )
		})


		out[2].forEach( cur => {
			if( ids.indexOf( cur.sched_id ) == -1 ) {
				ids.push( cur.sched_id )
				records.push( cur )
			}
		})

		res.render( "ScheduleView", {
			relievers: out[0],
			schedules: records,
			sched_date: date,
			edited: req.query.edited,
			cant: req.query.cant
		})
	})
})

router.post( "/send", ( req, res ) => {
	r = req.body
	date = r.date
	const q = `
		select
			schedule.*			
		from
			schedule join
			unit
		on
			"${ date }" between schedule.sched_from and schedule.sched_to and
			schedule.unit_id=unit.unit_id and
			dayname( "${ date }" )!=unit.unit_coding;
		select
			schedule.*			
		from
			schedule,
			unit,
			unit_route,
			route,
			code_lift
		where
			"${ date }" between schedule.sched_from and schedule.sched_to and
			schedule.unit_id=unit.unit_id and
			unit.unitroute_id=unit_route.unitroute_id and
			unit_route.route_id=route.route_id and
			code_lift.for_date="${ date }" and
			code_lift.route_id=route.route_id

	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		insert_q = `
			insert into
				dispatch_inspection_record(
					sched_id,
					for_date
				) values
		`
		ids = []
		inserts = []

		out[0].forEach( cur => {
			ids.push( cur.sched_id )
			inserts.push( `
				(
					${ cur.sched_id },
					"${ date }"
				)
			`)
		})


		out[1].forEach( cur => {
			if( ids.indexOf( cur.sched_id ) == -1 ) {
				ids.push( cur.sched_id )
				inserts.push( `
					(
						${ cur.sched_id },
						"${ date }"
					)
				`)		
			}
		})


		inserts.join( ", " )
		insert_q += inserts

		console.log( insert_q )
		db.query( insert_q, ( err, out ) => {
			if( err )
				console.log( err )
			res.redirect( "/admin/schedule/view?date=" + r.date )	
		})
	})	
})

router.post( "/edit", ( req, res ) => { 
	r = req.body
	date = r.date
	id = r.id
	uid = r.uid
	reliever = r.reliever
	sctype = r.sctype
	i = []

	const units_w_dups_q = `
		select
			unit_id
		from
			schedule
		where
			"${ date }" between sched_from and sched_to
		group by
			unit_id
		having 
			count( unit_id )=2
	`

	db.query( units_w_dups_q, ( err, out ) => {
		console.log( err? err: "" )
		uwd = []
		out.forEach( cur => {
			uwd.push( cur.unit_id )
		})

		console.log( uwd )
		console.log( "UNIT ID !!!", uid )
		console.log( "BOOL !!!", uwd.indexOf( Number( uid ) ) != -1 )
		if( uwd.indexOf( Number( uid ) ) != -1 && ( sctype == 3 || sctype == 6 ) ) {
			res.redirect( "/admin/schedule/view?date=" + r.date + "&cant" )
		} else {
			if( sctype < 4 ) {
				if( reliever )
					i.push( `reliever_id=${ reliever }, relieve_date=date( "${ date }" )` )
				if( sctype )
					i.push( `sctype_id=${ sctype }` )
				i = i.join( ", " )

				q = `
					delete from shift_lift where sched_id=${ id } and for_date=date( "${ date }" );
					delete from shift_lift where sched_id=(
						select a.sched_id
						from (
							select sched_id
							from schedule
							where
								sched_id!=${ id } and
								unit_id=${ uid } and
								"${ date }" between sched_from and sched_to
						) as a
					) and for_date=date( "${ date }" );
					update schedule
					set ` + i + `
					where
						sched_id=${ id };			
				`

				if( sctype != 3 ) {
					q += `
						update schedule
						set sctype_id=${ sctype == 1? 2: 1 }
						where
							sched_id=(
								select a.sched_id
								from (
									select sched_id
									from schedule
									where
										sched_id!=${ id } and
										unit_id=${ uid } and
										"${ date }" between sched_from and sched_to
								) as a
							)
					`
				}

				console.log( q )

				if( reliever || sctype ) {
					db.query( q, ( err, out ) => {
						console.log( err? err: "" )
						res.redirect( "/admin/schedule/view?date=" + r.date + "&edited" )
					})
				} else {
					res.redirect( "/admin/schedule/view?date=" + r.date )
				}
			} else {		
				q = `
					delete from shift_lift where sched_id=${ id } and for_date=date( "${ date }" );
					delete from shift_lift where sched_id=(
						select a.sched_id
						from (
							select sched_id
							from schedule
							where
								sched_id!=${ id } and
								unit_id=${ uid } and
								"${ date }" between sched_from and sched_to
						) as a
					) and for_date=date( "${ date }" );
					insert into shift_lift( sched_id, sctype_id, for_date ) values( ${ id }, ${ sctype - 3 }, date( "${ date }" ) );
					insert into shift_lift( sched_id, sctype_id, for_date ) values( (
						select a.sched_id
						from (
							select sched_id
							from schedule
							where
								sched_id!=${ id } and
								unit_id=${ uid } and
								"${ date }" between sched_from and sched_to
						) as a
					), ${ sctype - 3 == 1? 2: 1 }, date( "${ date }" ) );
				`

				if( reliever ) {
					q += `
						update schedule
						set reliever_id=${ reliever }, relieve_date=date( "${ date }" )
						where
							sched_id=${ id }
					`
				}

				console.log( q )

				db.query( q, ( err, out ) => {
					console.log( err? err: "" )
					res.redirect( "/admin/schedule/view?date=" + r.date + "&edited" )	
				})
			}
		}
	})	
})

module.exports = router