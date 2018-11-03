var router = require( "express" ).Router()
var db = require( "db" )()

router.get( "/", ( req, res ) => {
	q = `
		select
			sum( paid ) as total_collected			
		from penalty_payment_log
		where
			staff_id=${ req.session.user.staff_id };
		select sum( amount ) as total_remitted
		from offense_remittance
		where
			staff_id=${ req.session.user.staff_id } and
			confirmed=1;
		select
			a.*,
			b.*,
			c.*,
			d.*,
			if( sum( e.paid ) is null,
				0,
				sum( e.paid )
			) as paid,
			if( a.penalty_amount - sum( e.paid ) is null,
				a.penalty_amount,
				a.penalty_amount - sum( e.paid )
			) as balance
		from
			offense_record a join
			penalty b join
			offense_category c join
			drivers d
		on
			a.penalty_id=b.penalty_id and
			b.offensecat_id=c.offensecat_id and
			a.driver_id=d.driver_id and
			a.for_date=date( now() ) left join
			penalty_payment_log e
			on
				a.offense_rec_id=e.offense_rec_id
		group by
			a.offense_rec_id,
			d.driver_fn, d.driver_mn, d.driver_ln

	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		out[2].forEach( cur => {
			if( cur.offense_no == 1 )
				cur.offense_no = "1st Offense"
			else if( cur.offense_no == 2 )
				cur.offense_no = "2nd Offense"
			else if( cur.offense_no == 3 )
				cur.offense_no = "3rd Offense"
			else if( cur.offense_no == 4 )
				cur.offense_no = "Final Offense"
		})
		res.render( "collector/CollectorPenalty", {
			total_collected: out[0][0].total_collected,
			total_balance: out[0][0].total_collected - out[1][0].total_remitted,
			offenses: out[2]
		})
	})	
})

router.post( "/", ( req, res ) => {
	r = req.body
	id = r.id
	amount = r.amount
	q = `
		insert into
			penalty_payment_log(
				offense_rec_id,
				paid,
				pplog_time,
				staff_id
			) values( 
				${ id },
				${ amount },
				current_timestamp(),
				${ req.session.user.staff_id }
			)
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.redirect( "/collector/collections/penalty" )
	})	
})

router.post( "/remit", ( req, res ) => {
	r = req.body
	amount = r.amount
	q = `
		insert into
			offense_remittance(
				amount,
				staff_id,
				date_received,
				confirmed
			) values(
				${ amount },
				${ req.session.user.staff_id },
				NULL,
				0
			)
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )

		an_q = `
			insert into
				admin_notifs(
					an_desc,
					seen,
					for_date
				) values(
					concat(
						(
							select
								concat( staff_ln, ", ", staff_fn, " ", staff_mn )
							from
								staffs
							where
								staff_id=${ req.session.user.staff_id }
						), " has requested a remittance of ${ amount }" 						
					),
					0,
					now()
				)
		`

		db.query( an_q, ( err, out ) => {
			console.log( err? err: "" )
			res.redirect( "/collector/collections/penalty" )
		})				
	})
})

module.exports = router