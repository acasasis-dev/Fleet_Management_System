var router = require( "express" ).Router()
var fs = require( "fs" )

router.get( "/", ( req, res ) => {
	res.render( "OperatorRepair" )
})

module.exports = router