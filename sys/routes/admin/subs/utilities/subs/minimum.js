var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*
		from
			unit_type a
	`

	db.query( q, ( err, out ) => {
		res.render( "UtilitiesMinimum", {
			records: out
		})
	})	
})

router.post( "/", ( req, res ) => {
	r = req.body
	id = r.id
	minimum = r.minimum
	q = `
		update unit_type
		set
			unittype_minimum=${ minimum }
		where
			unittype_id=${ id }
	`

	db.query( q, ( err, out ) => {
		res.redirect( "/admin/utilities/minimum" )
	})	
})

module.exports = router