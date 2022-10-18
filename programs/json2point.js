const coor = require('utm');

function json2point (json) {

    let type = null;
    let obj_json = (json);
    type = obj_json.features[0].geometry.type;


    if (type == 'Point'){
        return fromPoint (obj_json);
    } else if (type == 'MultiPoint'){
        return fromMPoint (obj_json);
    } else if (type == 'LineString'){
        return fromLine (obj_json);
    } else if (type == 'MultiLineString'){
        return fromMLine (obj_json);
    } else if (type == 'Polygon'){
        return fromPolygon (obj_json);
    } else { //multipolygon
        return fromMPolygon (obj_json);
    }
} 

// point2point
function fromPoint(obj_json){

    let arr_data = [];
    let x = 0;
    let y = 0;
    let count = 0;

    for (var i = 0; i < obj_json.features.length; i++){
        for (var j = 0; j < 1; j++) {

            let utm = coor.fromLatLon(obj_json.features[i].geometry.coordinates[1], obj_json.features[i].geometry.coordinates[0]);

            //console.log(utm);

            let data = {feature:i,
            part:0,
            point:j,
            x: utm.easting.toFixed(),
            y: utm.northing.toFixed(),
            zone: utm.zoneNum + utm.zoneLetter,
            }

            arr_data.push(data);

            x = x + parseInt(utm.easting);
            y = y + parseInt(utm.northing);
            count = count + 1;
        }
    }

    let center_x = x/count;
    let center_y = y/count;

    let alldata = {
        coordinates: arr_data,
        center_coordinate: [center_x.toFixed(),center_y.toFixed()],
    }

    return alldata;
}


// multipoint2point
function fromMPoint(obj_json){

    let arr_data = [];
    let x = 0;
    let y = 0;
    let count = 0;


    for (var i = 0; i < obj_json.features.length; i++){
        for (var j = 0; j < obj_json.features[i].geometry.coordinates.length; j++){
            for (var k = 0; k < 1; k++){

                let utm = coor.fromLatLon(obj_json.features[i].geometry.coordinates[j][1], obj_json.features[i].geometry.coordinates[j][0]);

                //console.log(utm);

                let data = {
                    feature:i,
                    part:j,
                    point:k,
                    x: utm.easting.toFixed(),
                    y: utm.northing.toFixed(),
                    zone: utm.zoneNum + utm.zoneLetter,
                }

                arr_data.push(data);

                x = x + parseInt(utm.easting);
                y = y + parseInt(utm.northing);
                count = count + 1;
            }
        }
    }
    let center_x = x/count;
    let center_y = y/count;

    let alldata = {
        coordinates: arr_data,
        center_coordinate: [center_x.toFixed(),center_y.toFixed()],
    }

    return alldata;
}    


//line2point
function fromLine (obj_json){

    let arr_data = [];
    let x = 0;
    let y = 0;
    let count = 0;

    for (var i = 0; i < obj_json.features.length; i++){
        for (var j = 0; j < obj_json.features[i].geometry.coordinates.length; j++){

            let utm = coor.fromLatLon(obj_json.features[i].geometry.coordinates[j][1], obj_json.features[i].geometry.coordinates[j][0]);

            let data = {
                feature:i,
                part:0,
                point:j,
                x: utm.easting.toFixed(),
                y: utm.northing.toFixed(),
                zone: utm.zoneNum + utm.zoneLetter,
            }
    
            arr_data.push(data);

            x = x + parseInt(utm.easting);
            y = y + parseInt(utm.northing);
            count = count + 1;
        }
    }
    let center_x = x/count;
    let center_y = y/count;

    let alldata = {
        coordinates: arr_data,
        center_coordinate: [center_x.toFixed(),center_y.toFixed()],
    }

    return alldata;
}



//multiline2point
function fromMLine (obj_json){

    let arr_data = [];
    let x = 0;
    let y = 0;
    let count = 0;

    for (var i = 0; i < obj_json.features.length; i++){
        for (var j = 0; j < obj_json.features[i].geometry.coordinates.length; j++){
            for (var k = 0; k < obj_json.features[i].geometry.coordinates[j].length; k++){

                let utm = coor.fromLatLon(obj_json.features[i].geometry.coordinates[j][k][1], obj_json.features[i].geometry.coordinates[j][k][0]);

                let data = {
                    feature:i,
                    part:j,
                    point:k,
                    x: utm.easting.toFixed(),
                    y: utm.northing.toFixed(),
                    zone: utm.zoneNum + utm.zoneLetter,
                }
        
                arr_data.push(data);

                x = x + parseInt(utm.easting);
                y = y + parseInt(utm.northing);
                count = count + 1;
            }
        }
    }
    let center_x = x/count;
    let center_y = y/count;

    let alldata = {
        coordinates: arr_data,
        center_coordinate: [center_x.toFixed(),center_y.toFixed()],
    }

    return alldata;
}



//polygon2point
function fromPolygon (obj_json){

    let arr_data = [];
    let x = 0;
    let y = 0;
    let count = 0;

    for (var i = 0; i < obj_json.features.length; i++){
        for (var j = 0; j < obj_json.features[i].geometry.coordinates[0].length; j++){
            for (var k = 0; k < 1; k++){

                let utm = coor.fromLatLon(obj_json.features[i].geometry.coordinates[0][j][1], obj_json.features[i].geometry.coordinates[0][j][0]);

                let data = {
                    feature:i,
                    part:0,
                    point:j,
                    x: utm.easting.toFixed(),
                    y: utm.northing.toFixed(),
                    zone: utm.zoneNum + utm.zoneLetter,
                }
        
                arr_data.push(data);

                x = x + parseInt(utm.easting);
                y = y + parseInt(utm.northing);
                count = count + 1;
            }
        }
    }
    let center_x = x/count;
    let center_y = y/count;

    let alldata = {
        coordinates: arr_data,
        center_coordinate: [center_x.toFixed(),center_y.toFixed()],
    }

    return alldata;
}




//multipolygon2point
function fromMPolygon (obj_json){

    let arr_data = [];
    let x = 0;
    let y = 0;
    let count = 0;

    for (var i = 0; i < obj_json.features.length; i++){
        for (var j = 0; j < obj_json.features[i].geometry.coordinates.length; j++){
            for (var k = 0; k < obj_json.features[i].geometry.coordinates[j][0].length; k++){

                let utm = coor.fromLatLon(obj_json.features[i].geometry.coordinates[j][0][k][1], obj_json.features[i].geometry.coordinates[j][0][k][0]);

                let data = {
                    feature:i,
                    part:j,
                    point:k,
                    x: utm.easting.toFixed(),
                    y: utm.northing.toFixed(),
                    zone: utm.zoneNum + utm.zoneLetter,
                }
        
                arr_data.push(data);

                x = x + parseInt(utm.easting);
                y = y + parseInt(utm.northing);
                count = count + 1;
            }
        }
    }
    let center_x = x/count;
    let center_y = y/count;

    let alldata = {
        coordinates: arr_data,
        center_coordinate: [center_x.toFixed(),center_y.toFixed()],
    }

    return alldata;
}


module.exports.json2point = json2point;

///////////////////////////////////

/* console.log(json2point({
    "type": "FeatureCollection",
    "name": "mpolygon",
    "crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
    "features": [
    { "type": "Feature", "properties": { "id": null }, "geometry": { "type": "MultiPolygon", "coordinates": [ [ [ [ 100.733843, 18.728043 ], [ 100.736147, 18.723955 ], [ 100.732319, 18.723955 ], [ 100.733843, 18.728043 ] ] ] ] } },
    { "type": "Feature", "properties": { "id": null }, "geometry": { "type": "MultiPolygon", "coordinates": [ [ [ [ 100.737225, 18.721576 ], [ 100.739269, 18.720573 ], [ 100.739232, 18.716894 ], [ 100.736742, 18.719012 ], [ 100.737225, 18.721576 ] ] ], [ [ [ 100.735255, 18.721614 ], [ 100.734772, 18.71812 ], [ 100.733397, 18.716373 ], [ 100.731093, 18.718157 ], [ 100.730015, 18.720313 ], [ 100.735255, 18.721614 ] ], [ [ 100.732895282651938, 18.720442921393278 ], [ 100.732505048338624, 18.718826236380952 ], [ 100.733824411969366, 18.718027185167962 ], [ 100.733824411969366, 18.719606705007592 ], [ 100.732895282651938, 18.720442921393278 ] ] ] ] } }
    ]
    })); */