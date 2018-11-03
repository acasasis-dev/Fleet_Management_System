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
				date_sub( a.recorded, interval (
					weekday( a.recorded )
				) day ) as date_start,
				date_add( a.recorded, interval (
					6 - weekday( a.recorded )
				) day ) as date_end,		
				count( c.brand_id ) as repair_count
			from
				for_repair a join
				unit b join
				brand c
			on
				a.unit_id=b.unit_id and
				b.brand_id=c.brand_id
			group by
				c.brand_id,
				date_start, 
				date_end
		`

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			console.log( out )
			out.forEach( cur => {
				cur.for_date = cur.date_start.toDateString() + " - " + cur.date_end.toDateString()
			})

			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Week</th>"
			write += "		<th>Unit Type</th>"
			write += "		<th>No. of Repair(s)</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out.forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.brand_desc + "</td>"
				write += "		<td>" + cur.repair_count + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})

			res.render( "RepairPerBrand", {
				records: out,
				view: 1
			})
		})
	} else if( v == 2 ) {
		q = `
			select
				c.*,
				monthname( a.recorded ) as rmonth,		
				count( c.brand_id ) as repair_count
			from
				for_repair a join
				unit b join
				brand c
			on
				a.unit_id=b.unit_id and
				b.brand_id=c.brand_id
			group by
				rmonth,
				c.brand_id
		`

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			console.log( out )
			out.forEach( cur => {
				cur.for_date = cur.rmonth
			})

			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Month</th>"
			write += "		<th>Unit Type</th>"
			write += "		<th>No. of Repair(s)</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out.forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.brand_desc + "</td>"
				write += "		<td>" + cur.repair_count + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})

			res.render( "RepairPerBrand", {
				records: out,
				view: 2
			})
		})
	} else {
		q = `
			select
				c.*,
				year( a.recorded ) as ryear,		
				count( c.brand_id ) as repair_count
			from
				for_repair a join
				unit b join
				brand c
			on
				a.unit_id=b.unit_id and
				b.brand_id=c.brand_id
			group by
				ryear,
				c.brand_id
		`

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			console.log( out )
			out.forEach( cur => {
				cur.for_date = cur.ryear
			})

			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Year</th>"
			write += "		<th>Unit Type</th>"
			write += "		<th>No. of Repair(s)</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out.forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.brand_desc + "</td>"
				write += "		<td>" + cur.repair_count + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})

			res.render( "RepairPerBrand", {
				records: out,
				view: 3
			})
		})
	}
})

module.exports = router