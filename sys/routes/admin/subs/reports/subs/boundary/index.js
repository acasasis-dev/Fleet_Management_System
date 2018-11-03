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
				if( sum( paid ) is null,
					0,
					sum( paid )
				) as total
			from payment_log where date( plog_time )=( date( now() ) );
			drop temporary table if exists brecord_temp;
			create temporary table brecord_temp as (
				select 
					boundary_record.for_date,
					unit.unittype_id,
					sum( boundary_record.amount ) as amount,
					unit_type.unittype_desc
				from 
					boundary_record join 
					schedule join
					unit join
					unit_type
				on 
					boundary_record.sched_id=schedule.sched_id and
					schedule.unit_id=unit.unit_id and
					unit.unittype_id=unit_type.unittype_id
				group by
					unit.unittype_id,
					boundary_record.for_date 
			);
			drop temporary table if exists plog_temp;
			create temporary table plog_temp as (
				select
					sum( a.paid ) as collected,
					b.for_date,
					d.unittype_id
				from
					payment_log a join
					boundary_record b join
					schedule c join
					unit d
				on
					a.brecord_id=b.brecord_id and
					b.sched_id=c.sched_id and
					c.unit_id=d.unit_id
				group by 
					b.for_date,
					d.unittype_id
			);
			select
				a.*,
				if( b.collected is null,
					0,
					b.collected
				) as collected,
				if( a.amount - b.collected is null,
					a.amount,
					a.amount - b.collected
				) as balance
			from
				brecord_temp a left join
				plog_temp b
			on
				a.for_date=b.for_date and
				a.unittype_id=b.unittype_id
		`

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			console.log( "OUT: !!!", out[ out.length - 1 ] )
			out[ out.length - 1 ].forEach( cur => {
				cur.dorig = cur.for_date
				cur.for_date = cur.for_date.toDateString()
			})
			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Date</th>"
			write += "		<th>Unit Type</th>"
			write += "		<th>Boundary Amount</th>"
			write += "		<th>Amount collected</th>"
			write += "		<th>Balance</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out[ out.length - 1 ].forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.unittype_desc + "</td>"
				write += "		<td>" + cur.amount + "</td>"
				write += "		<td>" + cur.collected + "</td>"
				write += "		<td>" + cur.balance + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})
			res.render( "BoundaryReports", {
				records: out[ out.length - 1 ],
				view: 1,
				total: out[0][0].total
			})
		})
	} else if( v == 2 ) {
		q = `
			select
				if( sum( a.paid ) is null,
					0,
					sum( a.paid )
				) as total
			from
				payment_log a join
				boundary_record b join
				schedule c
			on
				a.brecord_id=b.brecord_id and
				b.sched_id=c.sched_id and
				date( now() ) between c.sched_from and c.sched_to;
			drop temporary table if exists brecord_temp;
			create temporary table brecord_temp as (
				select 
					schedule.sched_from,
					schedule.sched_to,
					unit.unittype_id,
					unit_type.unittype_desc,
					sum( boundary_record.amount ) as amount
				from 
					boundary_record join 
					schedule join
					unit join
					unit_type
				on 
					boundary_record.sched_id=schedule.sched_id and
					schedule.unit_id=unit.unit_id and
					unit.unittype_id=unit_type.unittype_id
				group by
					unit.unittype_id,
					schedule.sched_from,
					schedule.sched_to
			);
			drop temporary table if exists plog_temp;
			create temporary table plog_temp as (
				select
					sum( a.paid ) as collected,
					c.sched_from,
					c.sched_to,
					d.unittype_id
				from
					payment_log a join
					boundary_record b join
					schedule c join
					unit d
				on
					a.brecord_id=b.brecord_id and
					b.sched_id=c.sched_id and
					c.unit_id=d.unit_id
				group by 
					d.unittype_id,
					c.sched_from,
					c.sched_to
			);
			select
				a.*,
				if( b.collected is null,
					0,
					b.collected
				) as collected,
				if( a.amount - b.collected is null,
					a.amount,
					a.amount - b.collected
				) as balance
			from
				brecord_temp a left join
				plog_temp b
			on
				a.sched_from=b.sched_from and
				a.sched_to=b.sched_to and
				a.unittype_id=b.unittype_id
		`

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			out[ out.length - 1 ].forEach( cur => {
				cur.for_date = cur.sched_from.toDateString() + " - " + cur.sched_to.toDateString()
			})

			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Week</th>"
			write += "		<th>Unit Type</th>"
			write += "		<th>Boundary Amount</th>"
			write += "		<th>Amount collected</th>"
			write += "		<th>Balance</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out[ out.length - 1 ].forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.unittype_desc + "</td>"
				write += "		<td>" + cur.amount + "</td>"
				write += "		<td>" + cur.collected + "</td>"
				write += "		<td>" + cur.balance + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})
			res.render( "BoundaryReports", {
				records: out[ out.length - 1 ],
				view: 2,
				total: out[0][0].total
			})
		})

	} else if( v == 3 ) {
		q = `
			select
				if( sum( a.paid ) is null,
					0,
					sum( a.paid )
				) as total
			from
				payment_log a
			where
				monthname( date( now() ) )=monthname( a.plog_time );
			drop temporary table if exists brecord_temp;
			create temporary table brecord_temp as (
				select 
					monthname( boundary_record.for_date ) as bmonth,
					unit.unittype_id,
					unit_type.unittype_desc,
					sum( boundary_record.amount ) as amount
				from 
					boundary_record join 
					schedule join
					unit join
					unit_type
				on 
					boundary_record.sched_id=schedule.sched_id and
					schedule.unit_id=unit.unit_id and
					unit.unittype_id=unit_type.unittype_id
				group by
					unit.unittype_id,
					bmonth
			);
			drop temporary table if exists plog_temp;
			create temporary table plog_temp as (
				select
					sum( a.paid ) as collected,
					monthname( b.for_date ) as bmonth,
					d.unittype_id
				from
					payment_log a join
					boundary_record b join
					schedule c join
					unit d
				on
					a.brecord_id=b.brecord_id and
					b.sched_id=c.sched_id and
					c.unit_id=d.unit_id
				group by 
					d.unittype_id,
					bmonth
			);
			select
				a.*,
				if( b.collected is null,
					0,
					b.collected
				) as collected,
				if( a.amount - b.collected is null,
					a.amount,
					a.amount - b.collected
				) as balance
			from
				brecord_temp a left join
				plog_temp b
			on
				a.bmonth=b.bmonth and
				a.unittype_id=b.unittype_id
		`

		db.query( q, ( err, out ) => {
			out[ out.length - 1 ].forEach( cur => {
				cur.for_date = cur.bmonth
			})

			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Month</th>"
			write += "		<th>Unit Type</th>"
			write += "		<th>Boundary Amount</th>"
			write += "		<th>Amount collected</th>"
			write += "		<th>Balance</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out[ out.length - 1 ].forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.unittype_desc + "</td>"
				write += "		<td>" + cur.amount + "</td>"
				write += "		<td>" + cur.collected + "</td>"
				write += "		<td>" + cur.balance + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})
			res.render( "BoundaryReports", {
				records: out[ out.length - 1 ],
				view: 3,
				total: out[0][0].total
			})	
		})

	} else {
		q = `
			select
				if( sum( a.paid ) is null,
					0,
					sum( a.paid )
				) as total
			from
				payment_log a
			where
				year( date( now() ) )=year( a.plog_time );
			drop temporary table if exists brecord_temp;
			create temporary table brecord_temp as (
				select 
					year( boundary_record.for_date ) as byear,
					unit.unittype_id,
					unit_type.unittype_desc,
					sum( boundary_record.amount ) as amount
				from 
					boundary_record join 
					schedule join
					unit join
					unit_type
				on 
					boundary_record.sched_id=schedule.sched_id and
					schedule.unit_id=unit.unit_id and
					unit.unittype_id=unit_type.unittype_id
				group by
					unit.unittype_id,
					byear
			);
			drop temporary table if exists plog_temp;
			create temporary table plog_temp as (
				select
					sum( a.paid ) as collected,
					year( b.for_date ) as byear,
					d.unittype_id
				from
					payment_log a join
					boundary_record b join
					schedule c join
					unit d
				on
					a.brecord_id=b.brecord_id and
					b.sched_id=c.sched_id and
					c.unit_id=d.unit_id
				group by 
					d.unittype_id,
					byear
			);
			select
				a.*,
				if( b.collected is null,
					0,
					b.collected
				) as collected,
				if( a.amount - b.collected is null,
					a.amount,
					a.amount - b.collected
				) as balance
			from
				brecord_temp a left join
				plog_temp b
			on
				a.byear=b.byear and
				a.unittype_id=b.unittype_id

		`

		db.query( q, ( err, out ) => {
			console.log( err? err: "" )
			out[ out.length - 1 ].forEach( cur => {
				cur.for_date = cur.byear
			})

			write = ""
			write += "<table>"
			write += "	<thead>"
			write += "		<th>Year</th>"
			write += "		<th>Unit Type</th>"
			write += "		<th>Boundary Amount</th>"
			write += "		<th>Amount collected</th>"
			write += "		<th>Balance</th>"
			write += "	</thead>"
			write += "	<tbody>"
			out[ out.length - 1 ].forEach( cur => {
				write += "	<tr>"
				write += "		<td>" + cur.for_date + "</td>"
				write += "		<td>" + cur.unittype_desc + "</td>"
				write += "		<td>" + cur.amount + "</td>"
				write += "		<td>" + cur.collected + "</td>"
				write += "		<td>" + cur.balance + "</td>"
				write += "	</tr>"
				write += "</tbody>"
			})
			write += "</table>"
			console.log( write )

			fs.writeFile( dest + "report.xlsx", write, err => {
				console.log( err? err: "" )
				console.log( "Success!" )
			})
			res.render( "BoundaryReports", {
				records: out[ out.length - 1 ],
				view: 4,
				total: out[0][0].total
			})	
		})		
	}
})

module.exports = router