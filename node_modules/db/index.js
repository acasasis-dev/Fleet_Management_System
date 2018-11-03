var mysql = require("mysql")
var con

module.exports = () => {
	if(con) return con

	con = mysql.createConnection({
		host: process.env.DB_HOST,
		user: process.env.DB_USER,
		password: process.env.DB_PASSWORD,
		database: process.env.DB_NAME,
		multipleStatements: true
	})

	return con
}
