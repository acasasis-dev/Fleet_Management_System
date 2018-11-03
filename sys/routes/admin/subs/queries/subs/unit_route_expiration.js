var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			b.*,
			c.*,
			d.*,
			e.*
		from
			unit a join
			unit_number b join
			unit_type c join
			unit_route d join
			route e
		on
			a.unitnum_id=b.unitnum_id and
			a.unittype_id=c.unittype_id and
			a.unitroute_id=d.unitroute_id and
			d.route_id=e.route_id
		order by
			d.unitroute_expiration asc
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		res.render( "RouteQuery", {
			records: out
		})
	})	
})

module.exports = router