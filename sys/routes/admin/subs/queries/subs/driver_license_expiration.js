var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*
		from
			drivers a
		order by
			driver_licexp asc
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		res.render( "DriverLicenseQuery", {
			records: out
		})
	})	
})

module.exports = router