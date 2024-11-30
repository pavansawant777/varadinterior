var express = require ("express");
var bodyparser = require("body-parser");
var upload = require("express-fileupload");
var session = require ("express-session");
var userrouter = require("./routes/userrroutes");
var adminrouter = require("./routes/adminroutes");

var app = express();
app.use(express.static("public/"));
app.use(bodyparser.urlencoded({extended:true}));
app.use(upload());
app.use(session({
    secret :"awesdfs",
    resave:true,
    saveUninitialized:true
}))
app.use("/",userrouter);
app.use("/admin",adminrouter);
app.listen(1000);