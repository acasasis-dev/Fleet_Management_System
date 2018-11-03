var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	const q = `
		select 
			* 
		from 
			unit_type
	`

	db.query( q, ( err, out ) => {
		res.render( "UnitType", {
			unit_types: out
		})
	})
})
// router.post( "/", (req, res ) => {
// 	var r = req.body
// 	var utype = r.utype
// 	var unittype_desc = r.unittype_desc

// 	const q = `
// 		insert into
// 			unit_type(
// 				unittype_desc
// 			)values(
// 				"${ unit_type }"
// 			)
// 		`
// 		db.query( q, ( err, out ) => {
// 		res.redirect( "/admin/maintenance/unittype" )
// 	})
// })

router.get( "/change", ( req, res ) => {
	var r = req.query
	var id = r.id
	var to = r.to
	
	const q = `
		update unit_type
		set 
			unittype_status="${ to }"
		where unittype_id=${ id.split( "b" )[1] }
	`
	db.query( q, ( err, out ) => {
		if( err )
			console.log( err )
		res.redirect( "/admin/maintenance/unittype" )	
	})		
})

router.post( "/", ( req, res ) => {
	r = req.body
	desc = r.desc
	minimum = r.minimum

	q = `
		insert into
			unit_type(
				unittype_desc,
				unittype_status,
				unittype_minimum
			) values(
				"${ desc }",
				1,
				${ minimum }
			)
	`

	db.query( q, ( err, out ) => {
		if( err )
			console.log( err )
		res.redirect( "/admin/maintenance/unittype" )
	})
})

router.post( "/edit", ( req, res ) => {
	r = req.body
	id = r.id
	desc = r.desc
	console.log( r )
	q = `
		update unit_type
			set
				unittype_desc="${ desc }"
		where
			unittype_id=${ id }
	`
	console.log( q )
	db.query( q, ( err, out ) => {
		if( err )
			console.log( err )
		res.redirect( "/admin/maintenance/unittype" )
	})
})

router.post( "/delete", ( req, res ) => {
	id = req.body.id

	q = `
		delete from unit_type where unittype_id=${ id }
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/admin/maintenance/unittype" )
	})
})

module.exports = router