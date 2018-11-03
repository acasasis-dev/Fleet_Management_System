var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "UtilitiesOffensesAndPenalties" )
})

module.exports = router