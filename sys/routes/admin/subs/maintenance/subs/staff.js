var router = require( "express" ).Router()
var db = require( "db" )()
var p = require( "path" ).dirname
fdesc = ""
added = 0
deleted = 0
edited = 0

router.get( "/", ( req, res ) => {
	const q = `
		select
			a.*,
			b.*,
			c.*
		from
			staffs a join
			staff_type b
		on
			a.staff_type_id=b.staff_type_id left join
			staff_assignment c
		on
			a.staff_assignment_id=c.s_assignment_id;
		select * from unit_type;
	`

	db.query( q, ( err, out ) => {
		res.render( "Staff" , {
			staffs: out[0],
			utypes: out[1],
			fform: failed == 1? failed_form: {},
			fdesc: fdesc,
			added: added,
			deleted: deleted,
			edited: edited
		})
		failed = 0
		fform = {}
		fdesc = ""
		added = 0
		deleted = 0
		edited = 0
	})
})

router.post( "/", ( req, res ) => {
	var r = req.body
	var fname = r.fname
	var mname = r.mname
	var lname = r.lname
	var sex = r.sex
	var bday = r.bday
	var address = r.address
	var contact = r.contact
	var stype = r.stype
	var password = r.password
	var bus = r.bus? 1: 0
	var fx = r.fx? 1: 0
	var jeep = r.jeep? 1: 0
	var taxi = r.taxi? 1: 0
	var uv = r.uv? 1: 0

	const staff_ass_q = `
		insert into
			staff_assignment(
				Bus,
				FX,
				Jeep,
				Taxi,
				UV
			) values(
				${ bus },
				${ fx },
				${ jeep },
				${ taxi },
				${ uv }
			)
	`

	db.query( staff_ass_q, ( err, out ) => {
		ssid = out.insertId

		const staff_q = `
			insert into
				staffs(
					staff_fn,
					staff_mn,
					staff_ln,
					staff_sex,
					staff_bday,
					staff_address,
					staff_contact,
					staff_assignment_id,
					staff_type_id,
					staff_password
				) values(
					"${ fname }",
					"${ mname }",
					"${ lname }",
					"${ sex }",
					"${ bday }",
					"${ address }",
					"${ contact }",
					${ ssid },
					${ stype },
					"${ password }"
				)
		`

		db.query( staff_q, ( err, out ) => {
			if( err ) {
				failed = 1
				failed_form = r
				if( err.code == "ER_DUP_ENTRY" )
					fdesc = "Staff Already Exists"
			} else {
				added = 1
			}
			res.redirect( "/admin/maintenance/staff" )
		})
	})
})

router.post( "/edit", ( req, res ) => {
	var r = req.body
	var id = r.id
	var pic = req.files? req.files.pic: { name: "" }
	var fname = r.fname
	var mname = r.mname
	var lname = r.lname
	var sex = r.sex
	var bday = r.year + "-" + r.month + "-" + r.day
	var address = r.address
	var contact = r.contact
	var sid = r.sid
	var passwd = r.passwd
	
	const q = `
		update staff
		set 
			staff_pic="${ pic.name }",
			staff_fn="${ fname }",
			staff_mn="${ mname }",
			staff_ln="${ lname }",
			staff_sex="${ sex }",
			staff_bday="${ bday }",
			staff_address="${ address }",
			staff_contact="${ contact }",
			stafftype_id=${ sid },
			staff_password="${ passwd }"
		where staff_id=${ id }
	`
	db.query( q, ( err, out ) => {
		if( pic.name ) {
			pic.mv( p( p( p( p( p( p( p( __dirname ) ) ) ) ) ) ), err => {
				if( err )
					console.log( err )
				else
					console.log( pic.name + " uploaded ..." )
			})
		}
		res.redirect( "/admin/maintenance/staff" )
	})
})

router.post( "/delete", ( req, res ) => {
	var id = req.body.id
	const q = `
		delete from staffs
		where staff_id=${ id }
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		console.log( req.body )
		if( err ) {
			deleted = 2
			fdesc = "Delete failed"
		} else {
			deleted = 1
		}
		res.redirect( "/admin/maintenance/staff" )
	})
})

module.exports = router