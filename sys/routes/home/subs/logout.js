var router = require( "express" ).Router()

router.get( "/", ( req, res ) => {
	delete req.session.user
	res.redirect( "/home/login" )
})

module.exports = router