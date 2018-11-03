var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "Events" )
})

module.exports = router