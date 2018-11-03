var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			b.*,
			count( b.unittype_id ) as utype_count
		from
			unit a join
			unit_type b
		on
			a.unittype_id=b.unittype_id
		group by
			b.unittype_id
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		res.render( "UnitPerTypeQuery", {
			records: out
		})
	})	
})

module.exports = router