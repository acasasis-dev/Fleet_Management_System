var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			b.*,
			c.*,
			date_add( a.unit_plate_registration, interval 5 year ) as unit_plate_expiration
		from
			unit a join
			unit_number b join
			unit_type c
		on
			a.unitnum_id=b.unitnum_id and
			a.unittype_id=c.unittype_id
		order by
			unit_plate_expiration asc
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		res.render( "PlateQuery", {
			records: out
		})
	})	
})

module.exports = router