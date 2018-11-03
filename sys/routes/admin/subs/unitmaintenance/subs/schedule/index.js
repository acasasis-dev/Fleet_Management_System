var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "UnitMaintenanceSchedule" )
})

module.exports = router