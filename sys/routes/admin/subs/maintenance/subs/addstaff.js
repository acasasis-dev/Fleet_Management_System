var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "AddStaff" )

})


module.exports = router