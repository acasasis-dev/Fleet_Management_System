var router = require( "express" ).Router()
var db = require( "db" )()
var PDFDocument = require( "pdfkit" )
var fs = require( "fs" )
var p = require( "path" ).dirname

router.get( "/", ( req, res ) => {
	q = ` 
		select
			if( sum( paid ) is null,
				0,
				sum( paid )
			) as total
		from payment_log
		where
			staff_id=${ req.session.user.staff_id };
		select sum( amount ) as remitted
		from boundary_remittance
		where
			staff_id=${ req.session.user.staff_id } and
			confirmed=1;
		select
			a.*,
			b.*,
			c.driver_fn, c.driver_mn, c.driver_ln,
			f.route_from, f.route_to,
			g.unitplate_no,
			( 
				case
					when sum( h.paid ) is null then
						0
					else
						sum( h.paid )
				end 
			) as paid,
			( 
				case
					when a.amount - sum( h.paid ) is null then
						a.amount
					else
						a.amount - sum( h.paid )
				end
			) as balance
		from
			boundary_record a join
			schedule b join
			drivers c join
			unit d join
			unit_route e join
			route f join
			unit_number g
		on
			a.sched_id=b.sched_id and
			a.for_date=date( now() ) and
			if( b.reliever_id is not null and b.relieve_date=date( now() ),				
				b.reliever_id=c.driver_id,
				b.driver_id=c.driver_id
			) and
			b.unit_id=d.unit_id and
			d.unitroute_id=e.unitroute_id and
			e.route_id=f.route_id and
			d.unitnum_id=g.unitnum_id left join
				payment_log h
				on
					a.brecord_id=h.brecord_id			
		group by
			a.brecord_id,
			c.driver_fn, c.driver_mn, c.driver_ln;
		select
			if( sum( paid ) is null,
				0,
				sum( paid )
			) as total
		from payment_log
		where
			staff_id=${ req.session.user.staff_id };
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.render( "collector/CollectorBoundary", {
			total_amount: out[0][0].total,
			total_balance: out[3][0].total - out[1][0].remitted,
			boundary_records: out[2]
		})
	})
})

router.post( "/", ( req, res ) => {
	r = req.body
	id = r.id
	amount = r.amount
	doc = new PDFDocument()
	q = `
		insert into
			payment_log( 
				brecord_id,
				paid,
				plog_time,
				staff_id
			) values (
				${ id },
				${ amount },
				current_timestamp(),
				${ req.session.user.staff_id }
			)
	`

	db.query( q, ( err, out ) => {
		driver_q = `
			select 
				drivers.driver_fn, drivers.driver_mn, drivers.driver_ln, 
				boundary_record.*,
				boundary_record.amount - sum( payment_log.paid ) as balance,
				( 
					select max( plog_time )
					from payment_log
					where brecord_id=${ id }
				) as plog_time
			from 
				drivers, 
				boundary_record,
				schedule,
				payment_log
			where 
				boundary_record.brecord_id=${ id } and
				boundary_record.brecord_id=payment_log.brecord_id and
				boundary_record.sched_id=schedule.sched_id and
				if( schedule.reliever_id is not null,
					schedule.reliever_id=drivers.driver_id,
					schedule.driver_id=drivers.driver_id
				)
			group by
				boundary_record.brecord_id,
				drivers.driver_fn, drivers.driver_mn, drivers.driver_ln
		`

		db.query( driver_q, ( err, out ) => {
			console.log( err? err: "" )
			console.log( out )
			driver = out[0]
			staff = req.session.user
			dest = p( p( p( p( p( p( __dirname ) ) ) ) ) )
			doc.pipe( fs.createWriteStream( dest + "/outputs/receipt.pdf" ) )
			doc.text( "KINGDOM PROCLAIMERS" ).fontSize( "20" )
			doc.text( "\nDate: " + driver.plog_time.toLocaleString() ).fontSize( "10" )
			doc.text( "Driver: " + driver.driver_ln + ", " + driver.driver_fn + " " + driver.driver_mn ).fontSize( "10" )
			doc.text( "Amount: " + driver.amount ).fontSize( "10" )
			doc.text( "Paid: " + r.amount ).fontSize( "10" )
			doc.text( "Balance: " + driver.balance ).fontSize( "10" )
			doc.text( "Collector: " + staff.staff_ln + ", " + staff.staff_fn + " " + staff.staff_mn ).fontSize( "10" )
			doc.end()
		})	

		res.redirect( "/collector/collections/boundary" )	
	})	
})

router.post( "/remit", ( req, res ) => {
	r = req.body
	amount = r.amount
	q = `
		insert into
			boundary_remittance(
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
			res.redirect( "/collector/collections/boundary" )
		})		
	})
})

module.exports = router