var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "Numbers" )
})

module.exports = router