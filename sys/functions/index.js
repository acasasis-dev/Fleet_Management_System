exports.in( table, *data ) {
	var str = "insert into " + table + " values "
	data.foreach( cur => {
		cur = "( " + cur + " )"
		str += cur
	})
	return str
}