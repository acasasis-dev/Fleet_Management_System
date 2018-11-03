var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "MechanicRentInspectionArrival" )
})

module.exports = router