var router = require( "express" ).Router()
var fs = require( "fs" )
var db = require( "db" )() 

router.get( "/", ( req, res ) => {
	res.redirect( "/collector/logs/boundary" )
})

fs.readdir( __dirname + "/subs", ( err, mods ) => {
	mods.forEach( cur => {
		cur = cur.split( "." )[0]
		router.use( `/${ cur }`, require( `./subs/${ cur }` ) )
	})
})

module.exports = router