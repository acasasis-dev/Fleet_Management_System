var path = require("path")
var morgan = require("morgan")
var serve_static = require("serve-static")
var body_parser = require("body-parser")
var session = require("express-session")
var up = require( "express-fileupload" )

module.exports = app => {
	app.set("port", process.env.PORT || 1234 || process.argv[1])
	app.set("views", path.dirname(__dirname) + "/views")
	app.set("view engine", "ejs")
	app.use( up() )
	app.use(morgan("dev"))
	app.use(serve_static(path.dirname(__dirname) + "/styles"))
	app.use(body_parser.urlencoded({extended: true}))
	app.use(session({
		resave: false,
		saveUninitialized: true,
		secret: "justoursecret"
	}))
}
