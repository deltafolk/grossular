let mpoint = {
    "type": "FeatureCollection",
    "name": "mpoint",
    "crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
    "features": [
    { "type": "Feature", "properties": { "id": 0 }, "geometry": { "type": "MultiPoint", "coordinates": [ [ 100.747579014943639, 18.715098124064358 ] ] } },
    { "type": "Feature", "properties": { "id": 1 }, "geometry": { "type": "MultiPoint", "coordinates": [ [ 100.76042709807426, 18.711851565423824 ], [ 100.767956351091655, 18.702388192365255 ] ] } }
    ]
    }

let mline = {
    "type": "FeatureCollection",
    "name": "mline",
    "crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
    "features": [
    { "type": "Feature", "properties": { "id": null }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 100.749064, 18.719813 ], [ 100.748063, 18.715944 ], [ 100.746543, 18.713354 ] ] ] } },
    { "type": "Feature", "properties": { "id": null }, "geometry": { "type": "MultiLineString", "coordinates": [ [ [ 100.744781, 18.726237 ], [ 100.744436, 18.720918 ], [ 100.743504, 18.718604 ], [ 100.740706, 18.71888 ] ], [ [ 100.741569, 18.726858 ], [ 100.742433, 18.723853 ], [ 100.742606, 18.721954 ] ] ] } }
    ]
}

let mpoly = {
    "type": "FeatureCollection",
    "name": "mpoly",
    "crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
    "features": [
    { "type": "Feature", "properties": { "id": null }, "geometry": { "type": "MultiPolygon", "coordinates": [ [ [ [ 100.735058, 18.731267 ], [ 100.739058, 18.726106 ], [ 100.735058, 18.717074 ], [ 100.732477, 18.724171 ], [ 100.735058, 18.731267 ] ] ] ] } },
    { "type": "Feature", "properties": { "id": null }, "geometry": { "type": "MultiPolygon", "coordinates": [ [ [ [ 100.734219, 18.74417 ], [ 100.737961, 18.742428 ], [ 100.736219, 18.739331 ], [ 100.734929, 18.739783 ], [ 100.734219, 18.74417 ] ] ], [ [ [ 100.738735, 18.74146 ], [ 100.742348, 18.738105 ], [ 100.742154, 18.733461 ], [ 100.737509, 18.736041 ], [ 100.738735, 18.74146 ] ] ] ] } }
    ]
    }



function multishape_convert(inputjson){
    let type = JSON.parse(inputjson).features[0].geometry.type;

    if (type == 'MultiPoint') {
        return point_convert(inputjson);
    }
    else if (type == 'MultiLineString') {
        return line_convert(inputjson);
    }
    else if (type == 'MultiPolygon'){
        return polygon_convert(inputjson);
    }
    else {
        return jsoninput;
    }

}

function point_convert(inputjsonx) {

    let inputjson = JSON.parse(inputjsonx);

    let arrayFeatures = [];

    for (let i = 0; i < inputjson.features.length; i++){
        for (let j = 0; j < inputjson.features[i].geometry.coordinates.length; j++) {
            let features = inputjson.features[i].geometry.coordinates[j];

            let data_feature = {
                type: 'Feature',
                properties: {id: null},
                geometry: {
                    type: 'Point',
                    coordinates: features
                }
            }
            arrayFeatures.push(data_feature);
        }
    }
    //console.log(JSON.stringify(arrayFeatures));
    return JSON.stringify({
        type: "FeatureCollection",
        name: "converted",
        crs: { type: "name", properties: { name: "urn:ogc:def:crs:OGC:1.3:CRS84" } },
        features : arrayFeatures
    })
}


function line_convert(inputjsonx) {

    let inputjson = JSON.parse(inputjsonx);

    let arrayFeatures = [];

    for (let i = 0; i < inputjson.features.length; i++){
        for (let j = 0; j < inputjson.features[i].geometry.coordinates.length; j++) {
            let features = inputjson.features[i].geometry.coordinates[j];

            let data_feature = {
                type: 'Feature',
                properties: {id: null},
                geometry: {
                    type: 'LineString',
                    coordinates: features
                }
            }
            arrayFeatures.push(data_feature);
        }
    }
    //console.log(JSON.stringify(arrayFeatures));
    return JSON.stringify({
        type: "FeatureCollection",
        name: "converted",
        crs: { type: "name", properties: { name: "urn:ogc:def:crs:OGC:1.3:CRS84" } },
        features : arrayFeatures
    })
}



function polygon_convert(inputjsonx) {

    let inputjson = JSON.parse(inputjsonx);

    let arrayFeatures = [];

    for (let i = 0; i < inputjson.features.length; i++){
        for (let j = 0; j < inputjson.features[i].geometry.coordinates.length; j++) {
            let features = inputjson.features[i].geometry.coordinates[j];

            let data_feature = {
                type: 'Feature',
                properties: {id: null},
                geometry: {
                    type: 'Polygon',
                    coordinates: features
                }
            }
            arrayFeatures.push(data_feature);
        }
    }
    //console.log(JSON.stringify(arrayFeatures));
    return JSON.stringify({
        type: "FeatureCollection",
        name: "converted",
        crs: { type: "name", properties: { name: "urn:ogc:def:crs:OGC:1.3:CRS84" } },
        features : arrayFeatures
    })
}



module.exports.multishape_convert = multishape_convert;