var router = require( "express" ).Router()
var db = require( "db" )()
var PDFDocument = require( "pdfkit" )
var fs = require( "fs" )
var p = require( "path" ).dirname

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			d.*
		from
			payment_log a join
			boundary_record b join
			schedule c join
			drivers d
		on
			a.brecord_id=b.brecord_id and
			b.sched_id=c.sched_id and
			if( c.reliever_id is not null and c.relieve_date=date( now() ),
				c.reliever_id=d.driver_id,
				c.driver_id=d.driver_id
			)
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.render( "collector/BoundaryPaymentLog", {
			records: out
		})
	})	
})

router.get( "/view", ( req, res ) => {
	doc = new PDFDocument()
	id = req.query.id
	dest = p( p( p( p( p( __dirname ) ) ) ) )
	q = `
		select
			d.driver_fn, d.driver_mn, d.driver_ln,
			e.staff_fn, e.staff_mn, e.staff_ln,
			a.paid, 
			b.*,
			b.amount - sum( a.paid ) as balance,
			( 
				select max( plog_time )
				from payment_log a
				where a.plog_id=${ id }
			) as plog_time
		from
			payment_log a join
			boundary_record b join
			schedule c join
			drivers d join
			staffs e
		on
			a.plog_id=${ id } and
			a.brecord_id=b.brecord_id and
			b.sched_id=c.sched_id and
			if( c.reliever_id is not null and c.relieve_date=date( now() ),
				c.reliever_id=d.driver_id,
				c.driver_id=d.driver_id
			) and
			a.staff_id=e.staff_id
		group by
			b.brecord_id,
			d.driver_fn, d.driver_mn, d.driver_ln,
			e.staff_fn, e.staff_mn, e.staff_ln
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		console.log( err? err: "" )
		driver = out[0]
		doc.pipe( fs.createWriteStream( dest + "/styles/assets/outputs/receipt.pdf" ) )
		doc.text( "KINGDOM PROCLAIMERS").fontSize( "20" )
		doc.text( "\nDate: " + driver.plog_time.toLocaleString() ).fontSize( "10" )
		doc.text( "Driver: " + driver.driver_ln + ", " + driver.driver_fn + " " + driver.driver_mn ).fontSize( "10" )
		doc.text( "Amount: " + driver.amount ).fontSize( "10" )
		doc.text( "Paid: " + driver.paid ).fontSize( "10" )
		doc.text( "Balance: " + driver.balance ).fontSize( "10" )
		doc.text( "Collector: " + driver.staff_ln + ", " + driver.staff_fn + " " + driver.staff_mn ).fontSize( "10" )
		doc.end()
		res.render( "collector/BoundaryPaymentLogView" )
	})
})

module.exports = router