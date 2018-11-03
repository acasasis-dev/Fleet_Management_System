var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "RentDispatch" )
})

module.exports = router