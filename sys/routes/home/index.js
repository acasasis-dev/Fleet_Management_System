var router = require( "express" ).Router()
var fs = require( "fs" )

fs.readdir( __dirname + "/subs", ( err, mods ) => {
	mods.forEach( cur => {
		cur = cur.split( "." )[0]
		router.use( `/${ cur }`, require( `./subs/${ cur }` ) )
	})
})

router.get( "/", (req, res) => {
	res.redirect( "/home/login" )
})

module.exports = router
