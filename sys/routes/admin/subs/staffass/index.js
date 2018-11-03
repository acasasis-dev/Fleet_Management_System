var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "StaffAssignment" )
})

module.exports = router