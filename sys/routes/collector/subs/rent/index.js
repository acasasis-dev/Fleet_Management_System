var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "collector/RentCollection" )
})

module.exports = router