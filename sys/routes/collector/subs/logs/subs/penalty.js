var router = require( "express" ).Router()
var db = require( "db" )()
var PDFDocument = require( "pdfkit" )
var fs = require( "fs" )
var p = require( "path" ).dirname

router.get( "/", ( req, res ) => {
	q = `
		select
			a.*,
			c.*
		from
			penalty_payment_log a join
			offense_record b join
			drivers c
		on
			a.offense_rec_id=b.offense_rec_id and
			b.driver_id=c.driver_id
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		res.render( "collector/PenaltyPaymentLog", {
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
			c.driver_fn, c.driver_mn, c.driver_ln,
			d.staff_fn, d.staff_mn, d.staff_ln,
			a.paid, 
			b.*,
			b.penalty_amount - sum( a.paid ) as balance,
			( 
				select max( pplog_time )
				from penalty_payment_log a
				where a.pplog_id=${ id }
			) as plog_time
		from
			penalty_payment_log a join
			offense_record b join
			drivers c join
			staffs d
		on
			a.pplog_id=${ id } and
			a.offense_rec_id=b.offense_rec_id and
			b.driver_id=c.driver_id and
			a.staff_id=d.staff_id
		group by
			b.offense_rec_id,
			c.driver_fn, c.driver_mn, c.driver_ln
	`

	db.query( q, ( err, out ) => {
		console.log( out )
		driver = out[0]	
		console.log( err? err: "" )
		doc.pipe( fs.createWriteStream( dest + "/styles/assets/outputs/receipt.pdf" ) )
		doc.text( "KINGDOM PROCLAIMERS" ).fontSize( "20" )
		doc.text( "\nDate: " + driver.plog_time.toLocaleString() ).fontSize( "10" )
		doc.text( "Driver: " + driver.driver_ln + ", " + driver.driver_fn + " " + driver.driver_mn ).fontSize( "10" )
		doc.text( "Amount: " + driver.penalty_amount ).fontSize( "10" )
		doc.text( "Paid: " + driver.paid ).fontSize( "10" )
		doc.text( "Balance: " + driver.balance ).fontSize( "10" )
		doc.text( "Collector: " + driver.staff_ln + ", " + driver.staff_fn + " " + driver.staff_mn ).fontSize( "10" )
		doc.end()
		res.render( "collector/PenaltyPaymentLogView" )
	})
})

module.exports = router