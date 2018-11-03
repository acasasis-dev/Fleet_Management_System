var router = require( "express" ).Router()
var fs = require( "fs" )

router.get( "/", ( req, res ) => {
	res.redirect( "/admin/reports/inspections/dispatch" )
})

fs.readdir( __dirname + "/subs", ( err, mods ) => {
	mods.forEach( cur => {
		cur = cur.split( "." )[0]
		router.use( `/${ cur }`, require( `./subs/${ cur }` ) )
	})
})

module.exports = router