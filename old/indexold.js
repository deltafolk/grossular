const http = require('http');
const fs = require('fs');
const url = require('url');


const homepage = fs.readFileSync('pages/home.html');
const newpage = fs.readFileSync('pages/new.html');


const server = http.createServer((req,res)=>{

    const {pathname,query} = url.parse(req.url,true); //query เอาค่าที่อยู่หลัง ? มาใช้ เช่น ?id=1&name=sss

    if (pathname == "/" || pathname == '/home'){
        res.end(homepage);
    }
    else if (pathname == "/new"){
        if (query.type == 'point'){
            res.end(newpage);
        }
        else {
            res.writeHead(404);
            res.end('<h1>error invalid input type</h1>');
        }
    }
    else {
        res.writeHead(404);
        res.end('<h1>404</h1>');
    }
});

server.listen(3000,()=>{
    console.log('server is running on port 3000');
});