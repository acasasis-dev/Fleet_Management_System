var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select * from unit_type;
		select
			a.*,
			b.*
		from
			unit_boundary a join
			unit_type b
		on
			a.unittype_id=b.unittype_id and
			unit_boundary_type=2
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.render( "MaintenanceBoundary", {
			unit_types: out[0],
			boundaries: out[1]
		})
	})
})

router.post( "/", ( req, res ) =>{
	console.log( req.body )
	r = req.body
	utype = r.utype
	capt = r.capacity
	mshift = r.mshift
	ashift = r.ashift
	wdshift = r.wdshift

	q = `
		insert into
			unit_boundary(
				unittype_id,
				capacity,
				morning_boundary,
				afternoon_boundary,
				wholeday_boundary,
				unit_boundary_type
			) values(
				${ utype },
				${ capt },
				${ mshift },
				${ ashift },
				${ wdshift },
				1
			)
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/admin/maintenance/boundary" )
	})	
})

router.post( "/edit", ( req, res ) => {
	r = req.body
	id = r.id
	utype = r.utype
	capacity = r.capacity
	mboundary = r.mboundary
	aboundary = r.aboundary
	wdboundary = r.wdboundary
	q = `
		update unit_boundary
		set
			unittype_id=${ utype },
			capacity=${ capacity },
			morning_boundary=${ mboundary },
			afternoon_boundary=${ aboundary },
			wholeday_boundary=${ wdboundary }
		where
			unit_boundary_id=${ id }
	`

	console.log( q )
	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/admin/maintenance/boundary" )
	})
})

module.exports = router