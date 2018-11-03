var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select * from boundary_remittance
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		res.render( "collector/RemittanceBoundary", {
			boundary_remittance_records: out
		})
	})	
})

module.exports = router