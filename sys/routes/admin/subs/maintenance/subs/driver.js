var router = require( "express" ).Router()
var db = require( "db" )()
var p = require( "path" ).dirname
fdesc = ""
added = 0
deleted = 0
edited = 0

router.get( "/", ( req, res ) => {
	r = req.query
	dtype = r.dtype
	if( !dtype )
		dtype = 1
	const q = `
		select 
			drivers.*
			${ dtype == 1? 
			` ,
			unit_number.unitplate_no,
			unit_route.*,
			route.*,
			unit_type.*`: "" }
		from 
			drivers
			${ dtype == 1? 
			` join
			unit join
			unit_type join
			unit_number join
			unit_route join
			route`: "" }
		${ dtype == 1? `
		on
			drivers.unit_id=unit.unit_id and
			unit.unitnum_id=unit_number.unitnum_id and
			unit.unitroute_id=unit_route.unitroute_id and
			unit_route.route_id=route.route_id and
			unit.unittype_id=unit_type.unittype_id`: `
		where
			driver_type_id=2` };
		select * from route;
		select * from unit_type where unittype_status!=0;
	`

	console.log( q )

	db.query( q, ( err, out ) => {
		if( err )
			console.log( err )
		res.render( "Driver", {
			drivers: out[0],
			routes: out[1],
			unit_types: out[2],
			dtype: dtype,
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

router.get( "/unitdef", ( req, res ) => {
	console.log( "REQ QUERY UTYPE:", req.query.utype )
	console.log( "REQ QUERY ROUTE:", req.query.route )

	dups_q = `
		select
			unit_id
		from
			drivers
		group by
			unit_id
		having 
			count( unit_id )=2
	`

	db.query( dups_q, ( err, out ) => {
		dups = []
		out.forEach( cur => {
			dups.push( cur.unit_id )
		})
		q_head = `
			select
				unit.unit_id,
				unit_number.unitplate_no
			from
				unit,
				unit_number `
		q_mid = `
				${ req.query.utype? ", unit_type": "" }
				${ req.query.route? ", unit_route": "" }
			where
				unit_number.unitnum_id=unit.unitnum_id`

		q_end = `
			${ req.query.utype? " and unit.unittype_id=unit_type.unittype_id and unit.unittype_id=" + req.query.utype: "" }
			${ req.query.route? " and unit.unitroute_id=unit_route.unitroute_id and unit_route.route_id=" + req.query.route: "" }
			${ dups.length > 1? ` and
			unit.unit_id not in (
				` + dups.join( ", " ) + `
			)`: "" }
		`
		q = q_head + q_mid + q_end
		console.log( q )
		arr = []

		db.query( q, ( err, out ) => {
			if( err )
				console.log( err )
			if( out ) {
				out.forEach( cur => {
					arr.push( cur.unit_id + ", " + cur.unitplate_no )
				})
			}

			console.log( arr )

			res.send( arr.join( ";" ) )
		})
	})
})

router.post( "/", ( req, res ) => {
	var r = req.body
	var pic = req.files? req.files.pic? req.files.pic: { name: "NULL" }: { name: "NULL" }
	var fname = r.fname
	var mname = r.mname
	var lname = r.lname
	var gender = r.gender
	var bday = r.bday
	var address = r.address
	var contact = r.contact
	var license = r.license
	var licexp = r.licexp
	var unit = r.unit? r.unit: "NULL"
	var dtype = r.dtype

	const q = `
		insert into
			drivers(
				driver_fn,
				driver_mn,
				driver_ln,
				driver_type_id,
				driver_pic,
				driver_sex,
				driver_bday,
				driver_address,
				driver_contact,
				driver_license,
				driver_licexp,
				unit_id
			) values (
				"${ fname }",
				"${ mname }",
				"${ lname }",
				${ dtype },
				"${ pic.name }",
				"${ gender }",
				"${ bday }",
				"${ address }",
				"${ contact }",
				"${ license }",
				"${ licexp }",
				${ unit }
			);`

	console.log( q )
	db.query( q, ( err, out ) => {
		if( err ) {
			failed = 1
			failed_form = r
			if( err.code == "ER_DUP_ENTRY" )
				fdesc = "Unit already exists"
			console.log( err )
		} else {
			added = 1
		}
		if( pic.name != "NULL" ) {
			pic.mv( p( p( p( p( p( __dirname ) ) ) ) ) + "/styles/assets/uploads/" + pic.name, err => {
				if( err )
			
					console.log( err )				
			})
		}
		res.redirect( "/admin/maintenance/driver" )
	})
})

router.post( "/edit", ( req, res ) => {
	var r = req.body
	var id = r.id
	var fname = r.fname.split( "  " )[0]
	var mname = r.mname.split( "  " )[0]
	var lname = r.lname.split( "  " )[0]
	var pic = req.files.pic
	var sex = r.sex
	var bday = r.byear + "-" + r.bmonth + "-" + r.bday
	var address = r.address
	var contact = r.contact
	var license = r.license
	var password = r.password
	var licreg = lryear + "-" + lrmonth + "-" + lrday
	var licexp = leyear + "-" + lemonth + "-" + leday
	
	const q = `
		update driver
		set 
			driver_fn="${ fname }",
			driver_mn="${ mname }",
			driver_ln="${ lname }",
			driver_pic="${ pic.name }",
			driver_sex="${ sex }",
			driver_bday="${ bday }",
			driver_address="${ address }",
			driver_contact="${ contact }",
			driver_license="${ license }",
			driver_password="${ password }",
			driver_licreg="${ licreg }",
			driver_licexp="${ licexp }"
		where driver_id=${ id }
	`
	
	db.query( q, ( err, out ) => {
		pic.mv( p( p( p( p( p( p( __dirname ) ) ) ) ) ) + "/styles/assets/uploads/" + pic.name, err => {
			if( err )
				console.log( err )
			else
				console.log( pic.name + " uploaded ..." )
		})
		res.redirect( "/admin/maintenance/driver" )
	})
})

router.post( "/delete", ( req, res ) => {
	var id = req.body.id
	
	const q = `
		delete from drivers
		where driver_id=${ id }
	`

	db.query( q, ( err, out ) => {
		if( err ) {
			deleted = 2
			fdesc = "Delete failed"
		} else {
			deleted = 1
		}
		res.redirect( "/admin/maintenance/driver" )
	})
})

module.exports = router