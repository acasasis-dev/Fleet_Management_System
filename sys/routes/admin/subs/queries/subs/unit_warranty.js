var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			b.*,
			c.*
		from
			unit a join
			unit_number b join
			unit_type c
		on
			a.unitnum_id=b.unitnum_id and
			a.unittype_id=c.unittype_id
		order by
			a.unit_warranty asc
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		res.render( "WarrantyQuery", {
			records: out
		})
	})	
})

module.exports = router