const request = require('request');
const fs = require('fs');


var xxx = JSON.stringify({"type":"FeatureCollection","features":[{"type":"Feature","properties":{"id":0,"off_name":"หน่วยจัดการต้นน้ำน้ำงาว","act_name":"แปลงปลูกป่าหวาย","year":2565,"amount_pln":100,"note":"","DESC_":"หน่วยจัดการต้นน้ำน้ำงาว_แปลงปลูกป่าหวาย_2565_100"},"geometry":{"type":"Polygon","coordinates":[[[100.70195,18.98418],[100.70343,18.984951],[100.704225,18.984626],[100.704633,18.984078],[100.705856,18.98351],[100.706435,18.983003],[100.70519,18.981481],[100.703259,18.981238],[100.70195,18.98418]]]}}]});


const options = {
    url: 'http://ogre.adc4gis.com/convertJson',
    form: {
        json: xxx,
        method: 'POST',
        header: 'Content-type: application/x-www-form-urlencoded',
        format: null,
        forceUTF8: 1,
    },
    encoding: null,
};



request.post(options, (err, res, body) => {
    fs.writeFile(__dirname + '/npx1.zip', body, function (err){
        console.log("dowloaded to dir");

        const download = require('download');
    
        const file = '/npx1.zip';
        const filePath = `${__dirname}`;
                
        download(file,filePath).then(() => {
            console.log('Download Completed');
        })
    });
});

//const data = fs.readFileSync(__dirname + '/ogre.zip',
            //{encoding:'utf8', flag:'r'});

//console.log(data);



