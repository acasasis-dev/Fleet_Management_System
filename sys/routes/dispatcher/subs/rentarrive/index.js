var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "RentArrive" )
})

module.exports = router