var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "SpecialUnit" )
})

module.exports = router