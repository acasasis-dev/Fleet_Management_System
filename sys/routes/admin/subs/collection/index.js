var router = require( "express" ).Router()

router.use( "/boundary", require( "./subs/boundary" ) )
router.use( "/penalty", require( "./subs/penalty") )
router.use( "/renter", require( "./subs/renter") )

router.get( "/", ( req, res ) => {
	res.redirect( "/admin/collection/boundary")
})

module.exports = router