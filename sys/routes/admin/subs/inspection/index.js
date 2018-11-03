var router = require( "express" ).Router()
var fs = require("fs")

fs.readdir( __dirname + "/subs", ( err, mods ) => {
	mods.forEach( cur => {
		route = cur.split( "." )[0]
		router.use( `/${ route }`, require( `./subs/${ route }` ) )
	})
})

router.get( "/", ( req, res ) => {
	res.redirect( "/admin/inspection/dispatch")
})

module.exports = router