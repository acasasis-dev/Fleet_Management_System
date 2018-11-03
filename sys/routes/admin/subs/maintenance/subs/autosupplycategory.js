var router = require( "express" ).Router()
var db = require( "db" )()
router.get( "/", ( req, res ) => {
	const q = `
		select 
			* 
		from 
			auto_supply_category
	`

	db.query( q, ( err, out ) => {
		var rend = []
		
		out.forEach( o => {
			var tmp = {
				"id": o.ascategory_id,
				"desc": o.ascategory_desc
				
			}
			rend.push( tmp )
		})

		console.log(rend)
		res.render( "AutoSupplyCategory", {
			rend: rend
		})
	})
})
router.post( "/", ( req, res ) => {
	var r = req.body
	var desc = r.desc
	

	const q = `
		insert into
			auto_supply_category(
				ascategory_desc
			) values (
				"${ desc }"
			);`

	console.log( q )
	db.query( q, ( err, out ) => {
		if( err )
			console.log( err )
			res.redirect( "/admin/maintenance/autosupplycategory" )
		
	})
})
router.post( "/edit/:id", ( req, res ) => {
	var r = req.body
	var id = r.id
	var desc = r.descr
	console.log(r)
	const q = `
		update auto_supply_category
		set
			ascategory_desc ="${ desc }"
		where ascategory_id="${ id }";
	`
	console.log( q )
	db.query( q, ( err, out ) => {
		
	})
		res.redirect( "/admin/maintenance/autosupplycategory" )
})

router.get( "/delete/:id", ( req, res ) => {
	var id = req.params.id
	const q = `
		delete from auto_supply_category
		where ascategory_id=${ id }
	`
	console.log( q )
	db.query( q, ( err, out ) => {
		res.redirect( "/admin/maintenance/autosupplycategory" )
	})
})

module.exports = router