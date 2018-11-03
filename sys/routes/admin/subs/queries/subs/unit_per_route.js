var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			b.*,
			d.*,
			count( b.unittype_id ) as utype_count
		from
			unit a join
			unit_type b join
			unit_route c join
			route d
		on
			a.unittype_id=b.unittype_id and
			a.unitroute_id=c.unitroute_id and
			c.route_id=d.route_id
		group by
			b.unittype_id,
			d.route_id
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		res.render( "UnitPerRouteQuery", {
			records: out
		})
	})	
})

module.exports = router