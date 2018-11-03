var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "Rent" )
})

module.exports = router