var router = require( "express" ).Router()
var db = require( "db" )()
failed = 0
failed_form = {}
fdesc = ""
added = 0
deleted = 0
edited = 0

router.get( "/", ( req, res ) => {
	const q = `
		select * from unit_type where unittype_status=1;
		select * from route;
		select
			unit.*,
			unit_type.*,
			unit_number.*,
			unit_route.*,
			route.*,
			brand.*
		from
			unit,
			unit_type,
			unit_number,
			unit_route,
			route,
			brand,
			unit_boundary
		where
			unit.unittype_id=unit_type.unittype_id and
			unit.unitnum_id=unit_number.unitnum_id and
			unit.unitroute_id=unit_route.unitroute_id and
			unit_route.route_id=route.route_id and
			unit.brand_id=brand.brand_id and
			unit.unit_boundary_id=unit_boundary.unit_boundary_id;
	`

	db.query( q, ( err, out ) => {		
		res.render( "Unit", {
			unit_types: out[0],
			routes: out[1],
			units: out[2],
			fform: failed == 1? failed_form: {},
			fdesc: fdesc,
			added: added,
			deleted: deleted,
			edited: edited
		})	
		failed = 0
		fform = {}
		fdesc = ""
		added = 0
		deleted = 0
		edited = 0		
	})
})

router.get( "/typedef", ( req, res ) => {
	const q = `
		select
			brand_unit_type.brand_id,
			brand.brand_desc
		from 
			brand_unit_type,
			brand
		where 
			brand_unit_type.unittype_id=${ req.query.utype } and
			brand_unit_type.brand_id=brand.brand_id
	`

	db.query( q, ( err, out ) => {
		tmp = []

		out.forEach( cur => {			
				tmp.push( cur.brand_id + ", " + cur.brand_desc )
		})
		res.send( tmp.join( ";" ) )
	})
})

router.post( "/", ( req, res ) => {
	var r = req.body
	var utype = r.utype
	var plateno = r.plateno
	var chassino = r.chassino
	var engineno = r.engineno
	var bodyno = r.bodyno
	var route = r.route
	var rreg = r.rreg
	var rexp = new Date( rreg )
	rexp.setFullYear( rexp.getFullYear() + 5 )
	var rexp = rexp.toJSON().split( "T" )[0]
	var capt = r.capt
	var model = r.model
	var brand = r.brand
	var coding = Number( plateno[ plateno.length - 1 ] )
	var days = [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" ]
	var coding = days[ Math.floor( coding / 2 ) ]
	var mbound = r.mbound
	var abound = r.abound
	var wdbound = r.wdbound
	var warranty = r.warranty
	var acquired = r.acquired
	var upregistration = r.upregistration
	console.log( r )

	const q = `
		insert into
			unit_number(
				unitplate_no,
				unitchassi_no,
				unitengine_no,
				unitbody_no
			) values(
				"${ plateno }",
				"${ chassino }",
				"${ engineno }",
				"${ bodyno }"
			);`
	const q0 = `
		insert into
			unit_route(
				route_id,
				unitroute_registered,
				unitroute_expiration
			) values(
				${ route },
				"${ rreg }",
				"${ rexp }"
			);`

	const q1 = `
		insert into
			unit_boundary(
				morning_boundary,
				afternoon_boundary,
				wholeday_boundary,
				unit_boundary_type
			) values(
				${ mbound },
				${ abound },
				${ wdbound },
				2
			)
	`
	q2 = `
		insert into
			unit(
				unittype_id,
				unitnum_id,
				unitroute_id,
				unit_capacity,
				unit_model,
				brand_id,
				unit_coding,
				unit_boundary_id,
				unit_warranty,
				unit_acquired,
				unit_plate_registration
			) values(
				${ utype },
	`
	q2_end = `
				${ capt },
				"${ model }",
				${ brand },
				"${ coding }",
	`
	q2_end_2 = `
				"${ warranty }",
				"${ acquired }",
				"${ upregistration }"
	`

	console.log( q )
	console.log( q0 )
	console.log( q1 )

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		if( err ) {
						failed = 1
						failed_form = r
						if( err.code == "ER_DUP_ENTRY" )
							fdesc = "Unit already exists"
						res.redirect( "/admin/maintenance/unit" )
		} else {
		unum = out.insertId

		db.query( q0, ( err, out ) => {
			console.log( err? err: "" )
			if( err ) {
						failed = 1
						failed_form = r
						if( err.code == "ER_DUP_ENTRY" )
							fdesc = "Unit already exists"
					} else {
						added = 1
					}
			uroute = out.insertId

			db.query( q1, ( err, out ) => {
				console.log( err? err: "" )
				if( err ) {
						failed = 1
						failed_form = r
						if( err.code == "ER_DUP_ENTRY" )
							fdesc = "Unit already exists"
					} else {
						added = 1
					}
				ubid = out.insertId
				console.log( q2 + unum + ", " + uroute + ", " + q2_end + ubid + q2_end_2 + " )" )

				db.query( q2 + unum + ", " + uroute + ", " + q2_end + ubid + ", " + q2_end_2 + " )", ( err, out ) => {
					console.log( err? err: "" )
					if( err ) {
						failed = 1
						failed_form = r
						if( err.code == "ER_DUP_ENTRY" )
							fdesc = "Unit already exists"
					} else {
						added = 1
					}
					res.redirect( "/admin/maintenance/unit" )
				})
			})			
		})
		}		
	})
})

router.post( "/edit", ( req, res ) => {
	r = req.body
	uid = r.uid
	utype = r.utype
	plateno = r.plateno
	chassino = r.chassino
	engineno = r.engineno
	bodyno = r.bodyno
	route = r.route
	rreg = r.rreg
	rexp = new Date( rreg )
	rexp.setFullYear( rexp.getFullYear() + 5 )
	rexp = rexp.toJSON().split( "T" )[0]
	capt = r.capt
	model = r.model
	brand = r.brand
	coding = Number( plateno[ plateno.length - 1 ] )
	days = [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" ]
	coding = days[ Math.floor( coding / 2 ) ]
	mbound = r.mbound
	abound = r.abound
	wdbound = r.wdbound
	console.log( r )

	const q = `
		update unit_number
			set
				unitplate_no="${ plateno }",
				unitchassi_no="${ chassino }",
				unitengine_no="${ engineno }",
				unitbody_no="${ bodyno }"
			where unitnum_id=${ uid };`
	const q1 = `
		update unit_route
			set
				route_id=${ route },
				unitroute_registered="${ rreg }",
				unitroute_expiration="${ rexp }"
			where unitroute_id=${ uid };`
	const q2 = `
		update unit
			set
				unittype_id=${ utype },
				unit_capacity=${ capt },
				unit_model="${ model }",
				brand_id="${ brand }",
				unit_coding="${ coding }"
			where unit_id=${ uid }
	`
	
	db.query( q2, ( err, out ) => {
		db.query( q1, ( err, out ) => {
			db.query( q, ( err, out ) => {
		if( !err ) {
			edited = 1
		}
			res.redirect( "/admin/maintenance/unit" )
		})
	})
	})
})

router.get( "/delete/:id", ( req, res ) => {
	var id = req.params.id

	const q = `
		delete from unit where unit_id=${ id };`
	const q1 = `
		delete from unit_number where unitnum_id=${ id };`
	const q2 = `
		delete from unit_route where unitroute_id=${ id }`
	console.log(q)
	db.query( q, ( err, out ) => {
		db.query( q1, ( err, out ) => {
			db.query( q2, ( err, out ) => {
		if( err ) {
			deleted = 2
			fdesc = "Delete failed"
		} else {
			deleted = 1
		}
		res.redirect( "/admin/maintenance/unit" )
	})
		
	})
		
	})
})

module.exports = router