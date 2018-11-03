var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select * from offense_remittance
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		res.render( "collector/RemittancePenalty", {
			offense_remittance_records: out
		})
	})	
})

module.exports = router