var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select * from auto_supply_category;
		select
			a.*,
			b.*
		from
			auto_supply a join
			auto_supply_category b
		on
			a.ascategory_id=b.ascategory_id
	`

	db.query( q, ( err, out ) => {
		res.render( "AutoSupply", {
			auto_supply_categories: out[0],
			auto_supplies: out[1]
		})
	})
})

router.post( "/", ( req, res ) => {
	var r = req.body
	var cat = r.cat
	var desc = r.desc
	var quant = r.quant

	const q = `
		insert into
			auto_supply(
				ascategory_id,
				asupply_desc,
				asupply_quantity
			) values (
				${ cat },
				"${ desc }",
				${ quant }
			);
	`

	db.query( q, ( err, out ) => {
		res.redirect("/admin/maintenance/autosupply")
	})
})

router.post( "/edit", ( req, res ) => {
	var r = req.body
	var id = r.id
	var cat = r.cat
	var desc = r.desc
	var quant = r.quant
	const q = `
		update auto_supply
			set
				ascategory_id=${ cat },
				asupply_desc="${ desc }",
				asupply_quantity=${ quant }
			where asupply_id=${ id }
	`

	console.log( q )
	db.query( q, ( err, out ) => {
		if( err )
			console.log( err )
		res.redirect( "/admin/maintenance/autosupply" )
	})
})

router.post( "/delete", ( req, res ) => {
	const q = `
		delete from auto_supply where asupply_id=${ req.body.id }`

	db.query( q, ( err, out ) => {
		res.redirect( "/admin/maintenance/autosupply" )
	})
})

module.exports = router