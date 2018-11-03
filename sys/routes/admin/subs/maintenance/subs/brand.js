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
		select * from unit_type;
		select * from brand;
		select
			brand_unit_type.*,
			brand.*,
			unit_type.*
		from
			brand_unit_type,
			brand,
			unit_type
		where
			brand_unit_type.brand_id=brand.brand_id and
			brand_unit_type.unittype_id=unit_type.unittype_id`

	db.query( q, ( err, out ) => {
		brand_unit_types = {}

		out[2].forEach( cur => {
			if( !brand_unit_types[ cur.brand_id ] ) {
				brand_unit_types[ cur.brand_id ] = []
				brand_unit_types[ cur.brand_id ].push( cur.unittype_id )
			} else
				brand_unit_types[ cur.brand_id ].push( cur.unittype_id )
		})

		console.log( failed_form, failed )
		res.render( "Brand", {
			unit_types: out[0],
			brands: out[1],
			brand_unit_types: brand_unit_types,
			
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
	r = req.body
	brand = r.brand
	types = r.types
	brand_q = `
		insert into brand( brand_desc ) values( "${ brand }" )
	`

	db.query( brand_q, ( err, out ) => {
		console.log( err? err: "" )
		if( err ) {
				failed = 1
				failed_form = r
				console.log( failed_form )
				if( err.code == "ER_DUP_ENTRY" )
					fdesc = "Brand already exists"
				res.redirect( "/admin/maintenance/brand" )
			}
		else {
		brand_id = out.insertId
		inserts = typeof( types ) == "object"? []: ""
		brand_unit_types_q = `
			insert into
				brand_unit_type(
					brand_id,
					unittype_id
				) values
		`

		if( typeof( types ) == "object" ) {
			types.forEach( cur => {
				inserts.push( `
					(
						${ brand_id },
						${ cur }
					)
				`)
			})

			inserts.join( ", " )
		} else {
			inserts += `
				(
					${ brand_id },
					${ types }
				)
			`
		}

		q = brand_unit_types_q + inserts
		console.log( q )
		db.query( q, ( err, out ) => {
			if( err ) {
				failed = 1
				failed_form = r
				if( err.code == "ER_DUP_ENTRY" )
					fdesc = "Brand already exists"
			} else {
				added = 1
			}
			res.redirect( "/admin/maintenance/brand" )
		})
		}
	})
})

router.post( "/edit", ( req, res ) => {
	r = req.body
	id = r.id
	types = r.types
	console.log( r )
	del_q = `
		delete from
			brand_unit_type
		where
			brand_id=${ id }
	`

	db.query( del_q, ( err, out ) => {
		console.log( err? err: "" )
		inserts = []
		brand_unit_types_q = `
			insert into
				brand_unit_type(
					brand_id,
					unittype_id
				) values
		`

		if( typeof( types ) == "object" ) {
			types.forEach( cur => {
				inserts.push( `
					(
						${ id },
						${ cur }
					)
				`)
			})

			inserts.join( ", " )
		} else {
			inserts += `
				(
					${ id },
					${ types }
				)
			`
		}

		q = brand_unit_types_q + inserts

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			if( !err ) {
			edited = 1
		}
			res.redirect( "/admin/maintenance/brand" )
		})
	})		
})

router.post( "/delete", ( req, res ) => {
	id = req.body.id
	console.log( req.body )
	brand_unit_types_q = `
		delete from
			brand_unit_type
		where
			brand_id=${ id }
	`
	q = `delete from brand where brand_id=${ id }`

	db.query( brand_unit_types_q, ( err, out ) => {
		db.query( q, ( err, out ) => {
			if( err ) {
			deleted = 2
			fdesc = "Delete failed"
		} else {
			deleted = 1
		}
			res.redirect( "/admin/maintenance/brand" )
		})		
	})
})

module.exports = router