var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	const q = "select * from sched_type"

	function time_conv( time ) {
		time = time.split( ":" )
		hr = time[0]
		min = time[1]

		if( hr == "00" || Number( hr ) <= 11 ) {
			suf = " AM"
			hr = hr == "00"? "12": hr
			time = [ hr, min ].join( ":" ) + suf
		} else {
			suf = " PM"
			hr = hr != "12"? Number( hr ) - 12 < 10? "0" + String( Number( hr ) - 12 ): Number( hr ) - 12: "12"
			time = [ hr, min ].join( ":" ) + suf
		}

		return time
	}

	db.query( q, ( err, out ) => {
		out.forEach( cur => {
			cur.orig_from = cur.sctype_from
			cur.orig_to = cur.sctype_to
			cur.sctype_from = time_conv( cur.sctype_from )
			cur.sctype_to = time_conv( cur.sctype_to )
		})

		res.render( "TripHour", {
			sched_types: out
		})	
	})
})

router.post( "/", ( req, res ) => {
	r = req.body
	id = r.id
	start = r.start
	end = r.end
	q = `
		update sched_type
		set
			sctype_from="${ start }",
			sctype_to="${ end }"
		where sctype_id=${ id }
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/admin/utilities/triphour" )
	})
})

module.exports = router