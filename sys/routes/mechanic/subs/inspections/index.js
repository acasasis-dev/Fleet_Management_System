var router = require( "express" ).Router()
var fs = require( "fs" )

router.get( "/", ( req, res ) => {
	res.redirect( "/mechanic/inspections/dispatch" )
})

fs.readdir( __dirname + "/subs", ( err, mods ) => {
	if(err) console.err

	mods.forEach( cur => {
		route = cur.split( "." )[0]
		router.use( `/${ route }`, require( `./subs/${ route }` ) )
	})
})

module.exports = router