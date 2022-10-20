const express = require('express');
const path = require('path');
const router = require('./routes/route.js');
const app = express();
const bodyParser = require('body-parser');
const cors = require('cors');


app.use(bodyParser.json({ limit: '50mb' }));
app.use(bodyParser.urlencoded({ limit: '50mb', extended: true }));

app.use(cors({
    origin : '*',
}))

app.use(express.static(path.join(__dirname,'public'))) //ใช้กับ folder ที่เข้าถึงได้เลย เช่นที่เก็บ css เป็นต้น ใช้ต่อกับส่วนของ head.ejs

app.use(express.urlencoded({extended:false})) //ให้ express ใช้งานข้อมูลที่ส่งแบบ post ได้ *** จำเป็น
app.use(router); //ใช้กรณีต่อกับฐานข้อมูล

app.set('views',path.join(__dirname,'views'));
app.set('view engine','ejs');


app.listen(7000,()=>{
    console.log('running on port 7000');
})
