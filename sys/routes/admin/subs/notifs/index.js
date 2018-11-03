var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		update admin_notifs
		set
			seen=1;
		select * from admin_notifs order by for_date desc
	`

	db.query( q, ( err, out ) => {
		res.render( "AdminNotifications", {
			records: out[1]
		})
	})	
})

router.get( "/check", ( req, res ) => {
	q = `
		select count( an_id ) as scount from admin_notifs where seen=0;
	`

	db.query( q, ( err, out ) => {
		res.send( `${ out[0].scount }` )
	})	
})

module.exports = router