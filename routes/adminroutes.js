var express = require("express");
var router = express.Router();
var exe = require("./connection")



function checkLogin(req,res,next){
    
    if(req.session.logid == undefined){
        res.redirect("/admin/login");
    }
    else{
        next();
        
    }

}





router.post("/admin_login", async function (req, res) {
    var d = req.body;
    var data = await exe(`select * from admin_profile where admin_name ='${d.admin_name}' and admin_pass ='${d.admin_password}'`);

    if (data.length > 0) {
        req.session.logid = data[0].id
        // res.send("<script>alert('Login Success');location = '/admin/home'</script>")
        res.redirect("/admin/")
    }
    else {
        // res.send("<script>alert('Invalid Details');location = '/admin'</script>");
        res.send("login failed")
    }

})

router.get("/navbar",async function(req,res) {
    var adata = await exe(`select * from admin_profile`)

    var obj ={"adata":adata[0]}

    res.render("admin/navbar.ejs",obj)


    
})


router.get("/",checkLogin,async function (req, res) {
    var adata = await exe(`select * from admin_profile`)

    var data = await exe(`SELECT * FROM contact_enq WHERE status = 'pending' ORDER BY con_date DESC;`);
            var con_enq  = await exe(`SELECT COUNT(*) AS total_enquiries FROM contact_enq WHERE status = 'pending';`)  
            var ser_enq = await exe(`select count(*) as ttl_ser_enq from service_enq WHERE status = 'pending'`)

    var obj = {"adata":adata[0],"enq":data,"con_enq":con_enq[0],ser_enq:ser_enq[0]}

    res.render("admin/home.ejs",obj);

})

router.get("/update_about_us",checkLogin, async function (req, res) {
    var sql = `select * from about_us`;
    var adata = await exe(`select * from admin_profile`)
    

    var data = await exe(sql)
    var obj = { "about_us": data[0],"adata":adata[0] }
    res.render("admin/update_about_us.ejs", obj);
})

router.post("/update_about_us", async function (req, res) {
    var d = req.body;
    if (req.files != null) {
        var file_name = new Date().getTime() + req.files.about_us_image.name;
        req.files.about_us_image.mv("public/user/images/" + file_name);
        var data = await exe(`update about_us set about_us_image = '${file_name}' where about_us_id = '${d.about_us_id}'`);
    }
    var sql = `update about_us set about_us_heading ='${d.about_us_heading}',about_us_description = '${d.about_us_description}',about_us_btn_title = '${d.about_us_btn_title}' where about_us_id = '${d.about_us_id}'`;
    var data = await exe(sql);
    res.send("<script>alert('Record Update Sucessfull');location = '/admin/update_about_us'</script>");

})
router.get("/add_our_project",checkLogin, async function (req, res) {
    var data = await exe(`select * from our_project_information`);
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "project_info": data,"adata":adata[0] };
    res.render("admin/add_our_project.ejs", obj);
})

router.post("/save_our_project", async function (req, res) {
    var d = req.body;
    var file_name = new Date().getTime() + req.files.our_project_image.name;
    req.files.our_project_image.mv("public/user/images/project/" + file_name)
    var sql = `insert into our_project_information(our_project_title,our_project_description,our_project_image)values('${d.our_project_title}','${d.our_project_description}','${file_name}')`;
    var data = await exe(sql)
    res.send("<script>alert('Project added Sucessfull');location ='/admin/add_our_project'</script>")
    // res.redirect("/admin/add_our_project")
})

router.get("/delete_our_project/:id",async function(req,res){
    var data = await exe(`delete from our_project_information where our_project_id = '${req.params.id}'`)
    res.send("<script>alert('Record Deleted Sucessfull');location ='/admin/add_our_project'</script>")
})

router.get("/edit_our_project/:id",checkLogin,async function(req,res){
    var data = await exe(`select * from our_project_information where our_project_id = '${req.params.id}'`);
    var adata = await exe(`select * from admin_profile`)
    

    var obj = {"our_project_info":data[0],"adata":adata[0]}
    //res.send(obj)
     res.render("admin/edit_our_project.ejs",obj);
})

router.post("/update_our_project",async function(req,res){
    var d = req.body;
    if(req.files != null){
    var file_name = new Date().getTime() + req.files.our_project_image.name;
    req.files.our_project_image.mv("public/user/images/project/" + file_name);
    var data  = await exe(`update our_project_information set our_project_image = '${file_name}' where our_project_id ='${d.our_project_id}'`);
    }

    var sql = `update  our_project_information  set our_project_title = '${d.our_project_title}' , our_project_description = '${d.our_project_description}' where our_project_id ='${d.our_project_id}'`;
    var data = await exe(sql)
    res.send("<script>alert('Record Updated');location ='/admin/add_our_project'</script>");
})

router.get("/testiomial",checkLogin, async function (req, res) {
    var data = await exe(`select * from testimonial_information`)
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "test_info": data[0],"adata":adata[0] }
    res.render("admin/update_testimonial.ejs", obj);
})
router.post("/update_testimonial_desc", async function (req, res) {
    var d = req.body;
    var sql =`update testimonial_information set testimonial_heading = '${d.testimonial_heading}',testimonial_description ='${d.testimonial_description}' where testimonial_info_id ='${d.testimonial_info_id}'`;
    var data = await exe(sql);
    res.send("<script>alert('Record Update Successfull');location = '/admin/testiomial'</script>");
})


router.get("/testiomial1",checkLogin, async function (req, res) {
    var client1 = await exe(`select * from testimonial_client where client_id = 1`)
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "client1": client1[0],"data":adata[0] }
    res.render("admin/update_client1.ejs", obj);
})

router.post("/update_client1", async function (req, res) {
    var d = req.body;
    if (req.files != null) {
        var file_name = new Date().getTime() + req.files.client_image.name;
        req.files.client_image.mv("public/admin/img/client_review/" + file_name);
        var data = await exe(`update testimonial_client set client_image = '${file_name}' where client_id = '${d.client_id}'`);
    }
    var sql = `update testimonial_client set client_name ='${d.client_name}',client_description = '${d.client_description}' where client_id = '${d.client_id}'`
    var data = await exe(sql)
    res.send("<script>alert('Record Update Successfull');location = '/admin/testiomial1'</script>");
})


router.get("/testiomial2",checkLogin, async function (req, res) {
    var client2 = await exe(`select * from testimonial_client where client_id = 2`)
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "client2": client2[0],"adata":adata[0] }
    res.render("admin/update_client2.ejs", obj);
})

router.post("/update_client2", async function (req, res) {
    var d = req.body;
    if (req.files != null) {
        var file_name = new Date().getTime() + req.files.client_image.name;
        req.files.client_image.mv("public/admin/img/client_review/" + file_name);
        var data = await exe(`update testimonial_client set client_image = '${file_name}' where client_id = '${d.client_id}'`);
    }
    var sql = `update testimonial_client set client_name ='${d.client_name}',client_description = '${d.client_description}' where client_id = '${d.client_id}'`
    var data = await exe(sql)
    res.send("<script>alert('Record Update Successfull');location = '/admin/testiomial2'</script>");
})

router.get("/testiomial3",checkLogin, async function (req, res) {
    var client3 = await exe(`select * from testimonial_client where client_id = 3`)
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "client3": client3[0],"adata":adata[0] }
    res.render("admin/update_client3.ejs", obj);
})

router.post("/update_client3", async function (req, res) {
    var d = req.body;
    if (req.files != null) {
        var file_name = new Date().getTime() + req.files.client_image.name;
        req.files.client_image.mv("public/admin/img/client_review/" + file_name);
        var data = await exe(`update testimonial_client set client_image = '${file_name}' where client_id = '${d.client_id}'`);
    }
    var sql = `update testimonial_client set client_name ='${d.client_name}',client_description = '${d.client_description}' where client_id = '${d.client_id}'`;
    var data = await exe(sql);
    res.send("<script>alert('Record Update Successfull');location = '/admin/testiomial3'</script>");
})

router.get("/change_heading",checkLogin,async function(req,res){
    var data = await exe(`select * from work_section_heading`);
    var adata = await exe(`select * from admin_profile`)
    

    var obj ={"work_sec":data[0],"adata":adata[0]}
    res.render("admin/update_work_heading.ejs",obj);
})


router.post("/update_work_heading",async function(req,res){
    var d = req.body;
    var sql=`update work_section_heading set sec_heading = '${d.sec_heading}', main_heading = '${d.main_heading}',sub_heading='${d.sub_heading}' where work_sec_id = '${d.work_sec_id}'`;
    var data = await exe(sql);
    res.send("<script>alert('Record Update Successfull');location = '/admin/change_heading'</script>");

})

router.get("/add_work_steps",checkLogin,async function(req,res){
    
    var data = await exe(`select * from work_sec_heading`)
    var adata = await exe(`select * from admin_profile`)
    

    var obj={"old_data":data,"adata":adata[0]}
    // res.send(data)
    res.render("admin/add_work_step.ejs",obj);
})

router.post("/save_add_work",async function(req,res){
    var d = req.body;
    var sql = `insert into work_sec_heading(working_step_heading,working_step_description)values('${d.working_step_heading}','${d.working_step_description}')`;
    var data = await exe(sql);
    res.send("<script>alert('Record Added Successfull');location = '/admin/add_work_steps'</script>");
})


router.get("/login",function(req,res){
    res.render("admin/login.ejs")
})






router.get("/delete_work_step/:id", async function (req, res) {
    var data = await exe(`delete from work_sec_heading where work_sec_id ='${req.params.id}'`)
    res.send("<script>alert('Record Deleted');location = '/admin/add_work_steps'</script>");
})





router.get("/edit_work_step/:id",checkLogin,async function(req,res){

    var data  = await exe(`select * from work_sec_heading where work_sec_id = '${req.params.id}'`);
    var adata = await exe(`select * from admin_profile`)

    var obj = {"data":data[0],"adata":adata[0]}
    res.render("admin/edit_work_step.ejs",obj);
});

router.post("/update_add_work_step",async function(req,res){
    var d = req.body;
    var sql = `update work_sec_heading set working_step_heading = '${d.working_step_heading}' , working_step_description = '${d.working_step_description}' where work_sec_id = '${d.work_sec_id}'`;
    var data = await exe(sql);
    res.send("<script>alert('Record Update');location = '/admin/add_work_steps'</script>");

})

router.get("/add_blog_cat",checkLogin, async function (req, res) {
    var data = await exe(`select * from blog_category`);
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "blog_cat": data,"adata":adata[0] }
    res.render("admin/add_blog_cat.ejs", obj);
})

router.post("/save_blog_cat", async function (req, res) {
    var d = req.body;
    var sql = `insert into blog_category(blog_cat)values('${d.blog_cat}')`;
    var data = await exe(sql)
    res.send("<script>alert('Category Added Sucessfully');location = '/admin/add_blog_cat'</script>");

})

router.get("/edit_blog_cat/:id",checkLogin, async function (req, res) {
    var data = await exe(`select * from blog_category where cat_id = '${req.params.id}'`);
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "blog_cat": data[0],"adata":adata[0] }
    res.render("admin/edit_blog_cat.ejs", obj);
});

router.post("/update_blog_cat", async function (req, res) {
    var d = req.body;
    var sql = `update blog_category set blog_cat = '${d.blog_cat}' where cat_id ='${d.cat_id}'`;
    var data = await exe(sql)
    res.send("<script>alert('Category Update Sucessfully');location = '/admin/add_blog_cat'</script>");

})

router.get("/delete_blog_cat/:id", async function (req, res) {
    var sql = `delete from blog_category where cat_id ='${req.params.id}'`;
    var data = await exe(sql)
    res.send("<script>alert('Category delete Sucessfully');location = '/admin/add_blog_cat'</script>");

})

router.get("/add_blog",checkLogin, async function (req, res) {
    var blog_details = await exe(`select * from blog_details order by blog_id desc`)
    var data = await exe(`select * from blog_category`)
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "blog_cat": data, "blog_details": blog_details,"adata":adata[0] }
    res.render("admin/add_blog.ejs", obj)
})
router.post("/add_blog", async function (req, res) {
    var d = req.body;
    var file_name = new Date().getTime() + req.files.blog_image.name;
    req.files.blog_image.mv("public/user/images/blog/" + file_name);
    var sql = `insert into blog_details(blog_head,blog_post_by,blog_desc,cat_id,blog_image)values('${d.blog_head}','${d.blog_post_by}','${d.blog_desc}','${d.cat_id}','${file_name}')`;
    var data = await exe(sql);
    res.send("<script>alert('Blog added Sucessfully');location = '/admin/add_blog'</script>");
})


router.get("/add_news",checkLogin, async function (req, res) {
    var data = await exe(`select * from news`);
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "news": data,"adata":adata[0] };
    res.render("admin/add_news.ejs", obj);
})

router.post("/save_news", async function (req, res) {
    var d = req.body;
    var file_name = new Date().getTime() + req.files.news_image.name;
    req.files.news_image.mv("public/user/images/news/" + file_name);
    var sql = `insert into news(news_date,news_desc,news_image)values('${d.news_date}','${d.news_desc}','${file_name}')`;
    var data = await exe(sql)
    res.send("<script>alert('News added Sucessfully');location = '/admin/add_news'</script>");
})

router.get("/delete_news/:id", async function (req, res) {
    var data = await exe(`delete from news where news_id = '${req.params.id}'`);
    res.send("<script>alert('News Delete Sucessfully');location = '/admin/add_news'</script>");
})

router.get('/edit_news/:id',checkLogin, async function (req, res) {
    var data = await exe(`select * from news where news_id = '${req.params.id}'`);
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "news": data[0],"adata":adata[0] }
    res.render("admin/edit_news.ejs", obj);
})

router.post("/update_news", async function (req, res) {
    var d = req.body
    if (req.files != null) {
        var file_name = new Date().getTime() + req.files.news_image.name;
        req.files.news_image.mv("public/user/images/news/" + file_name);
        var data = await exe(`update news set news_image = '${file_name}' where news_id ='${d.news_id}'`);
    }
    var sql = `update news set news_date = '${d.news_date}',news_desc = '${d.news_desc}' where news_id ='${d.news_id}'`;
    var data = await exe(sql);
    res.send("<script>alert('News Update Sucessfully');location = '/admin/add_news'</script>");
});

router.get("/delete_blog_details/:id", async function (req, res) {
    var data = await exe(`delete from blog_details where blog_id ='${req.params.id}'`);
    res.send("<script>alert('Blog Deleted');location = '/admin/add_blog'</script>");
});

router.get("/edit_blog_details/:id",checkLogin, async function (req, res) {

    var sql = await exe(`select * from blog_details where blog_id ='${req.params.id}'`);
    var data = await exe(`select * from blog_category`);
    var adata = await exe(`select * from admin_profile`)
    

    var obj = { "blog_det": sql[0], "cat": data,"adata":adata[0] };
    // res.send(obj)
    res.render("admin/edit_blog.ejs", obj);
});

router.post("/update_blog_details", async function (req, res) {

    var d = req.body
    if (req.files != null) {
        var file_name = new Date().getTime() + req.files.blog_image.name;
        req.files.blog_image.mv("public/user/images/blog/" + file_name);
        var sql = ` update blog_details set blog_image = '${file_name}' where blog_id = '${d.blog_id}'`;
        var data = await exe(sql);
    }

    var sql1 = `update blog_details set cat_id = '${d.cat_id}',blog_head='${d.blog_head}',blog_post_by = '${d.blog_post_by}',blog_desc = '${d.blog_desc}' where blog_id = '${d.blog_id}'`;
    var data1 = await exe(sql1);
    res.send("<script>alert('Blog Update Sucessfull');location='/admin/add_blog'</script>");
})

router.get("/add_instagram_images",checkLogin, async function (req, res) {
    var data = await exe(`select * from instagram_images order by insta_img_id desc`)
    var adata = await exe(`select * from admin_profile`)

    var obj = { "insta_img": data,"adata":adata[0] };
    res.render("admin/add_insta_images.ejs", obj);
})


router.post("/add_instagram_images", async function (req, res) {
    var d = req.body;
    var file_name = new Date().getTime() + req.files.insta_image.name;
    req.files.insta_image.mv("public/user/images/instagram/" + file_name);

    var sql = `insert into instagram_images (insta_image)values ('${file_name}')`;
    var data = await exe(sql)

    res.send("<script>alert('Image Added Sucessfull');location='/admin/add_instagram_images'</script>");
})

router.get("/edit_insta_image/:id",checkLogin, async function (req, res) {
    var id = req.params.id;
    var data = await exe(`select * from instagram_images where insta_img_id = '${id}'`);
    var adata = await exe(`select * from admin_profile`)

    var obj = { "insta_img": data[0],"adata":adata[0] };
    res.render("admin/edit_insta_img.ejs", obj);
})

router.get("/delete_insta_image/:id", async function (req, res) {
    var data = await exe(`delete from instagram_images where insta_img_id = '${req.params.id}'`);
    res.send("<script>alert('Image Delete Sucessfull');location='/admin/add_instagram_images'</script>");
});

router.post("/update_insta_img",async function (req, res) {
    var d = req.body;
    if (req.files != null) {
        var file_name = new Date().getTime() + req.files.insta_image.name;
        req.files.insta_image.mv("public/user/images/instagram/" + file_name);
        var sql =`update instagram_images set insta_image = '${file_name}' where insta_img_id ='${d.insta_img_id}'`;
        var data = await exe(sql);
    res.send("<script>alert('Image Update Sucessfull');location='/admin/add_instagram_images'</script>");
    }
})

router.get("/update_about_us_info",checkLogin,async function(req,res){
    var data = await exe (`select * from about_us_info`);
    var adata = await exe(`select * from admin_profile`)

    var obj = {"info":data[0],"adata":adata[0]}
    res.render("admin/update_about_us_info.ejs",obj);
});
router.post("/update_about_us_info",async function(req,res){
    var d = req.body;
    if (req.files != null) {
        var file_name = new Date().getTime() + req.files.about_us_info_image.name;
        req.files.about_us_info_image.mv("public/user/images/about_us/" + file_name);
        var sql =`update about_us_info  set about_us_info_image = '${file_name}' where about_us_id ='${d.about_us_id}'`;
        var data = await exe(sql);
    }
    var sql1 = `update about_us_info set about_heading = '${d.about_heading}',about_us_desc = '${d.about_us_desc}',button_name = '${d.button_name}' where about_us_id = '${d.about_us_id}'`;
    var data1 = await exe(sql1);
    res.send("<script>alert('Information Update Sucessfull');location='/admin/update_about_us_info'</script>");

})

router.get("/add_gallery_image",checkLogin,async function(req,res){
    var adata = await exe(`select * from admin_profile`)
    var obj = {"adata":adata[0]}
    res.render("admin/add_gallery.ejs",obj)
})

router.post("/save_gallery",async function(req,res){
    var d = req.body;
    var file_name = new Date().getTime() + req.files.gallery_image.name;
    req.files.gallery_image.mv("public/user/images/gallery/" + file_name);

    var sql = `insert into gallery (gallery_image)values ('${file_name}')`;
    var data = await exe(sql);
    res.send("<script>alert('image Added Sucessfull');location='/admin/add_gallery_image'</script>");
})

router.get("/update_mission_vission_info",checkLogin,async function(req,res){
    var data = await exe(`select * from mvinfo`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"info":data[0],"adata":adata[0]};
    res.render("admin/update_missin_vission.ejs",obj);
})

router.post("/update_mission_vission",async function(req,res){
    var d = req.body ;
    var sql =`update mvinfo set our_company_history ='${d.our_company_history}',our_success_mission = '${d.our_success_mission}',our_future_plan = '${d.our_future_plan}' where mvinfo_id = '${d.mvinfo_id}'`;
    var data = await exe(sql);
    res.send("<script>alert('Record Update Sucessfull');location='/admin/update_mission_vission_info'</script>");
})
router.get("/update_mission_vission_img",checkLogin,async function(req,res){
    var data = await exe(`select * from mvimage`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"mvimage":data[0],"adata":adata[0]};
    res.render("admin/update_missin_vission_img.ejs",obj);
})
router.post("/update_mission_vission_img_",async function(req,res){
    var d = req.body;
    if(req.files != null){
        var file_name = new Date().getTime() + req.files.mvimage.name;
        req.files.mvimage.mv("public/user/images/mvimage/" + file_name);
    
        var sql = `update mvimage set mvimage = '${file_name}' where mvid = '${d.mvid}'`;
        var data = await exe(sql);
        res.send("<script>alert('image update Sucessfull');location='/admin/update_mission_vission_img'</script>");
    }
})












































router.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            console.error("Error destroying session:", err);
            return res.status(500).send("Failed to log out");
        }
        // Clear the cookie
        res.clearCookie('connect.sid'); // 'connect.sid' is the default session cookie name
        // res.send("Logged out successfully");
        res.redirect("/admin/login")
        // res.send("<script>alert('Logged out successfully');window.location.replace('/')</script>");
    });
});















router.get("/slider",checkLogin,async function(req,res){
    var sdata = await exe(`SELECT * FROM sliders`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"sdata":sdata,"adata":adata[0]}
    res.render("admin/slider.ejs",obj)
})

router.post("/save_slider",async function(req,res){
    var d = req.body;

    var slider_img = new Date().getTime()+req.files.slider_img.name

    req.files.slider_img.mv("public/uploads/"+slider_img)

    var sql = `INSERT INTO sliders(slider_img,slider_head,slider_subhead,slider_btn_name,slider_btn_url)VALUES('${slider_img}','${d.slider_head}','${d.slider_subhead}','${d.slider_btn_name}','${d.slider_btn_url}')`

    var data = await exe(sql)

    // res.send("ok")
    res.redirect('/admin/slider')
})


router.get("/delete_slider/:id", async function(req,res){

    var id = req.params.id

    var data = await exe(`delete from sliders where id = '${id}'`)

    res.redirect("/admin/slider")
})

router.get("/edit_slider/:id",checkLogin,async function(req,res){

    var id = req.params.id

    var data = await exe(`select * from sliders where id ='${id}'`)
    var adata = await exe(`select * from admin_profile`)

    
    var obj = {"slider_info": data[0],"adata":adata[0]}

    res.render("admin/edit_slider.ejs",obj)

    
})

router.post("/update_slider",async function(req,res){
    var d = req.body;

    if(req.files != null){

        var slider_img = new Date().getTime()+req.files.slider_img.name

        req.files.slider_img.mv("public/uploads/"+slider_img)

        var sql = `update sliders set slider_img = '${slider_img}' where id = '${d.id}'`

        var data = await exe(sql)
    }


    var sql = `update sliders set slider_head = '${d.slider_head}', slider_subhead = '${d.slider_subhead}', slider_btn_name = '${d.  slider_btn_name}', slider_btn_url = '${d.slider_btn_url}' where id = '${d.id}'`

    var data = await exe(sql)

    // res.send("updated")

    res.redirect("/admin/slider")
})



router.get("/blog",checkLogin,async function(req,res){
    var bdata = await exe(`select * from blog`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"bdata":bdata,"adata":adata[0]} 
    res.render("admin/blog.ejs",obj)
})


router.post("/save_blog",async function(req,res){

    var d = req.body

    var blog_img = new Date().getTime()+req.files.blog_img.name

    req.files.blog_img.mv("public/uploads/"+blog_img)

    var sql = `insert into blog (blog_img,bloger_name,blog_head,blog_details) values ('${blog_img}','${d.bloger_name}','${d.blog_head}','${d.blog_details}')`

    var data = await exe(sql)

    // res.send("ok")
    res.redirect("/admin/blog")

})

router.get("/delete_blog/:id",async function(req,res){

    var id = req.params.id

    

    var data = await exe(`delete from blog where id = '${id}'`)

    res.redirect("/admin/blog")

    
})

router.get("/edit_blog/:id",checkLogin,async function(req,res){
    var id = req.params.id

    var bdata = await exe(`select * from blog where id = '${id}'`)
    var adata = await exe(`select * from admin_profile`)


    var obj = {"bdata":bdata[0],"adata":adata[0]}

    res.render("admin/update_blog.ejs",obj)

})


router.post("/update_blog", async function(req,res){

    var d = req.body

    if(req.files != null){

        var blog_img = new Date().getTime()+req.files.blog_img.name

        req.files.blog_img.mv("public/uploads/"+blog_img)

        var sql = `update blog set blog_img = '${blog_img}' where id = '${d.id}'`

        var data = await exe(sql)
    }

    var sql = `update blog set bloger_name = '${d.bloger_name}', blog_head = '${d.blog_head}',blog_details = '${d.blog_details}' where id ='${d.id}'`

    var data = await exe(sql)


    res.redirect("/admin/blog")
})


router.get("/counter",checkLogin,async function(req,res){
    var count =await exe( `select * from counter`)
    var adata = await exe(`select * from admin_profile`)

    var obj ={"count":count[0],"adata":adata[0]}
    res.render("admin/counter.ejs",obj)
})



router.post("/update_count",async function(req,res){

    var d = req.body

    var sql = `update counter set counter_head = '${d.counter_head}', int_count ='${d.int_count}',arc_count='${d.arc_count}',con_count = '${d.con_count}',pro_count = '${d.pro_count}' where id = '${d.id}'`

    var data = await exe(sql)

    res.redirect("/admin/counter")

})

router.get("/contact",checkLogin,async function(req,res){
    var data = await exe(`select * from contact`)
    var adata = await exe(`select * from admin_profile`)

    

    var obj = {"data":data[0],"adata":adata[0]}
    res.render("admin/contact.ejs",obj)
})


router.post("/update_contact",async function(req,res){


    var d = req.body

    var sql = `update contact set contact_add = '${d.contact_add}',contact_email = '${d.contact_email}',contact_mobile = '${d.contact_mobile}',contact_am = '${d.contact_am}' , contact_pm = '${d.contact_pm}' where id = '${d.id}'`

    var data = await exe(sql)

    res.redirect("/admin/contact")
})

router.get("/contact_enq",checkLogin,async function(req,res){
    var cdata = await exe(`select * from contact_enq`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"cdata":cdata,"adata":adata[0]}

    res.render("admin/contact_enq.ejs",obj)
})

router.get("/delete_enq/:id",async function(req,res){
    var id = req.params.id

    var data = await exe(`delete from contact_enq where id = ${id}`)

    res.redirect("/admin/contact_enq")
})

router.get("/status_app/:id",async function(req,res){

    var id = req.params.id

    
    var data = await exe(`update contact_enq set status = 'Approved' where id = '${id}'`)

    res.redirect("/admin/contact_enq")
    // res.send(id)
})

router.get("/status_rej/:id",async function(req,res){
    var id = req.params.id

    var data = await exe(`update contact_enq set status = 'Rejected' where id ='${id}'`)

    res.redirect("/admin/contact_enq")
})




router.get("/faq",checkLogin,async function(req,res){

    var fdata = await exe(`select * from faq`)
    var adata = await exe(`select * from admin_profile`)


    obj = {"fdata":fdata,"adata":adata[0]}
    res.render("admin/faq.ejs",obj)
})

router.post("/savefaq",async function(req,res){

    var d = req.body

    var sql = `insert into faq(faq_que,faq_ans)values('${d.faqque}','${d.faqans}')`

    var data =await exe(sql)

    res.redirect("/admin/faq")
})

router.get("/delete_faq/:id",async function(req,res){
    var id = req.params.id

    var data = await exe(`delete from faq where id = '${id}'`)

    res.redirect("/admin/faq")
})

router.get("/edit_faq/:id",async function(req,res){
    var id = req.params.id
    var adata = await exe(`select * from admin_profile`)

    var fdata = await exe(`select * from faq where id = '${id}'`)

    var obj = {"fdata":fdata[0],"adata":adata[0]}

    res.render("admin/update_faq.ejs",obj)
    // res.send(obj)

})

router.post("/updatefaq",async function(req,res){
    var d = req.body

    var sql = `update faq set faq_que = '${d.faqque}', faq_ans ='${d.faqans}' where id ='${d.id}' `

    var data = await exe(sql)

    res.redirect("/admin/faq")
})



router.get("/profile",checkLogin,async function(req,res){
    var data = await exe(`select * from admin`);
    var idata = await exe(`select * from admin_profile`)
    var adata = await exe(`select * from admin_profile`)

    var obj ={"admin":data[0],"idata":idata[0],"adata":adata[0]}
    res.render("admin/profile.ejs",obj)
    // res.send(obj)
})


router.post("/save_profile",async function(req,res){

    var d = req.body

    if(req.files !== null){

        var profile_img = new Date().getTime()+req.files.admin_img.name

        req.files.admin_img.mv("public/uploads/"+profile_img)


        var sql = `update admin_profile set admin_img = '${profile_img}' where id =1`

        var data = await exe(sql)

    }

    var sql = `update admin set admin_password ='${d.admin_pass}' where admin_id = 1`

    var data = await exe(sql)

        

    res.redirect("/admin/profile")




})


router.get("/gallery",checkLogin, async function(req,res){
    var gdata = await exe( `select * from gallery`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"gdata":gdata,"adata":adata[0]}

    res.render("admin/gallery.ejs",obj)
})




router.post("/save_gallery",async function(req,res){

    var d = req.body

    var gallery_img = new Date().getTime()+req.files.gallery_img.name

    req.files.gallery_img.mv("public/uploads/"+gallery_img)

    var sql = `insert into gallery (gallery_img,gallery_head)values('${gallery_img}','${d.gallery_head}')`

    var data = await exe(sql)

    res.redirect("/admin/gallery")



})

router.get("/gallery_delete/:id",async function(req,res){
    
    var id = req.params.id

    var data = await exe(`delete from gallery where id = ${id}`)    

    res.redirect("/admin/gallery")
})


router.get("/gallery_update/:id",checkLogin,async function(req,res){
    var id = req.params.id

    var gdata = await exe(`select * from gallery where id = ${id} `)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"gdata":gdata[0],"adata":adata[0]}

    res.render("admin/gallery_update.ejs",obj)

})

router.post("/update_gallery",async function(req,res){

    var d = req.body

    if (req.files != null){

        var gallery_img = new Date().getTime()+req.files.gallery_img.name

        req.files.gallery_img.mv("public/uploads/"+gallery_img)

        var sql = `update gallery set gallery_img = '${gallery_img}' where id= '${d.id}'`

        var data = await exe(sql)
    }

    var sql = `update gallery set gallery_head = '${d.gallery_head}' where id = '${d.id}' `

    var data = await exe(sql)

    res.redirect("/admin/gallery")

})


router.get("/project",checkLogin,async function(req,res){
    var pdata = await exe(`select * from project`)
    var adata = await exe(`select * from admin_profile`)

    var obj ={"pdata":pdata,"adata":adata[0]}
    res.render("admin/project.ejs",obj)
})


router.post("/save_project",async function(req,res){

    var d = req.body

    var project_img = new Date().getTime()+req.files.project_img.name

    req.files.project_img.mv("public/uploads/"+project_img)

    var sql = `insert into project(project_type,project_name,project_img,client_name,project_date,project_budget,project_basic_info,project_challenge)values('${d.project_type}','${d.project_name}','${project_img}','${d.client_name}','${d.project_date}','${d.project_budget}','${d.project_basic_info}','${d.project_challenge}')`

    var data = await exe(sql)

    res.redirect("/admin/project")
    // res.send(req.body)
})

router.get("/project_delete/:id",async function(req,res){

    var id = req.params.id

    var sql = `delete from project where id = '${id}'`

    var data = await exe(sql)

    res.redirect("/admin/project")

    

})


router.get("/project_update/:id",checkLogin,async function(req,res){

    var id = req.params.id

    var pdata = await exe(`select * from project where id = '${id}' `)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"pdata":pdata[0],"adata":adata[0]}

    res.render("admin/update_project.ejs",obj)

    

})

router.post("/update_project",async function(req,res){

    var d = req.body

    if(req.files != null){
        var project_img = new Date().getTime()+req.files.project_img.name

        req.files.project_img.mv("public/uploads/"+project_img)

        var sql = `update project set project_img = '${project_img}' where id = '${d.id}'`

        var data = await exe(sql)
    }

    var sql = `update project set project_type = '${d.project_type}',project_name = '${d.project_name}' , client_name = '${d.client_name}',project_date = '${d.project_date}',project_budget = '${d.project_budget}',project_basic_info = '${d.project_basic_info}',project_challenge = '${d.project_challenge}' where id ='${d.id}'`

    var data = await exe(sql)

    res.redirect("/admin/project")
})


router.get("/service",checkLogin,async function(req,res){
    
    var sdata = await exe(`select * from service`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"sdata":sdata,"adata":adata[0]}

// res.send(sdata)
    res.render("admin/service.ejs",obj)
})


router.post("/save_service", async function(req,res){
    var d = req.body
    
    var sql = `insert into service(service_plan,service_rate,service_feature)values('${d.service_plan}','${d.service_rate}','${d.service_feature}')`

    var data = await exe(sql)
    

    res.redirect("/admin/service")

})

router.get("/delete_service/:id", async function(req,res){

    var id = req.params.id

    var sql = ` delete from service where id = '${id}' `

    var data = await exe(sql)

    res.redirect("/admin/service")


})


router.get("/edit_service/:id",checkLogin,async function(req,res){
    var id = req.params.id

    var data = await exe(`select * from service where id ='${id}'`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"sdata":data[0],"adata":adata[0]}

    res.render("admin/update_service.ejs",obj)
})


router.post("/update_service",async function(req,res){

    var d = req.body

    var sql = `update service set service_plan = '${d.service_plan}',service_rate = '${d.service_rate}',service_feature = '${d.service_feature}' where id = '${d.id}'`

    var data = await exe(sql)

    res.redirect("/admin/service")
})

router.get("/service_enq",checkLogin,async function(req,res){

    var sedata = await exe(`select * from service_enq`);
    var splan = await exe(`select * from service `);
    var adata = await exe(`select * from admin_profile`)

    var obj ={"sedata":sedata ,"splan":splan,"adata":adata[0]}

    res.render("admin/service_enqform.ejs",obj)
})

router.get("/service_app/:id",async function(req,res){
    var id = req.params.id
    var d = req.body

    var data = await exe(`update service_enq set status = 'Approved' where id = '${id}'`)

    res.redirect("/admin/service_enq")
})

router.get("/service_rej/:id",async function(req,res){
    var id = req.params.id
    var d = req.body

    var data = await exe(`update service_enq set status = 'Rejected' where id = '${id}'`)

    res.redirect("/admin/service_enq")
})


router.get("/team_member",checkLogin,async function(req,res){
    var tdata = await exe(`select * from team_member`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"tdata":tdata,"adata":adata[0]}
    res.render("admin/team_member.ejs",obj)
})

router.post("/save_team",async function(req,res){
    var d =req.body

    var team_img = new Date().getTime()+req.files.team_img.name

    req.files.team_img.mv("public/uploads/"+team_img)

    var sql = `insert into team_member (team_name,team_img,team_position,team_facebook, team_instagram,team_twitter)values('${d.team_name}','${team_img}','${d.team_position}','${d.team_facebook}','${d.team_instagram}','${d.team_twitter}')`

    var data = await exe(sql)

    res.redirect("/admin/team_member")

    
})


router.get("/delete_team/:id",async function(req,res){
    var id = req.params.id

    var data = await exe(`delete from team_member where id = '${id}'`)

    res.redirect("/admin/team_member")
    
})

router.get("/edit_team/:id",checkLogin,async function(req,res){

    var id = req.params.id

    var tdata = await exe(`select * from team_member where id = '${id}'`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"tdata":tdata[0],"adata":adata[0]}

    res.render("admin/update_team_member.ejs",obj)

})


router.post("/update_team",async function(req,res){

    var d = req.body

    if(req.files !=null){
        var team_img = new Date().getTime()+req.files.team_img.name
        req.files.team_img.mv("public/uploads"+team_img)

        var sql = `update team_member set team_img = '${team_img}' where id = '${d.id}'`

        var data = await exe(sql)
    }

    var sql = `update team_member set team_name = '${d.team_member}',team_postion ='${d.team_position}',team_facebook = '${d.team_facebook}',team_instragram = '${d.team_instagram}',team_twitter = '${d.team_twitter}' where id = '${d.id}'`

    var data = await exe(sql)

    res.redirect("/admin/team_member")
})

router.get("/employee_review",checkLogin,async function(req,res){
    
    var emp_review = await exe(`select * from emp_review`);
    var adata = await exe(`select * from admin_profile`)

    var obj = {"emp_review":emp_review,"adata":adata[0]}

    res.render("admin/employee_review.ejs",obj)
    // res.send(obj)
})

router.post("/save_employee",async function(req,res){
    var d = req.body

    var emp_img = new Date().getTime()+req.files.emp_img.name

    req.files.emp_img.mv("public/uploads/"+emp_img)

    var sql = `insert into emp_review(emp_name,emp_img,emp_position,emp_desc)values('${d.emp_name}','${emp_img}','${d.emp_position}','${d.emp_desc}')`

    var data = await exe(sql)

    res.redirect("/admin/employee_review")
})


router.get("/delete_emp/:id",async function(req,res){
    var id = req.params.id

    var edata = await exe(`delete from emp_review where id='${id}'`)

    res.redirect("/admin/employee_review")
})

router.get("/edit_emp/:id",checkLogin,async function(req,res){

    var id = req.params.id

    var edata = await exe(`select * from emp_review where id = '${id}'`)
    var adata = await exe(`select * from admin_profile`)

    var obj ={"edata":edata[0],"adata":adata[0]}

    res.render("admin/update_employee_rev.ejs",obj)

    
})

router.post("/update_employee",async function(req,res){

    var d = req.body

    if(req.files != null){

        var emp_img = new Date().getTime()+req.files.emp_img.name

        req.files.emp_img.mv("public/uploads/"+emp_img)

        var sql = `update emp_review set emp_img = '${emp_img}'`
        
        var data = await exe(sql)
        
    }

    var sql = `update emp_review set emp_name = '${d.emp_name}',emp_position = '${d.emp_position}',emp_desc = '${d.emp_desc}' `

    var data = await exe(sql)

    res.redirect("/admin/employee_review")

})

router.get("/admin_profile/",async function(req,res){
    
    var adata = await exe(`select * from admin_profile`)
    var adata = await exe(`select * from admin_profile`)

    var obj = {"adata":adata[0],"adata":adata[0]}
    res.render("admin/admin_profile.ejs",obj)
})


router.post("/save_admin_profile",async function(req,res){
   
    var d = req.body

    if(req.files != null){
        var admin_img = new Date().getTime()+req.files.admin_img.name

        req.files.admin_img.mv("public/uploads/"+admin_img)

        var sql = `update admin_profile set admin_img = '${admin_img}' where id ='${d.id}'`

        var data = await exe(sql)
    }

    var sql = `update admin_profile set admin_name = '${d.admin_name}' where id = '${d.id}' `

    var data = await exe(sql)

    res.redirect("/admin/admin_profile")
})



module.exports = router;


