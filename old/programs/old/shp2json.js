function shp2json (filepath){

    var fs = require('fs');
    var request = require('request');
    request.post({
        url: 'http://ogre.adc4gis.com/convert',
        formData: {
            upload: fs.createReadStream(filepath),
            filetype: 'zip',
            filename: 'samplefilename',
            channels: 'sample',
            title: 'sampletitle',
            targetSrs: 'EPSG:4326',
        },
    }, function(error, response, body) {


        jsonbody = JSON.parse(body);

        console.log(jsonbody.error);

        if (jsonbody.error == true){
            return '';
        }
        else 
        {
            
        return body;
        }
    });

}

module.exports.shp2json = shp2json;

