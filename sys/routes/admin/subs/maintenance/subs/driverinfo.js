var router = require( "express" ).Router()
var db = require( "db" )()
fdesc = ""
added = 0
deleted = 0 
edited = 0

router.get( "/", ( req, res ) => {
	driver = req.query.driver
	dtype = req.query.dtype

	const q = `
		select 
			drivers.*,
			driver_type.*
			${ dtype == 1? 
			` ,
			unit_number.unitplate_no,
			unit_route.*,
			route.*,
			unit_type.*`: "" }
		from 
			drivers join
			driver_type
			${ dtype == 1? 
			` join
			unit join
			unit_type join
			unit_number join
			unit_route join
			route`: "" }
		${ dtype == 1? `
		on
			drivers.driver_id=${ driver } and
			drivers.driver_type_id=driver_type.driver_type_id and
			drivers.unit_id=unit.unit_id and
			unit.unitnum_id=unit_number.unitnum_id and
			unit.unitroute_id=unit_route.unitroute_id and
			unit_route.route_id=route.route_id and
			unit.unittype_id=unit_type.unittype_id`: `
		on
			drivers.driver_id=${ driver } and
			drivers.driver_type_id=driver_type.driver_type_id and
			drivers.driver_type_id=2` };
		select * from driver_type;		
	`

	db.query( q, ( err, out ) => {		
		uwd_q = `
			select unit_id from drivers group by unit_id having count( unit_id )=2
		`

		db.query( uwd_q, ( err, units ) => {
			units_wd = []
			units.forEach( cur => {
				units_wd.push( cur.unit_id )
			})
			units_wd = units_wd.join( ", " )
			fq = `
				select
					a.*,
					b.*
				from
					unit a join
					unit_number b
				on
					a.unitnum_id=b.unitnum_id and
					a.unit_id not in (
						${ units_wd }
					)
			`
			db.query( fq, ( err, fout ) => {
				console.log( fout )
				console.log( err? err: "" )
				res.render( "DriverInfo", {
					driver_info: out[0],
					driver_types: out[1],
					driver: driver,
					units: fout,
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
	})
})

router.post( "/", ( req, res ) => {
	console.log( req.body )
	r = req.body
	driver = r.driver
	dtype = r.dtype
	fname = r.fname
	mname = r.mname
	lname = r.lname
	bday = r.bday
	gender = r.gender
	address = r.address
	contact = r.contact
	license = r.license
	licexp = r.licexp
	unit = r.uid

	q = `
		update drivers
		set
			driver_fn="${ fname }",
			driver_mn="${ mname }",
			driver_ln="${ lname }",
			driver_bday="${ bday }",
			driver_type_id=${ dtype },
			driver_sex="${ gender }",
			driver_address="${ address }",
			driver_contact="${ contact }",
			driver_license="${ license }",
			driver_licexp="${ licexp }",
			unit_id=${ unit }
		where
			driver_id=${ driver }
	`
	console.log( q )

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		if( !err ) {
			edited = 1
		}
		res.redirect( "/admin/maintenance/driverinfo?driver=" + driver + "&dtype=" + dtype )
	})	
})

module.exports = router