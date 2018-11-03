var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	res.render( "UnitMaintenanceScheduleInspection" )
})

module.exports = router