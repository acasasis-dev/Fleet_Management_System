var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "Status" )
})

module.exports = router