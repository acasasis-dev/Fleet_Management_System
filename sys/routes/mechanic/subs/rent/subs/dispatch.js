var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "MechanicRentInspectionDispatch" )
})

module.exports = router