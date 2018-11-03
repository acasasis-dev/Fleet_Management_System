var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "UtilitiesBoundary" )
})

module.exports = router