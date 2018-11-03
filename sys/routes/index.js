var fs = require( "fs" )

module.exports = app => {
	fs.readdir( __dirname, ( err, mods ) => {
		mods.forEach( cur => {
			app.use( `/${ cur }`, require( `./${ cur }` ) )
		})
	})
}
