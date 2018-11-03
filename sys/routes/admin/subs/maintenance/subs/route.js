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
		select * from route
	`

	db.query( q, ( err, out ) => {
		res.render( "Route", {
			routes: out,
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

router.post( "/", ( req, res ) => {
	var r = req.body
	var route_from = r.rfrom
	var route_to = r.rto

	const q = `
		insert into 
			route(
				route_from,
				route_to
			) values ( 
				"${ route_from }",
				"${ route_to }"
			);
	`

	db.query( q, ( err, out ) => {
		if( err ) {
			failed = 1
			failed_form = r
			if( err.code == "ER_DUP_ENTRY" )
				fdesc = "Route already exists"
		} else {
			added = 1
		}
		res.redirect( "/admin/maintenance/route" )
	})
})

router.post( "/edit", ( req, res ) => {
	var r = req.body
	var id = r.id
	var route_from = r.rfrom
	var route_to = r.rto

	const q = `
		update route
			set
				route_from="${ route_from }",
				route_to="${ route_to }"
			where route_id=${ id }
	`

	db.query( q, ( err, out ) => {
		if( !err ) {
			edited = 1
		}
		res.redirect( "/admin/maintenance/route" )
	})
})

router.post( "/delete", ( req, res ) => {
	var id = req.body.id

	const q = `delete from route where route_id=${ id }`
	console.log( q )
	db.query( q, ( err, out ) => {
		if( err ) {
			deleted = 2
			fdesc = "Delete failed"
		} else {
			deleted = 1
		}
		res.redirect( "/admin/maintenance/route" )
	})
})

module.exports = router