var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	if( req.session.user ) {
		rs = req.session.user.staff_type_id
		if( rs === 4 )
			return res.redirect( "/admin" )
		else if( rs === 1 )
			return res.redirect( "/mechanic" )
		else if( rs === 2 )
			return res.redirect( "/dispatcher" )
		else if( rs === 3 )
			return res.redirect( "/collector" )
	} else
		res.render( "Login" )
})

router.post( "/", ( req, res ) => {
	r = req.body
	uname = r.uname
	passwd = r.passwd

	const exists_q = `
		select *
		from staffs
		where
			replace( lower( concat( staff_fn, staff_ln ) ), " ", "" )="${ uname }"
	`

	db.query( exists_q, ( err, out ) => {
		console.log( err? err: "" )
		driver_dets = out[0]
		if( driver_dets ) {
			const passwd_q = `
				select staff_password
				from staffs
				where
					staff_id=${ driver_dets.staff_id }
			`

			db.query( passwd_q, ( err, out ) => {
				o = out[0]
				if( passwd === o.staff_password ) {
					delete driver_dets.staff_password

					req.session.user = driver_dets
					rs = req.session.user.staff_type_id
					if( rs === 4 )
						return res.redirect( "/admin" )
					else if( rs === 1 )
						return res.redirect( "/mechanic" )
					else if( rs === 2 )
						return res.redirect( "/dispatcher" )
					else if( rs === 3 )
						return res.redirect( "/collector" )
				} else
					return res.redirect( "/home/login?wrong")
			})
		} else
			return res.redirect( "/home/login?nonexists" )
	})
})

module.exports = router