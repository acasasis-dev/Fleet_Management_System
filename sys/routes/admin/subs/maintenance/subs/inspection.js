var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "Inspection" )
})

module.exports = router