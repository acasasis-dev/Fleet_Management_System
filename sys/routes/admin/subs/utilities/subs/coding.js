var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			b.*
		from
			unit a join
			unit_number b
		on a.unitnum_id=b.unitnum_id
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		res.render( "Coding", {
			codings: out
		})
	})	
})

router.post( "/", ( req, res ) => {
	r = req.body
	id = r.id
	coding = r.coding
	q = `
		update unit
		set unit_coding="${ coding }"
		where unit_id=${ id }
	`

	db.query( q, ( err, out ) => {
		res.redirect( "/admin/utilities/coding" )
	})
})

module.exports = router