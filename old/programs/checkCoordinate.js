const coor = require('utm');
const utilx = require('util');



function checkCoordinate (obj_req,typeinput){
    let drawnitem;

    //let latlng = coor.toLatLon(602451, 2101058, 47, 'Q', northern, strict = true);
    //let utm = coor.fromLatLon(18, 100);
    console.log(obj_req);

    if ((obj_req.px != '') || (obj_req.py != '') || obj_req.check_xy != ''){

        if (obj_req.px.split(/\s+/).length == obj_req.py.split(/\s+/).length){
            let arrPx = obj_req.px.split(/\s+/);
            let arrPy = obj_req.py.split(/\s+/);
            //console.log(arrPx);
            //console.log(arrPy);
            const arrPxPY = [];
            for (let i = 0; i < arrPx.length; i++){
                if (Number.isInteger(parseInt(arrPx[i])) && Number.isInteger(parseInt(arrPy[i]))){
                    let xx = coor.toLatLon(arrPx[i], arrPy[i], 47, 'Q');
                    arrPxPY.push(xx);
                }
                else {
                    //console.log(drawnitem);
                    return 'error';
                }
            }
            for (let j = 0; j < arrPxPY.length; j++){
                if ((arrPxPY[j].latitude) && (arrPxPY[j].longitude)){
                    //console.log("OK");
                }
                else {
                    //console.log("มี NaN");
                    return 'error';
                }
            }
            return checkInputType(arrPxPY,typeinput);
        }
        else {
            //console.log(drawnitem);
            return 'error';
        }
    }

    else {
        return null;
    }


/*     if ((obj_req.px && obj_req.py) != null){

    }
    else {
        drawnitem = null;
        tempitem = null;
        return {drawnitem:drawnitem,tempitem:tempitem};
    } */
}


function checkInputType(arrXY,typeinput){
    if (typeinput == 'point'){
        return generateJSONPoint(arrXY);
    }
    else if (typeinput == 'line'){
        return generateJSONLine(arrXY);
    }
    else {
        return generateJSONPolygon(arrXY);
    }
}

function generateJSONPoint(arrXY){

    const featurex = [];
    let features;

    for (let k = 0; k < arrXY.length; k++){

        features = {
            type:"Feature",
            properties:{id:k},
            geometry:{
                type:"Point",
                coordinates:[arrXY[k].longitude, arrXY[k].latitude],
            }
        }
        featurex.push(features);
    }

    return formatJSON(featurex);



}
function generateJSONLine(arrXY){

    const featurex = [];
    const coordinates = [];
    let features;

    for (let k = 0; k < arrXY.length; k++){
        p1 = [arrXY[k].longitude, arrXY[k].latitude],
        coordinates.push(p1);
    }

    features = {
        type:"Feature",
        properties:{id:1},
        geometry:{
            type:"LineString",
            coordinates:coordinates,
        }
    }


    featurex.push(features);

    return formatJSON(featurex);

}

function generateJSONPolygon(arrXY){

    const featurex = [];
    const coordinates = [];
    let features;

    for (let k = 0; k < arrXY.length; k++){
        p1 = [arrXY[k].longitude, arrXY[k].latitude],
        coordinates.push(p1);
    }
    coordinates.push([arrXY[0].longitude, arrXY[0].latitude])

    features = {
        type:"Feature",
        properties:{id:1},
        geometry:{
            type:"Polygon",
            coordinates:[coordinates],
        }
    }


    featurex.push(features);

    return formatJSON(featurex);

}

function formatJSON(inputFeature){
    const json = {
        type:'FeatureCollection',
        features: inputFeature
    }
    let out =  JSON.stringify(json);
    //console.log(out);
    return out;
}



module.exports.checkCoordinate = checkCoordinate;


//let objtest = {px:"601250 61520 698420",py:"2012006 2102546 2105635"}
//let typetest = 'point';

//checkCoordinate (objtest,typetest);