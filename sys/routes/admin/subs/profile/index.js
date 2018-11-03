var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "Profile" )
})

module.exports = router