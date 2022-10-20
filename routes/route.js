const express = require('express');
const sessions = require('express-session');
const fs = require('fs')


const path = require('path');
const router = express.Router();

const fileupload = require("express-fileupload");
router.use(fileupload());


router.use(sessions({
    secret: "g1s",
    saveUninitialized: true,
    resave: false
}));

let session;

// คำสั่ง ต่อฐานข้อมูล 
const mysql = require('mysql');
const { parse } = require('path');
const con = mysql.createConnection({
    host: "localhost",
    port: 3306,
    database: 'g1s_db',
    user: "root",
    password: ""
    });

// index ที่เป็น login    
router.get ('/',(req, res)=>{

    session = req.session;

    if (session.loginkey != null){
        res.redirect('/home');
    }
    else {
        res.render('login.ejs');
    }
    
})

//ต่อไฟล์ js
router.get ('/jsdata/:idkey',(req, res)=>{
    

    session = req.session;

    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    const idkey = req.params.idkey;

    fs.readFile(__dirname + '/../vectors/'+idkey+'.js', 'utf8' , (err, data) => {
        if (err) {
          console.error(err)
          return
        }
        res.send(data);
      })
    
})

// หน้าหลัก
router.get ('/home',(req, res)=>{

    const checkRecent = require('../programs/checkRecent.js');

    session = req.session;
    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    if (session.loginkey == '999999'){
        res.redirect('/admin');
        return;
    }

    let resultmsg = req.query.resultmsg;
    let logindata = session.loginkey;
    let off = session.off;
    let sql;

    if (logindata == '00'){
        sql = "SELECT * FROM taskdata ORDER BY offname";
    }
    else {
        sql = "SELECT * FROM taskdata WHERE offkey LIKE '"+logindata+"'";
    }

        con.query(sql,(err, result)=>{
            
            for (let i = 0; i < result.length; i++){
                result[i].date = checkRecent.checkTime(result[i].date);
            }

            for (let j = 0; j < result.length; j++){
                result[j]["color"] = getColorHEX();
            }

            let m = new Date();
            let date =
                ("0" + m.getUTCDate()).slice(-2) + "-" +
                ("0" + (m.getUTCMonth()+1)).slice(-2) + "-" +
                m.getUTCFullYear() + " " +
                ("0" + m.getUTCHours()).slice(-2) + ":" +
                ("0" + m.getUTCMinutes()).slice(-2);


            let sqlupdate = "UPDATE logindata SET logintime = '"+date+"' WHERE loginkey LIKE '"+session.loginkey+"'";

                con.query(sqlupdate,(err, resultx)=>{

                    res.render("home.ejs",{result:result,off:off,resultmsg:resultmsg});

                });

        });

    
});

//เพิ่มข้อมูลใหม่
router.get ('/new', (req, res)=>{ //:type ไม่ใช่ ?type=

    session = req.session;
    const typeinput = req.query.type;

    if (session.loginkey == null){
        res.redirect('/');
    }

    let sqlact = "SELECT * FROM actdata WHERE allow = 1";
    let sqloff = null;
    const d = new Date();
    let d_year = (d.getFullYear()) + 543;
    const year = [];

    for (var i = -2; i <= 2; i++){
        year.push(d_year+i);
    }

    if (session.loginkey == '00'){
        sqloff = "SELECT * FROM logindata WHERE loginkey NOT LIKE '999999' AND loginkey NOT LIKE '00' ORDER BY off";
    }
    else {
        sqloff = "SELECT * FROM logindata WHERE loginkey LIKE '"+session.loginkey+"' ORDER BY off";
    }

    let actdata;
    let offdata;

    con.query(sqlact, (err, result)=>{

        actdata = result;

        con.query(sqloff, (err, result)=>{

            offdata = blindPassword(result);


            if (typeinput != 'shp'){

                res.render("new.ejs", {actdata:actdata,offdata:offdata,year:year});
            }
            else {

                res.render('newshp.ejs', {jsondata:''});
            }

        });

    });
});




//ตรวจสอบ shp ติดต่อกับ API ของ orge
router.post ('/check_shp',(req, res)=>{


    /*     session = req.session;
    const typeinput = req.query.type;

    if (session.loginkey == null){
        res.redirect('/');
    } */


    let hex3 = genHexString(8);
    let sampleFile;
    let uploadPath;
  
    if (!req.files || Object.keys(req.files).length === 0) {
      return res.status(400).send('No files were uploaded.');
    }


    sampleFile = req.files.fileToUpload;  
    uploadPath = __dirname + '/../cache/' + hex3 + '.zip';
    
    sampleFile.mv(uploadPath, function(err) {
        if (err) {
          res.status(500).send(err);
          res.redirect('/home?resultmsg=shp_err');
          fs.unlinkSync(uploadPath)
        }


        var fs = require('fs');
        var request = require('request');
        request.post({
            url: 'http://ogre.adc4gis.com/convert',
            formData: {
                upload: fs.createReadStream(uploadPath),
                filetype: 'zip',
                filename: 'samplefilename',
                channels: 'sample',
                title: 'sampletitle',
                targetSrs: 'EPSG:4326',
            },
        }, function(error, response, body) {

            let jsondata;
            let jsonbody;
    
    
            jsonbody = JSON.parse(body);

    
            if (jsonbody.error === true){
                res.redirect('/home?resultmsg=shp_err');
                fs.unlinkSync(uploadPath)
                return
            }
            else {
                jsondata = body;

            }

            console.log(jsonbody);

            let multi_type = false;

            if (jsonbody.features[0].geometry.type == 'MultiPoint' || jsonbody.features[0].geometry.type == 'MultiLineString' || jsonbody.features[0].geometry.type == 'MultiPolygon' ){
                multi_type = true;
            }
    
            let type = checkJSONtype(jsonbody.features[0].geometry.type);

            let sqlact = "SELECT * FROM actdata WHERE allow = 1";
            let sqloff = null;
            const d = new Date();
            let d_year = (d.getFullYear()) + 543;
            const year = [];
        
            for (var i = -2; i <= 2; i++){
                year.push(d_year+i);
            }
        
            if (session.loginkey == '00'){
                sqloff = "SELECT * FROM logindata WHERE loginkey NOT LIKE '999999' AND loginkey NOT LIKE '00' ORDER BY off";
            }
            else {
                sqloff = "SELECT * FROM logindata WHERE loginkey LIKE '"+session.loginkey+"' ORDER BY off";
            }
        
            let actdata;
            let offdata;
        
            con.query(sqlact, (err, result)=>{
        
                actdata = result;
        
                con.query(sqloff, (err, result)=>{
        
                    offdata = result;
        
                    res.render('newshp.ejs', {actdata:actdata,offdata:offdata,year:year,jsondata:jsondata,type:type,multi_type:multi_type});
                    fs.unlinkSync(uploadPath)
        
                });
        
            });
            
        });

    });

});



//เช็คข้อมูลที่เพิ่ม แล้วให้ redirect ต่อที่ /editdata
router.post ('/check_newData/:type',(req, res)=>{

    session = req.session;
    if (session.loginkey == null){
        res.redirect('/');
        return;
    }


    const checkCoordinate = require('../programs/checkCoordinate.js');
    const obj_req = req.body;
    const typeinput = req.params.type;


    let jsonitem;
    let tempitem;

    console.log(req.body)    

    if (req.body.json_upload == '1'){

        if (req.body.convert_chk == 1){
            const convert = require('../programs/multishape_convert.js');
            jsonitem = convert.multishape_convert(req.body.jsondata);
            tempitem = convert.multishape_convert(req.body.jsondata);

        }
        else {
            jsonitem = req.body.jsondata;
            tempitem = req.body.jsondata;
        }

    }
    else 
    {
        if (req.body.auto_d == '1') {

            jsonitem = checkCoordinate.checkCoordinate(obj_req,typeinput);
            tempitem = checkCoordinate.checkCoordinate(obj_req,'point');

        }
        else {

            jsonitem = req.body.jsondata;
            tempitem = checkCoordinate.checkCoordinate(obj_req,'point');

        }
    }


    sqlmaindb = "SELECT * FROM main_db WHERE allow LIKE '1' ORDER BY type ASC, name ASC";

    sqloff = "SELECT off, startup_xy FROM logindata WHERE loginkey LIKE '"+obj_req.off+"'";
    sqlact = "SELECT actname FROM actdata WHERE actkey LIKE '"+obj_req.act+"'";

    let offname;
    let actname;
    let maindb;
    let arr_userdata = [];

    sql_userdata = "SELECT jsondata FROM taskdata WHERE type LIKE '"+typeinput+"'";
    con.query(sql_userdata, (err, resultu)=>{

        for (let k = 0; k < resultu.length; k++){


            let jsonuserdata = JSON.parse(resultu[k].jsondata);
            for (let m = 0; m < jsonuserdata.features.length ; m++) {

                let featureu = jsonuserdata.features[m];
                arr_userdata.push(featureu);

            }
        }

        let obj_userdata = {
            type:'FeatureCollection',
            features: arr_userdata
        }
        JSON.stringify(obj_userdata);

        con.query(sqloff, (err, result)=>{
            offname = result;
            con.query(sqlact, (err, result)=>{
                actname = result;
                con.query(sqlmaindb, (err, result)=>{
                    maindb = result;
        
                    res.render('edit.ejs',{type:typeinput,idkey:'',obj_req:obj_req,typeinput:typeinput,jsonitem:jsonitem,tempitem:tempitem,offname:offname[0].off,actname:actname[0].actname,maindb:maindb,startup_xy:offname[0].startup_xy,overlap_data:null,obj_userdata:obj_userdata});
                });
            });
        });
    });


    //console.log({jsonitem:jsonitem,tempitem:tempitem,offname:offname,actname:actname});

    //สิ่งที่ต้องส่งไปใน res 1.obj จาก form ทั้งหมด 2.json กรณีมีค่าพิกัดแนบมา ทั้งตัว drawnitem กับ tempitem 3.ข้อมูลจากฐานข้อมูล กรณีมี 4.overlap obj กรณีมี
    
    //res.render('edit.ejs',{obj_req:obj_req,typeinput:typeinput,jsonitem:jsonitem,tempitem:tempitem});

});



//เช็คข้อมูลที่เพิ่ม แล้วให้ redirect ต่อที่ /editdata
router.get ('/edit/:idkey',(req, res)=>{

    session = req.session;
    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    const idkey = req.params.idkey;
    const checkCoordinate = require('../programs/checkCoordinate.js');

    let obj_req = null;
    let typeinput = null;
    let jsonitem = null;

    sqlmaindb = "SELECT * FROM main_db WHERE allow LIKE '1' ORDER BY type ASC, name ASC";
    sqltask = "SELECT * FROM taskdata WHERE idkey LIKE '"+idkey+"'";

    let offname;
    let actname;
    let maindb;
    let overlap_data;
    let arr_userdata = [];

    con.query(sqltask, (err, result)=>{
        if (result != ''){

            if (result[0].offkey == session.loginkey || session.loginkey == '00'){

                obj_req = {off:result[0].offkey,act:result[0].actkey,year:result[0].year,amount:result[0].amount,note:result[0].note,check_xy:'1',px:'',py:'',auto_d:'1'};


                typeinput = result[0].type;
                jsonitem = result[0].jsondata;

                offname = result[0].offname;
                actname = result[0].actname;


                if (result[0].overlap_data != ''){
                    overlap_data =  JSON.parse(result[0].overlap_data);
                }
                else {
                    overlap_data = null;
                }

                sql_userdata = "SELECT jsondata FROM taskdata WHERE idkey NOT LIKE '"+idkey+"' AND type LIKE '"+typeinput+"'";
                con.query(sql_userdata, (err, resultu)=>{

                    for (let k = 0; k < resultu.length; k++){


                        let jsonuserdata = JSON.parse(resultu[k].jsondata);
                        for (let m = 0; m < jsonuserdata.features.length ; m++) {

                            let featureu = jsonuserdata.features[m];
                            arr_userdata.push(featureu);

                        }
                    }

                    let obj_userdata = {
                        type:'FeatureCollection',
                        features: arr_userdata
                    }
                    JSON.stringify(obj_userdata);

                    con.query(sqlmaindb, (err, result)=>{
                        maindb = result;
                        res.render('edit.ejs',{type:typeinput,idkey:idkey,obj_req:obj_req,typeinput:typeinput,jsonitem:jsonitem,tempitem:jsonitem,offname:offname,actname:actname,maindb:maindb,startup_xy:"18.77, 100.76",overlap_data:overlap_data,obj_userdata:obj_userdata});
                    });

                });
            } else {
                res.redirect('/');
            }
        } else {
            res.redirect('/');
        }
    });


    //console.log({jsonitem:jsonitem,tempitem:tempitem,offname:offname,actname:actname});

    //สิ่งที่ต้องส่งไปใน res 1.obj จาก form ทั้งหมด 2.json กรณีมีค่าพิกัดแนบมา ทั้งตัว drawnitem กับ tempitem 3.ข้อมูลจากฐานข้อมูล กรณีมี 4.overlap obj กรณีมี
    
    //res.render('edit.ejs',{obj_req:obj_req,typeinput:typeinput,jsonitem:jsonitem,tempitem:tempitem});


});



//เพิ่ม/ปรับปรุง ข้้อมูลไปยัง db
router.post ('/updateData',(req, res)=>{


    session = req.session;
    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    const turf = require('@turf/turf');

    const obj_req = JSON.parse(req.body.obj_req); //req.body กรณีรับแบบ post | req.query กรณีรับแบบ get
    const offname = req.body.offname;
    const actname = req.body.actname;
    const type = req.body.type;
    const idkey = req.body.idkey;
    let hex1 = genHexString(8);
    let hex2 = genHexString(8);
    let jsondata = req.body.jsondata;

    let jsondata_obj = (JSON.parse(jsondata));
    for (let i = 0; i < jsondata_obj.features.length; i++){

        let amnt;

        if (type == 'line'){
            amnt = turf.length(jsondata_obj.features[i].geometry);
        }
        else if (type == 'polygon'){
            amnt = (turf.area(jsondata_obj.features[i].geometry))/1600;
        }
        else {
            amnt = 1;
        }

        jsondata_obj.features[i].properties.id = i;
        jsondata_obj.features[i].properties.off_name = offname;
        jsondata_obj.features[i].properties.act_name = actname;
        jsondata_obj.features[i].properties.year = obj_req.year;
        jsondata_obj.features[i].properties.amount = parseInt(amnt.toFixed());
        jsondata_obj.features[i].properties.amount_pln = obj_req.amount;
        jsondata_obj.features[i].properties.note = obj_req.note;
        jsondata_obj.features[i].properties.DESC_ = offname + '_' + actname + '_' + obj_req.year + '_' + obj_req.amount;
    }

    jsondata = JSON.stringify(jsondata_obj);
    console.log(jsondata);

    let m = new Date();
    let date =
        ("0" + m.getUTCDate()).slice(-2) + "-" +
        ("0" + (m.getUTCMonth()+1)).slice(-2) + "-" +
        m.getUTCFullYear() + " " +
        ("0" + m.getUTCHours()).slice(-2) + ":" +
        ("0" + m.getUTCMinutes()).slice(-2);

    sqltask = "SELECT keyname, name FROM main_db WHERE overlap_chk LIKE '1' AND type LIKE '"+type+"'";
    con.query(sqltask, (err, result)=>{

        let main_db = result;

        if (idkey == ''){

            sqluserdata = "SELECT * FROM taskdata WHERE type LIKE '"+type+"'";
            con.query(sqluserdata, (err, result)=>{

                let userdata = result;

                let sqltask = "INSERT INTO taskdata (idkey, offkey, type, offname, actkey, actname, year, amount, date, note, jsondata, publickey, overlap_data) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                const insert_query = mysql.format(sqltask,[hex1, obj_req.off, type, offname, obj_req.act, actname, obj_req.year, obj_req.amount, date, obj_req.note, jsondata, hex2, '']);

                con.query(insert_query,(err, result)=>{
                    if (err) { throw (err)};
                    //console.log(result);
                    res.render('checkoverlap.ejs',{jsondata:jsondata,main_db:main_db,userdata:userdata,idkey:hex1,type:type});
                });
            });

        }
        else { 

            sqluserdata = "SELECT * FROM taskdata WHERE idkey NOT LIKE '"+idkey+"' AND type LIKE '"+type+"'";
            con.query(sqluserdata, (err, result)=>{

                let userdata = result;

                fs.writeFileSync(__dirname +'/../backup/'+idkey+'_'+offname+'_'+actname+'_'+obj_req.year+'_'+obj_req.amount+date+'.json', jsondata, {encoding: "utf8",flag: "w+",},function (err){
                });

                let sqlupdate = "UPDATE taskdata SET date = ? , jsondata = ? , publickey = ? WHERE idkey LIKE ?";
                const update_query = mysql.format(sqlupdate,[date, jsondata, hex2, idkey])

                con.query(update_query,(err, result)=>{
                    if (err) { throw (err)};
                    //console.log(result);
                    res.render('checkoverlap.ejs',{jsondata:jsondata,main_db:main_db,userdata:userdata,idkey:idkey,type:type});
                });
            });
        }
    });
});


// update overlap data
router.post ('/updateOverlap',(req, res)=>{

    session = req.session;
    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    const idkey = req.body.idkey;
    let overlap_data = req.body.overlap_data;

    if (overlap_data == '[]'){
        overlap_data = "";
    }

    let overlap_update = "UPDATE taskdata SET overlap_data = ? WHERE idkey LIKE ?";
    const update_query = mysql.format(overlap_update,[overlap_data, idkey])

    con.query(update_query,(err, result)=>{
        if (err) { throw (err)};

        res.redirect('/home?resultmsg=updated');
    });
});



//แสดงตารางค่าพิกัด
router.get ('/coordinate',(req, res)=>{

    session = req.session;
    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    const idkey = req.query.idkey;

    const json2point = require('../programs/json2point.js');
    
    let multiCHK = false;


    sqltask = "SELECT * FROM taskdata WHERE idkey LIKE '"+idkey+"'";


    con.query(sqltask, (err, result)=>{

        console.log(result);

        if (result != ''){

            if (result[0].offkey == session.loginkey || session.loginkey == '00'){

                let jsondata = JSON.parse(result[0].jsondata);
                let data = result[0];

                if (jsondata.features[0].geometry.type == 'MultiPoint' || jsondata.features[0].geometry.type == 'MultiLineString' || jsondata.features[0].geometry.type == 'MultiPolygon'){
                    multiCHK = true;
                }

                let coordinates = json2point.json2point(jsondata);

                res.render('coordinates.ejs',{coordinates:coordinates,data:data,multiCHK:multiCHK});


            } else {
                res.redirect('/');
            }
        } else {
            res.redirect('/');
        }
    });
});



////เตรียมข้อมูลเบื้องต้นก่อน export map
router.get ('/export_layout',(req, res)=>{

    session = req.session;
    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    const idkey = req.query.idkey;

    const json2arrjson = require('../programs/json2arrjson.js');
    const json2point = require('../programs/json2point.js');

    sqltask = "SELECT * FROM taskdata WHERE idkey LIKE '"+idkey+"'";
    sqllogin = "SELECT * FROM logindata WHERE idkey LIKE '"+idkey+"'";


    con.query(sqltask, (err, result)=>{

        //console.log(result);
            
        sqllogin = "SELECT address, startup_xy FROM logindata WHERE loginkey LIKE '"+result[0].offkey+"'";

            con.query(sqllogin, (err, loginresult)=>{

            if (result != ''){

                if (result[0].offkey == session.loginkey || session.loginkey == '00'){
                    let data = result[0];

                    let coordinates = json2point.json2point(JSON.parse(result[0].jsondata));

                    let arr_jsondata = json2arrjson.json2arrjson(result[0].jsondata);

                    res.render('export_layout.ejs',{arr_jsondata:arr_jsondata,data:data,coordinates:coordinates,loginresult:loginresult[0]});

                }
            }
        });
    });
});

/////ประมวลผลเชิงพื้นที่

router.get ('/checkdetail',(req, res)=>{

    session = req.session;
    if (session.loginkey == null){
        res.redirect('/');
        return;
    }


    const idkey = req.query.idkey;

    sqltask = "SELECT * FROM taskdata WHERE idkey LIKE '"+idkey+"'";

    con.query(sqltask, (err, result)=>{

        let data = result;

        if (result != ''){

            if (fs.existsSync(__dirname +'/../data_detail/'+result[0].publickey+'.json')) {

                fs.readFile(__dirname +'/../data_detail/'+result[0].publickey+'.json', 'utf8', function(err, resultx){

        
                    let data = JSON.parse(resultx);
                    let resulty = formatDetail(data.data_result);

                    //console.log(data.data_result);
        
                    res.render('checkdetail.ejs',{data_result:resulty,data:data.data});
                    return

                });
        
            }

            else if (result[0].offkey == session.loginkey || session.loginkey == '00'){

                let type = result[0].type;
                let jsondata = result[0].jsondata;


                    sqldb = "SELECT keyname, name, color FROM main_db WHERE checkme LIKE '1'";

                    con.query(sqldb, (err, resultdb)=>{

                        let main_db = resultdb;


                        res.render('checkdetail.ejs',{data_result:null,jsondata:jsondata,main_db:main_db,idkey:idkey,type:type,data:data,publickey:result[0].publickey});
                    });
            }
            else {
                res.redirect('/');
            }
                
        }
        else {
            res.redirect('/');
        }

    });

});

/////แสดงผลข้อมูลเชิงพื้นที่ที่ได้จากการประมวลผล
router.post ('/showDetail',(req, res)=>{

    let data = JSON.parse(req.body.data);
    let data_result = formatDetail(JSON.parse(req.body.data_result));

    //สร้าง cache

    //console.log(req.body);

    let body = {
      data:JSON.parse(req.body.data),
      data_result:JSON.parse(req.body.data_result)
    }

    fs.writeFileSync(__dirname +'/../data_detail/'+req.body.publickey+'.json', JSON.stringify(body), {encoding: "utf8",flag: "w+",},function (err){

    });

    res.render('checkdetail.ejs',{data_result:data_result,data:data});

});




///แผนที่พร้อมส่งออก
router.post ('/export_map',(req, res)=>{

    const layoutProcess = require('../programs/layoutProcess.js');

    session = req.session;
    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    console.log(req.body);
    let title = layoutProcess.getTitle(req.body.title);
    let legend;

    if (typeof req.body.legend == 'object') {
        legend = req.body.legend;
    }
    else {
        legend = [req.body.legend];
    }

    let check_legend = req.body.check_legend;
    let qrcode = req.body.qrcode;
    let xytopo = layoutProcess.getXYTopo(JSON.parse(req.body.coordinates));
    let xyortho = layoutProcess.getXYOrtho(JSON.parse(req.body.coordinates));
    let mapsheet = layoutProcess.getMapSheet(JSON.parse(req.body.coordinates));
    let mapcenter = layoutProcess.getMapCenter(JSON.parse(req.body.coordinates));
    let jsondata = JSON.parse(req.body.jsondata);
    let raw_jsondata = req.body.raw_jsondata;
    let typeinput =  req.body.typeinput;
    let publickey =  req.body.publickey;

    let orthomap =  'http://a.tile.openstreetmap.org/{z}/{x}/{y}.png';
    let orthoname = 'ภาพถ่ายทางอากาศ';

    if (req.body.ortho_m != "04"){
        if (req.body.ortho_m == '01'){
            orthomap =  'tile_service/THEOS62/{z}/{x}/{y}.jpg';
            orthoname = 'ภาพถ่ายดาวเทียมไทยโซต<br>พ.ศ.2562';
        }
        else if (req.body.ortho_m == '02'){
            orthomap =  'tile_service/LDD55_tile/{z}/{x}/{y}.jpg';
            orthoname = 'ภายถ่ายทางอากาศ กรมพัฒนาที่ดิน<br>พ.ศ.2555';
        }
        else if (req.body.ortho_m == '03'){
            orthomap =  'tile_service/LDD45_tile/{z}/{x}/{y}.jpg';
            orthoname = 'ภายถ่ายทางอากาศ กรมพัฒนาที่ดิน<br>พ.ศ.2545';
        }
    }
    else {
        orthoname =  formatChar(req.body.orthoname);
        orthomap = formatChar(req.body.orthourl);
    }

    let filename = JSON.parse(req.body.raw_jsondata).features[0].properties.act_name + '_' + JSON.parse(req.body.raw_jsondata).features[0].properties.off_name + '_' + JSON.parse(req.body.raw_jsondata).features[0].properties.year; 
    let colorArr = ["#FF0000","#00FF00","#2E7EFF","#31FFF9","#F800FF","#FFC200","#423921","#FF7900","#A100FF","#9B9B9B"];

    console.log(legend);
    res.render('export_map.ejs',{title:title,legend:legend,check_legend:check_legend,qrcode:qrcode,xytopo:xytopo,xyortho:xyortho,mapsheet:mapsheet,mapcenter:mapcenter,jsondata:jsondata,raw_jsondata:raw_jsondata,typeinput:typeinput,colorArr:colorArr,publickey:publickey,filename:filename,maptype:req.body.maptype,orthomap:orthomap,orthoname:orthoname});
});




// login result สร้าง session
router.post ('/loginresult',(req, res)=>{

    session = req.session;
    if (session.loginkey != null){
        res.redirect('/home');
        return;
    }

    
    const obj_req = req.body; //req.body กรณีรับแบบ post | req.query กรณีรับแบบ get
    const username = req.body.username;
    const password = req.body.password;
    let sql = "SELECT * FROM logindata WHERE username = ? AND password = ? AND allow = ?";
    const search_query = mysql.format(sql,[username, password, 1])

    con.query(search_query,(err, result)=>{

        if (err) { throw (err)};
        
        if (result.length != 0){
            session = req.session;
            session.loginkey = result[0].loginkey;
            session.off = result[0].off;
            let times = parseInt(result[0].times) + 1; 

            let m = new Date();
            let date =
                ("0" + m.getUTCDate()).slice(-2) + "-" +
                ("0" + (m.getUTCMonth()+1)).slice(-2) + "-" +
                m.getUTCFullYear() + " " +
                ("0" + m.getUTCHours()).slice(-2) + ":" +
                ("0" + m.getUTCMinutes()).slice(-2);

            let sqlupdate = "UPDATE logindata SET times = '"+times+"', logintime = '"+date+"' WHERE loginkey LIKE '"+result[0].loginkey+"'";

            con.query(sqlupdate,(err, result)=>{

                res.redirect('/home');
            });

        }
        else {
            res.render('login.ejs',{loginresult:"error"});
        }

        });

});


// logout clear session & redirect ไปที่ /
router.get('/logout', (req, res) => {
    req.session.destroy();
    res.redirect('/');
    return;
});

/*     const typeinput = req.params.type;

    if (typeinput == 'point'){
        res.type('text/html');
        res.sendFile(path.join(__dirname,'../pages/new.html'));
    }
    else {
        res.status(404);
        res.redirect('/');
    } */

//////////////////////////////////////////////////////// ส่วนของ admin /////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////// ส่วนของ admin /////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////// ส่วนของ admin /////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////// ส่วนของ admin /////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////// ส่วนของ admin /////////////////////////////////////////////////////////////

router.get ('/admin',(req, res)=>{

    session = req.session;
    

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    let resultmsg = req.query.resultmsg;

    const checkRecent = require('../programs/checkRecent.js');
    const sqltask = "SELECT off, times, logintime FROM logindata WHERE times NOT LIKE '0' ORDER BY off DESC";
    con.query(sqltask, (err, result)=>{

        for (let i = 0; i < result.length; i++){
            result[i].logintime = checkRecent.checkTime(result[i].logintime);
        }

        let data = result;
        res.render('admin/admin.ejs',{data:data,resultmsg:resultmsg});

    });

});

//จัดการข้อมูลผู้ใช้
router.get ('/user_manage',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }
    
    let resultmsg = req.query.resultmsg;
    sqllogin = "SELECT * FROM logindata WHERE loginkey NOT LIKE '999999' ORDER BY off DESC";
    con.query(sqllogin, (err, result)=>{

        let data = result;
        res.render('admin/alluser.ejs',{data:data,resultmsg:resultmsg});

    });

});

//อัพเดทข้อมูลผู้ใช้
router.post ('/update_user',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    //console.log(obj_req);

    let startupchk = checkStartup(req.body.startup_xy);


    if (startupchk != false && req.body.off != '' && req.body.username != '' && req.body.password != '' && req.body.address != '' && req.body.startup_xy != '') {
        if (req.body.loginkey != ''){

            let sqlupdate = "UPDATE logindata SET password = ?, off = ?, address = ?, startup_xy = ? WHERE loginkey LIKE ?";
            const update_query = mysql.format(sqlupdate,[req.body.password, req.body.off, req.body.address, startupchk, req.body.loginkey])

            con.query(update_query,(err, result)=>{
                res.redirect('/user_manage?resultmsg=updated');
            });

        }
        else {

            let sqllogin = "SELECT * FROM logindata WHERE username = '"+req.body.username+"'"

            con.query(sqllogin,(err, result)=>{

                if (result.length == 0){

                    let hex1 = genHexString(8);

                    let sqlinsert =  "INSERT INTO logindata (loginkey, username, password, passwordmd5, off, address, startup_xy, times, logintime, tutorial, allow) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


                    const insert_query = mysql.format(sqlinsert,[hex1, req.body.username, req.body.password, '', req.body.off, req.body.address, startupchk, '0', '', '', '0'])
                    con.query(insert_query,(err, result)=>{
                        if (err){
                            res.redirect('/user_manage?resultmsg=error_add');
                        }
                        else {
                            res.redirect('/user_manage?resultmsg=added');
                        }
                    });

                }
                else {
                    res.redirect('/user_manage?resultmsg=error_add');
                }
            });


        }
    }
    else {
        res.redirect('/user_manage?resultmsg=error');
    }
    
});


//จัดการกิจกรรมตามแผนฯ
router.get ('/act_manage',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }
    
    let resultmsg = req.query.resultmsg;
    let sqllogin = "SELECT * FROM actdata ORDER BY acttype DESC";
    con.query(sqllogin, (err, result)=>{

        let data = result;
        res.render('admin/allact.ejs',{data:data,resultmsg:resultmsg});

    });

});

//checked กิจกรรม
router.get ('/act_checked',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }
    
    let actkey = req.query.actkey;
    let check = req.query.check;

    console.log(actkey+check);

    if (check == '1'){
        let act_update = "UPDATE actdata SET allow = 1 WHERE actkey = ?";
        const update_query = mysql.format(act_update,[actkey])

        con.query(update_query, (err, result)=>{
    
            res.redirect('/act_manage');
    
        });

    }
    else if (check == '0'){
        let act_update = "UPDATE actdata SET allow = 0 WHERE actkey = ?";
        const update_query = mysql.format(act_update,[actkey])

        con.query(update_query, (err, result)=>{
    
            res.redirect('/act_manage');
    
        });
    }


});

//อัพเดทกิจกรรม
router.post ('/update_act',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    if (req.body.actname != '') {
        if (req.body.actkey != null){


            let sqlupdate = "UPDATE actdata SET actname = ? WHERE actkey = ?";

            const update_query = mysql.format(sqlupdate,[req.body.actname, req.body.actkey])

            con.query(update_query,(err, result)=>{
                //console.log (result);
                if (err){
                    res.redirect('/act_manage?resultmsg=error');
                }
                else {
                    res.redirect('/act_manage?resultmsg=updated');
                }
            });

        }
        else {

            let sql = "SELECT * FROM actdata WHERE actname = '"+req.body.actname+"'"

            con.query(sql,(err, result)=>{

                if (result.length == 0){


                    let hex1 = genHexString(6);

                    let sqlinsert =  "INSERT INTO actdata (actkey, acttype, actname, allow) VALUES (?, ?, ?, ?)";

                    const insert_query = mysql.format(sqlinsert,[hex1, req.body.acttype, req.body.actname, 1])
                    con.query(insert_query,(err, result)=>{
                        if (err){
                            res.redirect('/act_manage?resultmsg=error_add');
                        }
                        else {
                            res.redirect('/act_manage?resultmsg=added');
                        }
                    });

                }
                else {
                    res.redirect('/act_manage?resultmsg=error_add');
                }
            });

        }
    }
    else {
        res.redirect('/act_manage?resultmsg=error');
    }
    
});



//จัดการฐานข้อมูลหลัก
router.get ('/database_manage',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }
    
    let resultmsg = req.query.resultmsg;

    let sql = "SELECT * FROM main_db ORDER BY type DESC, name ASC"

    con.query(sql,(err, result)=>{

        let data = result;

        res.render('admin/allmaindb.ejs',{data:data,resultmsg:resultmsg});
        }
    );
});


//อัพเดทข้อมูล raster
router.post ('/raster_update',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    console.log(req.body);
    
    if (req.body.keyname != ''){
        //update
        let sqlupdate = "UPDATE main_db SET name = ?, url_xyz = ? WHERE keyname = ?";

        const update_query = mysql.format(sqlupdate,[req.body.name, req.body.url_xyz, req.body.keyname])

        con.query(update_query,(err, result)=>{
            //console.log (result);
            if (err){
                res.redirect('/database_manage?resultmsg=error');
            }
            else {
                res.redirect('/database_manage?resultmsg=updated');
            }
        });

    }
    else {
        //add

        let hex1 = genHexString(8);

        let sqladd = "INSERT INTO main_db (keyname, orderx, type, name, url_xyz, color, allow, overlap_chk, checkme) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        const add_query = mysql.format(sqladd,[hex1, '0', 'raster', req.body.name, req.body.url_xyz, '', '1', '0', '0'])

        con.query(add_query,(err, result)=>{
            //console.log (result);
            if (err){
                res.redirect('/database_manage?resultmsg=error');
            }
            else {
                res.redirect('/database_manage?resultmsg=added');
            }
        });

    }

});


//checked ฐานข้อมูลหลัก (ras+vec)
router.get ('/db_checked',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }
    
    let type = req.query.type;
    let keyname = req.query.keyname;
    let check = req.query.check;

    if (check == '1'){
        if (type == 'allow'){
            let update = "UPDATE main_db SET allow = 1 WHERE keyname = ?";
            const update_query = mysql.format(update,[keyname])
            con.query(update_query, (err, result)=>{
    
                res.redirect('/database_manage');
        
            });
        }
        else if (type == 'overlap_chk'){
            let update = "UPDATE main_db SET overlap_chk = 1 WHERE keyname = ?";
            const update_query = mysql.format(update,[keyname])
            con.query(update_query, (err, result)=>{
    
                res.redirect('/database_manage');
        
            });
        }
        else {
            let update = "UPDATE main_db SET checkme = 1 WHERE keyname = ?";
            const update_query = mysql.format(update,[keyname])
            con.query(update_query, (err, result)=>{
    
                res.redirect('/database_manage');
        
            });
        }

    }
    else if (check == '0'){
        if (type == 'allow'){
            let update = "UPDATE main_db SET allow = 0 WHERE keyname = ?";
            const update_query = mysql.format(update,[keyname])
            con.query(update_query, (err, result)=>{
    
                res.redirect('/database_manage');
        
            });
        }
        else if (type == 'overlap_chk'){
            let update = "UPDATE main_db SET overlap_chk = 0 WHERE keyname = ?";
            const update_query = mysql.format(update,[keyname])
            con.query(update_query, (err, result)=>{
    
                res.redirect('/database_manage');
        
            });
        }
        else {
            let update = "UPDATE main_db SET checkme = 0 WHERE keyname = ?";
            const update_query = mysql.format(update,[keyname])
            con.query(update_query, (err, result)=>{
    
                res.redirect('/database_manage');
        
            });
        }

    }


});



//อนุญาตเข้าสู่ระบบของ user
router.get ('/user_checked',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }
    
    let loginkey = req.query.loginkey;
    let check = req.query.check;

    if (req.query.loginkey == '999999'){
        res.redirect('/user_manage');
        return;
    }

    if (check == '1'){
        let update = "UPDATE logindata SET allow = 1 WHERE loginkey = ?";
        const update_query = mysql.format(update,[loginkey])
        con.query(update_query, (err, result)=>{
    
            res.redirect('/user_manage');
        
        });

    }
    else if (check == '0'){
        let update = "UPDATE logindata SET allow = 0 WHERE loginkey = ?";
        const update_query = mysql.format(update,[loginkey])
        con.query(update_query, (err, result)=>{
    
            res.redirect('/user_manage');
        
        });
    }
    else {
        res.redirect('/user_manage');
    }
});



//อัพเดทข้อมูล vector
router.post ('/vector_update',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    //let sampleFile = req.files.fileToUpload;
    //console.log(req.body);
    //console.log(req.files);
    let keyname = req.body.keyname;
    let inputtype = req.body.type;
    let name = req.body.name;
    let color = req.body.color;
    let fs = require('fs');
    
    if (req.body.keyname != null){
        // update
        if (req.files){
            // update all (shp, name, color)

            //sampleFile = req.files.fileToUpload.data;

                let jsondata = req.files.fileToUpload.data.toString('utf8');
                let type = checkJSONtype(JSON.parse(jsondata).features[0].geometry.type);
                let jsonobj = JSON.parse(jsondata);

                if ("type" in jsonobj && "features" in jsonobj){
                }
                else {
                    res.redirect('/database_manage?resultmsg=_error');
                    return;
                }
    
                if (jsonobj.crs.properties.name == 'EPSG:4326' || jsonobj.crs.properties.name == 'urn:ogc:def:crs:OGC:1.3:CRS84' ){
                }
                else {
                    res.redirect('/database_manage?resultmsg=crs_error');
                    return;
                }

                //console.log(jsonobj);

                if (type == req.body.type){
                    if ("DESC_" in jsonobj.features[0].properties){

                                    // ใช้ fs แล้วเขียนทับไฟล์เดิม
                        fs.writeFile(__dirname + '/../vectors/' + keyname + '.js', 'var ' + keyname + ' = ' + jsondata + ';', {encoding:'utf8',flag:'w'}, (err) => {
                            if (err){
                                res.redirect('/database_manage?resultmsg=_error');
                            }
                            else {
                                let update = "UPDATE main_db SET name = ?, color = ? WHERE keyname = ?";
                                const update_query = mysql.format(update,[name,color,keyname])
                                console.log(update_query);
                                con.query(update_query, (err, result)=>{
                                    if (err){
                                        res.redirect('/database_manage?resultmsg=_error');

                                    }
                                    else { 
                                        res.redirect('/database_manage?resultmsg=_updated');

                                    }
                                });
                            }
                        });
                    }
                    else {
                        res.redirect('/database_manage?resultmsg=desc_err');

                    }
                }
                else {
                    res.redirect('/database_manage?resultmsg=type_err');

                }


        }

        else {
            // update only name, color
            let update = "UPDATE main_db SET name = ?, color = ? WHERE keyname = ?";
            const update_query = mysql.format(update,[name,color,keyname])
            
            con.query(update_query, (err, result)=>{

                if (err){
                    res.redirect('/database_manage?resultmsg=_error');
                }
                else { 
                    res.redirect('/database_manage?resultmsg=_updated');
                }
            });
        }
    }
    else {
        //add
        if (req.files){

            let jsondata = req.files.fileToUpload.data.toString('utf8');
            let type = checkJSONtype(JSON.parse(jsondata).features[0].geometry.type);
            let jsonobj = JSON.parse(jsondata);
            let keyname = genHexString(8);

            if ("type" in jsonobj && "features" in jsonobj){
            }
            else {
                res.redirect('/database_manage?resultmsg=_error');
                return;
            }

            if (jsonobj.crs.properties.name == 'EPSG:4326' || jsonobj.crs.properties.name == 'urn:ogc:def:crs:OGC:1.3:CRS84' ){
            }
            else {
                res.redirect('/database_manage?resultmsg=crs_error');
                return;
            }

            //console.log(jsonobj);

            if (type == req.body.type){
                if ("DESC_" in jsonobj.features[0].properties){

                                // ใช้ fs แล้วเขียนทับไฟล์เดิม
                    fs.writeFile(__dirname + '/../vectors/' + keyname + '.js', 'var ' + keyname + ' = ' + jsondata + ';', {encoding:'utf8',flag:'w'}, (err) => {
                        if (err){
                            res.redirect('/database_manage?resultmsg=_error');
                        }
                        else {
                            let sqladd = "INSERT INTO main_db (keyname, orderx, type, name, url_xyz, color, allow, overlap_chk, checkme) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                            const add_query = mysql.format(sqladd,[keyname, '1', inputtype, req.body.name, '', req.body.color, '1', '0', '0'])

                            con.query(add_query,(err, result)=>{
                                //console.log (result);
                                if (err){
                                    res.redirect('/database_manage?resultmsg=_error');
                                }
                                else {
                                    res.redirect('/database_manage?resultmsg=_added');
                                }
                            });

                        }
                    });
                }
                else {
                    res.redirect('/database_manage?resultmsg=desc_err');

                }
            }
            else {
                res.redirect('/database_manage?resultmsg=type_err');

            }
            //
        }
        else {
            res.redirect('/database_manage?resultmsg=_error');
        }

    }
    

});

//แสดงข้อมูลผู้ใช้ทั้งหมด
router.get ('/userdata',(req, res)=>{
    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    const d = new Date();
    let d_year = (d.getFullYear()) + 543;
    const year = [];

    for (var i = -2; i <= 2; i++){
        year.push(d_year+i);
    }

    let resultmsg = req.query.resultmsg;
    let data = [];

    let sql = "SELECT * FROM actdata ORDER BY acttype DESC, actname ASC"

    con.query(sql,(err, result)=>{

        let act = result;
        res.render('admin/userdata.ejs',{act:act,year:year,data:data,resultmsg:resultmsg,actname:'',actkey_req:'',year_req:''});
        }
    );

});

//ค้นหาข้อมูลผู้ใช้ตามกิจกรรม/ปี
router.post ('/userdata_search',(req, res)=>{
    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    const d = new Date();
    let d_year = (d.getFullYear()) + 543;
    const year = [];

    for (var i = -2; i <= 2; i++){
        year.push(d_year+i);
    }

    let data = [];

    let sql = "SELECT * FROM actdata ORDER BY acttype DESC, actname ASC"

    con.query(sql,(err, resultx)=>{

        let actdata = "SELECT * FROM actdata WHERE actkey = '"+req.body.actkey+"'";

        con.query(actdata,(err, result)=>{


            let actname = result[0].actname + " ประจำปีงบประมาณ พ.ศ." + req.body.year;
            let act = resultx;

            let userdata = "SELECT * FROM taskdata WHERE actkey = ? AND year = ? ORDER BY offname DESC"

            const _query = mysql.format(userdata,[req.body.actkey, req.body.year])

            con.query(_query,(err, result)=>{

                const checkRecent = require('../programs/checkRecent.js');

                for (let i = 0; i < result.length; i++){
                    result[i]["color"] = getColorHEX();
                }

                for (let j = 0; j < result.length; j++){
                    result[j].date = checkRecent.checkTime(result[j].date);
                }

                data = result;
                res.render('admin/userdata.ejs',{act:act,year:year,data:data,resultmsg:'',actname:actname,actkey_req:req.body.actkey,year_req:req.body.year});
            });
        });
    });

});


//รวมข้อมูลแบบ แยกกิจกรรมแล้วดาวน์โหลด เป็น shp
router.get ('/dwluserdata',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    let arr_userdata = [];
    let data;
    let userdata = "SELECT * FROM taskdata WHERE actkey = ? AND year = ?";

    const _query = mysql.format(userdata,[req.query.actkey, req.query.year])

    con.query(_query,(err, result)=>{

        if (result.length != 0) {

            for (let k = 0; k < result.length; k++){

                let jsonuserdata = JSON.parse(result[k].jsondata);
                for (let m = 0; m < jsonuserdata.features.length ; m++) {

                    let featureu = jsonuserdata.features[m];
                    arr_userdata.push(featureu);
                }
            }

            let jsondata = {
                type:'FeatureCollection',
                features: arr_userdata
            }

            let hex = genHexString(8);

            const request = require('request');

            const options = {
                url: 'http://ogre.adc4gis.com/convertJson',
                form: {
                    json: JSON.stringify(jsondata),
                    method: 'POST',
                    header: 'Content-type: application/x-www-form-urlencoded',
                    format: null,
                    forceUTF8: 1,
                },
                encoding: null,
            };

            request.post(options, (err, res2, body) => {

                fs.mkdir(__dirname + '/../cache/'+req.query.actkey+'_'+hex, { recursive: true }, (err) => {
                    if (err) {
                        return console.error(err);
                    }
                    fs.writeFileSync(__dirname +'/../cache/'+req.query.actkey+'_'+hex+'/'+result[0].actname+'_'+result[0].year+'.zip', body, {encoding: "utf8",flag: "w+",},function (err){

                    });
                    res.download(__dirname +'/../cache/'+req.query.actkey+'_'+hex+'/'+result[0].actname+'_'+result[0].year+'.zip');
                });
            });
    
        }
        else {
            res.redirect('/');
        }

    });

});




// view ดู shape file
router.get ('/view/:publickey/',(req, res)=>{

    const publickey = req.params.publickey;
    let data = [];
    let sql = "SELECT * FROM taskdata WHERE publickey LIKE ?"

    const query = mysql.format(sql,[publickey])

    con.query(query,(err, result)=>{

        for (let i = 0; i < result.length; i++){
            result[i]["color"] = "#FF0000";
        }

        res.render('view.ejs',{data:result,resultmsg:''});

    });
});


//ดาวน์โหลด shp kml
router.get ('/dwl/:type/:publickey',(req, res)=>{

    session = req.session;

    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    const publickey = req.params.publickey;
    const type = req.params.type;

    let posttype = null;
    let outputtype = null;

    if (type == 'kml'){
        posttype = 'kml';
        outputtype = '.kml'

    }
    else if (type == 'zip'){
        posttype = null;
        outputtype = '.zip'
    }
    else {
        res.redirect('/home');
        return;
    }

    let sql = "SELECT * FROM taskdata WHERE publickey LIKE ?"

    const query = mysql.format(sql,[publickey])

    con.query(query,(err, result)=>{

        let hex = genHexString(16);

        if (result.length != 0){

            let jsondata = JSON.stringify(result[0].jsondata);

            const request = require('request');

            const options = {
                url: 'http://ogre.adc4gis.com/convertJson',
                form: {
                    json: jsondata,
                    method: 'POST',
                    header: 'Content-type: application/x-www-form-urlencoded',
                    format: posttype,
                    forceUTF8: 1,
                },
                encoding: null,
            };

            request.post(options, (err, res2, body) => {

                fs.mkdir(__dirname + '/../cache/'+result[0].publickey+'_'+hex, { recursive: true }, (err) => {
                    if (err) {
                        return console.error(err);
                    }
                    fs.writeFileSync(__dirname +'/../cache/'+result[0].publickey+'_'+hex+'/'+result[0].offname+'_'+result[0].actname+'_'+result[0].year+'_'+result[0].amount+outputtype, body, {encoding: "utf8",flag: "w+",},function (err){

                    });
                    res.download(__dirname +'/../cache/'+result[0].publickey+'_'+hex+'/'+result[0].offname+'_'+result[0].actname+'_'+result[0].year+'_'+result[0].amount+outputtype);
                });
            });
        }
        else {
            res.redirect('/home?resultmsg=error');
        }

    });

});



// เคลียร์ดาวน์โหลด cache
router.get ('/clear_cache',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    const fsExtra = require('fs-extra');
    fsExtra.emptyDirSync(__dirname + '/../cache');

    res.redirect('/admin?resultmsg=cleared');

});




// drop ข้อมูลทิ้ง + backup ก่อนเป็น /backup/*.json
router.get ('/drop/:idkey',(req, res)=>{

    session = req.session;

    if (session.loginkey == null){
        res.redirect('/');
        return;
    }

    let select = "SELECT * FROM taskdata WHERE idkey = ?"
    const select_query = mysql.format(select,[req.params.idkey])

    let drop = "DELETE FROM taskdata WHERE idkey = ?"
    const drop_query = mysql.format(drop,[req.params.idkey])

    con.query(select_query,(err, result)=>{

        if (result.length != 0) {

            let m = new Date();
            let date =
                ("0" + m.getUTCDate()).slice(-2) + "-" +
                ("0" + (m.getUTCMonth()+1)).slice(-2) + "-" +
                m.getUTCFullYear() + "_" +
                ("0" + m.getUTCHours()).slice(-2) + "-" +
                ("0" + m.getUTCMinutes()).slice(-2);

            fs.writeFileSync(__dirname +'/../backup/'+result[0].idkey+'_'+result[0].offname+'_'+result[0].actname+'_'+result[0].year+'_'+result[0].amount+date+'.json', result[0].jsondata, {encoding: "utf8",flag: "w+",},function (err){
            });

            con.query(drop_query,(err, result)=>{
                res.redirect('/home?resultmsg=deleted');
            });
        }
        else {
            res.redirect('/');
        }

    });

});


//clear เวลา login ของ user
router.get ('/clear_times',(req, res)=>{

    session = req.session;

    if (session.loginkey != '999999'){
        res.redirect('/');
        return;
    }

    let update = "UPDATE logindata SET times = 0";
    
    con.query(update, (err, result)=>{
        res.redirect('/');
        return;
    });

});



function getColorHEX(){
    const hex = 'ABCDEF1234567890';
    let output = '';
    for (let i = 0; i < 6; ++i) {
        output += hex.charAt(Math.floor(Math.random() * hex.length));
    }
    return "#"+output;
}

function genHexString(len) {
        const hex = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        let output = '';
        for (let i = 0; i < len; ++i) {
            output += hex.charAt(Math.floor(Math.random() * hex.length));
        }
        return output;
}
function checkJSONtype(type){
    if (type == 'Point' || type == 'MultiPoint'){
        return 'point';
    }
    else if (type == 'LineString' || type == 'MultiLineString'){
        return 'line';
    }
    else {
        return 'polygon';
    }
}


function checkStartup(input){
    let result = false;
    let arrdata = input.split(",");
    //console.log(arrdata);


    if (arrdata.length == 2){
        let x = parseFloat(arrdata[0]);
        let y = parseFloat(arrdata[1]);
        console.log(typeof x);

        if (isNaN(x) || isNaN(y)){
            return result;
        }
        else {
            return x+', '+y;
        }
    }
    else {
        return result;
    }
}

function formatChar(input){
    if (input.search(/</) != -1 || input.search(/>/) != -1){
        return '';
    }
    else {
        return input;
    };
}

function blindPassword(result){
    for (let i = 0; i < result.length; i++){
        result[i].username = '';
        result[i].password = '';
    }
    return result;
}


function formatDetail(data_result){
    let arr = []
    let arr2 = []
    arr2.push(data_result[0])
    for (let i = 1; i < data_result.length; i++) {
        if (data_result[i].dbkeyname == data_result[i-1].dbkeyname) {
            arr2.push(data_result[i])
        } else {
            arr.push(arr2)
            arr2 = [data_result[i]];
        }
    }
    if (arr2 != []){
        arr.push(arr2)
    }
    
    return arr;
}


module.exports = router;