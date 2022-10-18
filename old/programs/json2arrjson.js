function json2arrjson(jsoninput) {
    let json = JSON.parse(jsoninput);
    //console.log(json.features[1].geometry);
    let countFeature = json.features.length;

    if (countFeature <= 10){
        return splitShortJson(json);
    }
    if (countFeature <= 20){
        return splitLongJson(json);
    }
    else {
        return [JSON.parse(jsoninput)];
    }

}


function splitShortJson(obj_json){
    let arr = [];
    for (let i = 0; i < obj_json.features.length; i++){

        let feature = {
            type: "FeatureCollection",
            features: [obj_json.features[i]],
        }

        arr.push(feature);
    }
    return arr;
}

function splitLongJson(obj_json){
    let arr = [];
    for (let i = 0; i < obj_json.features.length; i=i+2){

        let featureA = {
            type: "FeatureCollection",
            features: [obj_json.features[i],obj_json.features[i+1]]
        }

        arr.push(featureA);
    }

    return arr;
}


module.exports.json2arrjson = json2arrjson;


let jjj = JSON.stringify({
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            99.140625,
            15.453680224345835
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            102.3046875,
            16.551961721972525
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            100.7666015625,
            18.500447458475094
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            100.81054687499999,
            17.97873309555617
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            100.74462890625,
            17.644022027872726
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            100.83251953125,
            17.35063837604883
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            100.45898437499999,
            17.35063837604883
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            101.05224609374999,
            17.056784609942554
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            100.37109375,
            17.035777250427195
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            100.34912109375,
            18.312810846425442
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            99.97558593749999,
            17.811456088564483
          ]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [
            99.97558593749999,
            17.811456088564483
          ]
        }
      }
    ]
  });

let xxx = json2arrjson(jjj);
console.log(JSON.stringify(xxx));