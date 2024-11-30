var mysql = require("mysql");
var util = require("util");

var conn = mysql.createConnection({
    host:"bu3mmrbmiglfalvrqjo4-mysql.services.clever-cloud.com",
    user:"ufe0p5tddmdlzgkv",
    password:"wMwujN2KqQfGYrLqe935",
    database:"bu3mmrbmiglfalvrqjo4"
})

var exe = util.promisify(conn.query).bind(conn);

module.exports = exe;
