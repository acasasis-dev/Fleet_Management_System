var router = require( "express" ).Router()
var db = require( "db" )()
var drivers = []
var fs = require( "fs" )

fs.readdir( __dirname + "/subs", ( err, mods ) => {
	mods.forEach( cur => {
		route = cur.split( "." )[0]
		router.use( `/${ route }`, require( `./subs/${ route }` ) )
	})
})

router.get( "/", ( req, res ) => {
	const q = `
		select distinct sched_from, sched_to from schedule;
		select * from route
	`


	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.render( "Schedule", {
			schedules: out[0],
			routes: out[1]
		})
	})
})

router.get( "/generate", ( req, res ) => {
	const units_w_dups_q = `
		select
			unit_id
		from
			drivers
		group by
			unit_id
		having 
			count( unit_id )=2
	`	
	const max_sched_check_q = `select max( sched_to ) as max_sched from schedule`

	db.query( max_sched_check_q, ( err, out ) => {
		if( out[0].max_sched ) {			
			ms = new Date( out[0].max_sched )
			year = ms.getFullYear()
			month = ms.getMonth() + 1
			day = ms.getDate()
			max_sched = year + "-" + month + "-" + day
			console.log( "MAX SCHED:", max_sched )
			ms = new Date( max_sched )			
			ms.setDate( ms.getDate() + 1 )
			year = ms.getFullYear()
			month = ms.getMonth() + 1
			day = ms.getDate()
			tom = year + "-" + month + "-" + day
			ms = new Date( max_sched )
			ms.setDate( ms.getDate() + 7 )
			year = ms.getFullYear()
			month = ms.getMonth() + 1
			day = ms.getDate()
			end = year + "-" + month + "-" + day
		} else {
			ms = new Date()
			ms.setDate( ms.getDate() + 1 )
			year = ms.getFullYear()
			month = ms.getMonth() + 1
			day = ms.getDate()
			tom = year + "-" + month + "-" + day
			ms = new Date()
			ms.setDate( ms.getDate() + 7 )
			year = ms.getFullYear()
			month = ms.getMonth() + 1
			day = ms.getDate()
			end = year + "-" + month + "-" + day
		}

		db.query( units_w_dups_q, ( err, out ) => {
			uwd = []
			out.forEach( cur => {
				uwd.push( cur.unit_id )
			})

			if( typeof( max_sched ) == "undefined" ) {
				console.log( "ENTERED NO MAX SCHED" )
				const driver_q = `select * from drivers where driver_type_id=1`

				db.query( driver_q, ( err, out ) => {
					insert_q = `
						insert into
							schedule(
								driver_id,
								unit_id,
								sctype_id,
								sched_from,
								sched_to
							) values 
					`
					inserts = []
					inserted = []

					out.forEach( driver => {
						console.log( inserted )
						if( uwd.indexOf( driver.unit_id ) != -1 ) {
							if( inserted.indexOf( driver.unit_id ) != -1 ) {
								inserts.push( `
									(
										${ driver.driver_id },
										${ driver.unit_id },
										2,
										"${ tom }",
										"${ end }"
									)
								` )
							} else {
								inserts.push( `
									(
										${ driver.driver_id },
										${ driver.unit_id },
										1,
										"${ tom }",
										"${ end }"
									)
								` )

								inserted.push( driver.unit_id )
							}
						} else {
							inserts.push( `
								(
									${ driver.driver_id },
									${ driver.unit_id },
									3,
									"${ tom }",
									"${ end }"
								)
							` )
						}
					})

					inserts = inserts.join( ", " )
					insert_q += inserts

					console.log( insert_q )
					
					db.query( insert_q, ( err, out ) => {
						if( err ) console.log( err )
						res.redirect( "/admin/schedule" )
					})
				})
			} else {
				console.log( "ENTERED MAX SCHED", max_sched )
				driver_q = `
					select distinct
						a.driver_id,
						a.unit_id,
						b.sctype_id
					from
						drivers a left join
						schedule b
					on
						a.driver_type_id=1 and
						a.driver_id=b.driver_id and
						b.sched_to="${ max_sched }"
					where
						a.driver_type_id=1
				`
				console.log( driver_q )

				db.query( driver_q, ( err, out ) => {
					console.log( out )
					insert_q = `
						insert into
							schedule(
								driver_id,
								unit_id,
								sctype_id,
								sched_from,
								sched_to
							) values 
					`
					inserts = []
					m_inserted = []
					a_inserted = []

					out.forEach( driver => {
						if( uwd.indexOf( driver.unit_id ) != -1 ) {
							if( !driver.sctype_id || driver.sctype_id == 3 ) {
								if( m_inserted.indexOf( driver.unit_id ) != -1 ) {
									sctype = "2"
									a_inserted.push( driver.unit_id )
								} else {
									sctype = "1"
									m_inserted.push( driver.unit_id )
								}
							} else {
								if( driver.sctype_id == 1 ) {
									if( a_inserted.indexOf( driver.unit_id ) != -1 ) {
										sctype = "1"
										m_inserted.push( driver.unit_id )
									} else {
										sctype = "2"
										a_inserted.push( driver.unit_id )
									}
								} else {
									if( m_inserted.indexOf( driver.unit_id ) != -1 ) {
										sctype = "2"
										a_inserted.push( driver.unit_id )
									} else {
										sctype = "1"
										m_inserted.push( driver.unit_id )
									}	
								}
							}

							inserts.push( `
								(
									${ driver.driver_id },
									${ driver.unit_id },
									${ sctype },
									"${ tom }", 
									"${ end }"
								)
							` )
						} else {
							inserts.push( `
								(
									${ driver.driver_id },
									${ driver.unit_id },
									3,
									"${ tom }",
									"${ end }"
								)
							` )
						}
					})

					inserts = inserts.join( ", " )
					insert_q += inserts
					console.log( insert_q )
					
					db.query( insert_q, ( err, out ) => {
						console.log( err? err: "" )
						res.redirect( "/admin/schedule" )
					})
				})
			}
		})
	})
})

router.post( "/code_lift", ( req, res ) => {
	r = req.body
	inserts = []
	console.log( "REQ BODY:", r )

	q = `
		insert into code_lift( route_id, for_date ) values
	`

	if( typeof( r.routes ) == "object" ) {
		r.routes.forEach( cur => {
			inserts.push( `
				( ${ cur }, "${ r.date }" )
			`)
		})
	} else {
		inserts.push( `
			( ${ r.routes }, "${ r.date }" )
		`)
	}

	q += inserts.join( ", " )
	console.log( q )

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/admin/schedule" )
	})	
})

module.exports = router