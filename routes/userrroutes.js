var express = require("express");
var router = express.Router();
var exe = require("./connection");
var url = require("url");
const session = require("express-session");
const { route, param } = require("./adminroutes");



function checkLogin(req,res,next){
    
    if(req.session.cust_id == undefined){
        res.redirect("/login");
    }
    else{
        next();
        
    }

}



router.post("/save_login", async function(req, res) {
    var d = req.body;
    var sql = `select * from signup where email = '${d.email}' and password = '${d.password}' `;
    var data = await exe(sql);
    
    if (data.length > 0) {
        req.session.cust_id = data[0].id;
        res.redirect("/"); // End execution here

        // return res.send(data)
        // res.send(data)
        // res.send(req.session.cust_id)
        
    } else {
        res.send("login failed"); // End execution here
    }
});



router.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            console.error("Error destroying session:", err);
            return res.status(500).send("Failed to log out");
        }
        // Clear the cookie
        res.clearCookie('connect.sid'); // 'connect.sid' is the default session cookie name
        // res.send("Logged out successfully");
        res.redirect("/")
        // res.send("<script>alert('Logged out successfully');window.location.replace('/')</script>");
    });
});



router.get("/",  async function(req,res){
    var about_us = await exe(`select * from about_us`)
    var our_project_information =await exe(`select * from our_project_information `);
    var our_project_information1 =await exe(`select * from our_project_information limit 3`);
    var testimonial_information = await exe(`select * from testimonial_information`);
    var client1 = await exe(`select * from testimonial_client where client_id = 1`)
    var client2 = await exe(`select * from testimonial_client where client_id = 2`)
    var client3 = await exe(`select * from testimonial_client where client_id = 3`)
    var work_sec = await exe(`select * from work_section_heading`)
    var work_step = await exe(`select * from work_sec_heading`)

    var slider_data = await exe(`SELECT * FROM sliders`)
    var bdata = await exe(`select * from blog_details limit 3`)
    var count =  await exe(`select * from counter`)

    
    var id = req.session.cust_id;
    var ldata = await exe(`select * from signup where id = '${id}'`)

    

    
    var obj = {"about_us":about_us[0],"project_info":our_project_information,"project_info1":our_project_information1,"test_info":testimonial_information[0],"client1":client1[0],"client2":client2[0],"client3":client3[0],"work_sec":work_sec[0],"work_step":work_step,"slider_data":slider_data,"bdata":bdata,"count":count[0],"login":ldata[0],}; 
    res.render("user/home.ejs",obj);
    // res.send(obj);
    


})










router.get("/about",async  function (req, res) {
    var about_us = await exe(`select * from about_us_info`);
    var mvimage = await exe(`select * from mvimage`);
    var mvsec = await exe(`select * from mvinfo`)
    var count =  await exe(`select * from counter`)
    var tdata = await exe(`select * from team_member `)
    var obj = {"about_us":about_us[0],"image":mvimage[0],"mvsec":mvsec[0],"count":count[0],"tdata":tdata} 
    res.render("user/about.ejs",obj);
  })
  
  
  
  
  
  
  router.get("/blog", async function (req, res) {

    var blog_count = await exe(`select count(*) as blogttl from blog_details`)
    const url_data = url.parse(req.url, true).query;
  
    const limit = 3;
    const page = parseInt(url_data.page) || 1;
    const offset = (page - 1) * limit;
  
    // Fetch categories from `blog_category` table
    const categories = await exe('SELECT *,(SELECT COUNT(*) FROM blog_details WHERE blog_details.cat_id = blog_category.cat_id) as ttl FROM blog_category order by cat_id desc');
    const news = await exe(`SELECT * FROM news ORDER BY news_id DESC LIMIT 6`);
  
    let blog_details;
    let totalBlogs;
  
    if (url_data.cat_id) {
      // Fetch blog details by category with sorting by `created_date` and `cat_id` in descending order
      blog_details = await exe(`
        SELECT * FROM blog_details
        WHERE cat_id = '${url_data.cat_id}'
        ORDER BY created_date DESC, cat_id DESC
        LIMIT ${limit} OFFSET ${offset}
      `);
  
      totalBlogs = await exe(`
        SELECT COUNT(*) AS count FROM blog_details
        WHERE cat_id = '${url_data.cat_id}'
      `);
    } else {
      // Fetch all blog details with sorting by `created_date` and `cat_id` in descending order
      blog_details = await exe(`
        SELECT * FROM blog_details
        ORDER BY created_date DESC, cat_id DESC
        LIMIT ${limit} OFFSET ${offset}
      `);
  
      totalBlogs = await exe('SELECT COUNT(*) AS count FROM blog_details');
    }
  
    const totalCount = totalBlogs[0].count;
    const totalPages = Math.ceil(totalCount / limit);
  
    const obj = {
      cat: categories,
      old_data: blog_details,
      currentPage: page,
      totalPages: totalPages,
      totalBlogs: totalCount,
      cat_id: url_data.cat_id,
      news: news,
      blog_count:blog_count[0]
    };
    // res.send(obj)
    res.render("user/blog.ejs", obj);
  });
  
  
  
  router.get("/blog_in_det/:id",async function(req,res){
    var id=req.params.id;
    var blog_count = await exe(`select count(*) as blogttl from blog_details`)
    var category =  await exe(`SELECT *,(SELECT COUNT(*) FROM blog_details WHERE blog_details.cat_id = blog_category.cat_id) as ttl FROM blog_category order by cat_id desc`);
    var blog_details = await exe(`select * from blog_details WHERE blog_id ='${id}'`);
    var blog = await exe(`select * from blog_details order by blog_id desc limit 2`);
    var news = await exe(`SELECT * FROM news ORDER BY news_id DESC LIMIT 3`);
    var insta_img = await exe(`select * from instagram_images order by insta_img_id desc limit 6`)
    var obj ={"cat":category,"old_data":blog_details,"blog":blog,"news": news,"insta_img":insta_img,blog_count:blog_count[0]};
    res.render("user/blog_details.ejs",obj);
  })
  
  






















router.get("/contact",async function(req,res){
    var cdata = await exe(`select * from contact`)

    var id = req.session.cust_id;
    var ldata = await exe(`select * from signup where id = '${id}'`)

    


    var obj = {"cdata":cdata[0],"login":ldata[0]}
    res.render("user/contact.ejs",obj)
})

router.post("/save_contact",async function(req,res){

    var d = req.body

    var sql = `INSERT INTO contact_enq (enq_fname, enq_lname, enq_about, enq_email, enq_msg, enq_mobile,status,con_date)VALUES('${d.enq_fname}','${d.    enq_lname}','${d.enq_about}','${d.enq_email}','${d.enq_msg}','${d.enq_mobile}','${d.con_status}','${d.con_date}')`

    var data = await exe(sql)

    res.redirect("/contact")
})


router.post("/save_signup",async function(req,res){
    var d = req.body

    var sql = `insert into signup(fname,mobile,email,password)values('${d.fname}','${d.mobile}','${d.email}','${d.password}')`
    
    var data = await exe(sql)

    res.redirect("/login")
}) 



router.get("/login",function(req,res){

    res.render("user/login.ejs")
})

router.get("/faq",async function(req,res){

    var fdata = await exe(`select * from faq`)

    

    obj={"fdata":fdata}
    res.render("user/faq.ejs",obj)
})







router.get("/gallery", async function(req,res){

    

    var gdata = await exe(`select * from gallery`)


    var obj = {"gdata":gdata}


    res.render("user/gallery.ejs",obj)
})






router.get("/project", async function(req, res) {
    const limit = 6; 
    const page = parseInt(req.query.page) || 1; 
    const offset = (page - 1) * limit;

    

    

    try {
        const pdata = await exe(`SELECT * FROM project LIMIT ${limit} OFFSET ${offset}`);
        
        const countResult = await exe(`SELECT COUNT(*) AS total FROM project`);
        const totalItems = countResult[0].total;
        const totalPages = Math.ceil(totalItems / limit);

        const pagination = {
            totalItems,
            currentPage: page,
            totalPages,
            hasNextPage: page < totalPages,
            hasPrevPage: page > 1
        };

        const obj = {  pdata, pagination };
        res.render("user/project.ejs", obj);
    } catch (error) {
        console.error("Error fetching projects:", error);
        res.status(500).send("Error fetching projects");
    }
});




router.get("/project_details/:id",async function(req,res){

    var id = req.params.id

    

    var pdata = await exe(`select * from project where id = '${id}'`)

    let ar=[]
    var data=await exe(`select*from project`);
   for(let i=0;i<data.length;i++){
    if(data[i].id!=id){
        ar.push(data[i]);
    }
   }
    

   


    //var rdata = await exe(`select * from project order by id desc limit 3`)



    var obj = {"pdata":pdata[0],"rdata":ar}

//  res.send(obj);
    
   res.render("user/project_details.ejs",obj)
})



router.get("/service",async function(req,res){


    

    var sdata = await exe(`select * from service`)

    obj = {"sdata":sdata}


    res.render("user/service.ejs",obj)
})


router.get("/service_enqform/:id",async function(req,res){
    var id = req.params.id
    var sdata = await exe(`select * from service where id = '${id}' `)
    var obj = {"sdata":sdata[0]}
    res.render("user/service_enqform.ejs",obj)
})


router.post("/save_project",async function(req,res){
    var d = req.body

    var sql = `insert into service_enq(enq_name,enq_mobile,enq_email,enq_address,plan_id,service_plan, enq_date,status)values('${d.enq_name}','${d.enq_mobile}','${d.enq_email}','${d.enq_address}','${d.plan_id}','${d.service_plan}','${d.enq_date}','Pending')`;

    var data = await exe(sql)

    res.redirect("/service")
})




























module.exports = router;

