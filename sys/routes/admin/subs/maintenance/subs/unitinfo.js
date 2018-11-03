var router = require( "express" ).Router()
var db = require( "db" )()
fdesc = ""
added = 0
deleted = 0
edited = 0

router.get( "/", ( req, res ) => {
	unit = req.query.unit

	const q = `
		select
			unit.*,
			unit_number.*,
			unit_route.*,
			route.*,
			brand.*,
			unit_boundary.morning_boundary, unit_boundary.afternoon_boundary, unit_boundary.wholeday_boundary
		from
			unit,
			unit_number,
			unit_route,
			route,
			brand,
			unit_boundary
		where
			unit.unit_id=${ unit } and
			unit.unitnum_id=unit_number.unitnum_id and
			unit.unitroute_id=unit_route.unitroute_id and
			unit_route.route_id=route.route_id and
			unit.brand_id=brand.brand_id and
			unit.unit_boundary_id=unit_boundary.unit_boundary_id;
		select * from unit_type where unittype_status=1;
		select * from route;
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )	
		res.render( "UnitInformation", {
			unit_info: out[0],
			unit_types: out[1],
			routes: out[2],
			id: req.query.unit,
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

router.post( "/", ( req, res ) => {
	var r = req.body
	var id = r.id
	var utype = r.utype
	var plateno = r.plateno
	var chassino = r.chassino
	var engineno = r.engineno
	var bodyno = r.bodyno
	var route = r.uroute
	var rreg = r.rreg
	var rexp = new Date( rreg )
	rexp.setFullYear( rexp.getFullYear() + 5 )
	var rexp = rexp.toJSON().split( "T" )[0]
	var capt = r.capt
	var model = r.model 
	var brand = r.ubrand
	var coding = Number( plateno[ plateno.length - 1 ] )
	var days = [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" ]
	var coding = days[ Math.floor( coding / 2 ) ]
	var mbound = r.mbound
	var abound = r.abound
	var wdbound = r.wdbound
	var warranty = r.warranty
	var acquired = r.acquired
	var upregistration = r.upregistration

	const q = `
		update unit_number
			set
				unitplate_no="${ plateno }",
				unitchassi_no="${ chassino }",
				unitengine_no="${ engineno }",
				unitbody_no="${ bodyno }"
			where unitnum_id=(
				select unitnum_id from unit where unit_id=${ id }
			);`
	const q1 = `
		update unit_route
			set
				route_id=${ route },
				unitroute_registered="${ rreg }",
				unitroute_expiration="${ rexp }"
			where unitroute_id=(
				select unitroute_id from unit where unit_id=${ id }
			);`
	const q2 = `
		update unit_boundary
			set
				morning_boundary=${ mbound },
				afternoon_boundary=${ abound },
				wholeday_boundary=${ wdbound }
			where
				unit_boundary_id=(
					select unit_boundary_id from unit where unit_id=${ id }
				)
	`
	const q3 = `
		update unit
			set
				unittype_id=${ utype },
				unit_capacity=${ capt },
				unit_model="${ model }",
				brand_id=${ brand },
				unit_warranty="${ warranty }",
				unit_acquired="${ acquired }",
				unit_plate_registration="${ upregistration }"
			where unit_id=${ id }
	`
	
	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		db.query( q1, ( err, out ) => {
			console.log( err? err: "" )
			db.query( q2, ( err, out ) => {
				console.log( err? err: "" )
				db.query( q3, ( err, out ) => {
					console.log( err? err: "" )
					if( !err ) {
						edited = 1
					}
					res.redirect( "/admin/maintenance/unitinfo?unit=" + id )
				})				
			})
		})
	})
})

router.get( "/delete", ( req, res ) => {
	
})

module.exports = router