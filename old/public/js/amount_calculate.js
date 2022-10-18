
function amountCalculate(input){
    if (input.features[0].geometry.type == 'Point' || input.features[0].geometry.type == 'MultiPoint'){
        var result = countPoint(input);
    }

    else if (input.features[0].geometry.type == 'LineString' || input.features[0].geometry.type == 'MultiLineString'){
        var result = lengthLine(input);
    }

    else if (input.features[0].geometry.type == 'Polygon' || input.features[0].geometry.type == 'MultiPolygon'){
        var result = areaPoly(input);
    }
    else {
        var result = "Not support Geometry type";
    }
    return result;
}

function areaPoly (polyObj){


    const areaArray = [];

    for (var i = 0; i < polyObj.features.length; i++){
        var poly = polyObj.features[i].geometry;
        var area = turf.area(poly);
        var areaRaiFixed = (area / 1600).toFixed(2);
        areaArray.push(areaRaiFixed);

    }

    var areaAll = 0;
    for (var j = 0; j < areaArray.length; j++){
        areaAll = areaAll + parseFloat(areaArray[j]);
    }

    return (areaAll);
}



function lengthLine(lineObj){

    const lengthArray = [];

    for (var i = 0; i < lineObj.features.length; i++){
        var line = lineObj.features[i].geometry;
        var length = turf.length(line);
        var lengthKmFixed = (length).toFixed(2);
        lengthArray.push(lengthKmFixed);

    }

    var lengthAll = 0;
    for (var j = 0; j < lengthArray.length; j++){
        lengthAll = lengthAll + parseFloat(lengthArray[j]);
    }

    return (lengthAll);
}




function countPoint(pointObj){
    return pointObj.features.length;
}
