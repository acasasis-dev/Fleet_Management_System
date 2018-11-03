var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "AddDriver" )
})

module.exports = router