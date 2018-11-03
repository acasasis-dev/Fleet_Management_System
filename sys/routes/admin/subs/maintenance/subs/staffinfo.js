var router = require( "express" ).Router()
var db = require( "db" )()
var p = require( "path" ).dirname
fdesc = ""
added = 0
deleted = 0
edited = 0

router.get( "/", ( req, res ) => {
	staff = req.query.staff

	const q = `
		select
			a.*,
			b.*
		from
			staffs a join
			staff_type b
        on
            a.staff_id=${ staff } and
			a.staff_type_id=b.staff_type_id;
		select * from staff_type
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )		
		res.render( "StaffInfo", {
			staff_info: out[0],
			staff_types: out[1],
			id: staff,
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
	r = req.body
	id = r.id
	fname = r.fname
	mname = r.mname
	lname = r.lname
	bday = r.bday
	gender = r.gender
	address = r.address
	contact = r.contact
	stype = r.stype

	q = `
		update staffs
		set
			staff_fn="${ fname }",
			staff_mn="${ mname }",
			staff_ln="${ lname }",
			staff_bday="${ bday }",
			staff_sex="${ gender }",
			staff_address="${ address }",
			staff_contact="${ contact }",
			staff_type_id=${ stype }
		where
			staff_id=${ id }
	`

	db.query( q, ( err, out ) => {
		console.log( err? err: "" )
		if( !err ) {
			edited = 1
		}
		res.redirect( "/admin/maintenance/staffinfo?staff=" + id )
	})
})

module.exports = router