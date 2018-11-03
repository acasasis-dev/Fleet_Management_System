var router = require( "express" ).Router()
var db = require( "db" )()
var fs = require( "fs" )
var p = require( "path" ).dirname

router.get( "/", ( req, res ) => {
	v = req.query.view
	dest = p( p( p( p( p( p( __dirname ) ) ) ) ) ) + "/styles/assets/outputs/"

	if( v == 1 ) {
		q = `
			select
				c.*,
				d.*,
				e.driver_fn, e.driver_mn, e.driver_ln,
				sum( a.paid ) as paid
			from
				payment_log a join
				boundary_record c join
				schedule d join
				drivers e
			on
				a.brecord_id=c.brecord_id and
				c.sched_id=d.sched_id and
				e.driver_id=if( d.reliever_id is not null and d.relieve_date!=date( now() ),
					d.reliever_id,
					d.driver_id
				)
			group by
				c.brecord_id,
				e.driver_fn, e.driver_mn, e.driver_ln,
				d.sched_from, d.sched_to
		`

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			out.forEach( cur => {
				cur.for_date = cur.sched_from.toDateString() + " - " + cur.sched_to.toDateString()
			})

			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Week</th>"
			write += "		<th>Driver</th>"
			write += "		<th>Collected</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out.forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.driver_ln + ", " + cur.driver_fn + " " + cur.driver_mn + "</td>"
				write += "		<td>" + cur.paid + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})

			res.render( "DriverBoundary", {
				records: out,
				view: 1
			})
		})		
	} else if( v == 2 ) {
		q = `
			select
				c.*,
				e.driver_fn, e.driver_mn, e.driver_ln,
				sum( a.paid ) as paid,
				monthname( c.for_date ) as bmonth
			from
				payment_log a join
				boundary_record c join
				schedule d join
				drivers e
			on
				a.brecord_id=c.brecord_id and
				c.sched_id=d.sched_id and
				e.driver_id=if( d.reliever_id is not null and d.relieve_date!=date( now() ),
					d.reliever_id,
					d.driver_id
				)
			group by
				c.brecord_id,
				e.driver_fn, e.driver_mn, e.driver_ln,
				bmonth
		`

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			out.forEach( cur => {
				cur.for_date = cur.bmonth
			})

			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Month</th>"
			write += "		<th>Driver</th>"
			write += "		<th>Collected</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out.forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.driver_ln + ", " + cur.driver_fn + " " + cur.driver_mn + "</td>"
				write += "		<td>" + cur.paid + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})

			res.render( "DriverBoundary", {
				records: out,
				view: 2
			})
		})
	} else {
		q = `
			select
				c.*,
				e.driver_fn, e.driver_mn, e.driver_ln,
				sum( a.paid ) as paid,
				year( c.for_date ) as byear
			from
				payment_log a join
				boundary_record c join
				schedule d join
				drivers e
			on
				a.brecord_id=c.brecord_id and
				c.sched_id=d.sched_id and
				e.driver_id=if( d.reliever_id is not null and d.relieve_date!=date( now() ),
					d.reliever_id,
					d.driver_id
				)
			group by
				c.brecord_id,
				e.driver_fn, e.driver_mn, e.driver_ln,
				byear
		`

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			out.forEach( cur => {
				cur.for_date = cur.byear
			})

			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Year</th>"
			write += "		<th>Driver</th>"
			write += "		<th>Collected</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out.forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.driver_ln + ", " + cur.driver_fn + " " + cur.driver_mn + "</td>"
				write += "		<td>" + cur.paid + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})

			res.render( "DriverBoundary", {
				records: out,
				view: 3
			})
		})
	}	
})

module.exports = router