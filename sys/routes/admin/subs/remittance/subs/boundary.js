var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select 
			a.*,
			b.*
		from 
			boundary_remittance a join
			staffs b
		on
			a.staff_id=b.staff_id
	`

	db.query( q, ( err, out ) => {
		res.render( "BoundaryRemittance", {
			boundary_remittance_records: out
		})
	})	
})

router.post( "/", ( req, res ) => {
	id = req.body.id

	q = `
		update boundary_remittance
		set 
			date_received=current_timestamp(),
			confirmed=1
		where bremittance_id=${ id }
	`

	db.query( q, ( err, out ) => {
		cn_q = `
			insert into
				collector_notifs(
					cn_desc,
					seen,
					for_date
				) values(
					concat(
						"Your ",
						(
							select
								amount
							from
								boundary_remittance
							where
								bremittance_id=${ id }
						),
						" remittance has been confirmed and collected!"
					),
					0,
					now()
				)
		`

		db.query( cn_q, ( err, out ) => {
			res.redirect( "/admin/remittance/boundary" )
		})
	})	
})

module.exports = router