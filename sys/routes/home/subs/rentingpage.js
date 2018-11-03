var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "RentPage" )
})

module.exports = router