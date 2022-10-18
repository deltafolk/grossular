const utm = require('utm');

function getMapCenter(xyinput){
    let x = Math.round(xyinput.center_coordinate[0]/1000) * 1000;
    let y = Math.round(xyinput.center_coordinate[1]/1000) * 1000;

    let xy = utm.toLatLon(x, y, 47, 'Q');

    let lat = xy.latitude;
    let lng = xy.longitude;

    return [lat,lng]

}

function getXYTopo (xyinput){

    let x = Math.round(xyinput.center_coordinate[0]/1000) * 1000;
    let y = Math.round(xyinput.center_coordinate[1]/1000) * 1000;

    let coorX = [x-3000, x-1000, x+1000, x+3000];
    let coorY = [y+4000, y+2000, y, y-2000, y+4000];

    let latlng = utm.toLatLon(x, y, 47, 'Q');

    let nx = latlng.longitude;
    let ny = latlng.latitude;

    return {coorX:coorX,coorY:coorY,scale:'1 : 50,000',zoom:14.1,newcenter:[ny,nx]}
}

function getXYOrtho (xyinput){

    let ox = Math.round(xyinput.center_coordinate[0]/1000) * 1000;
    let oy = Math.round(xyinput.center_coordinate[1]/1000) * 1000;

    let xArr = [];
    let yArr = [];

    for (let i = 0; i < xyinput.coordinates.length; i++){
        xArr.push(parseInt(xyinput.coordinates[i].x));
        yArr.push(parseInt(xyinput.coordinates[i].y));
    }

    let minX = Math.min.apply(null, xArr);
    let maxX = Math.max.apply(null, xArr);
    let minY = Math.min.apply(null, yArr);
    let maxY = Math.max.apply(null, yArr);

    //console.log(minX, maxX, minY, maxY)

    if ((maxX - minX <= 700 ) && (maxY - minY <= 800)) {
        let scale = '1 : 4,000';
        let zoom = 17.45;

        let x = Math.round(xyinput.center_coordinate[0]/80) * 80;
        let y = Math.round(xyinput.center_coordinate[1]/80) * 80;

        let coorX = [x-240, x-80, x+80, x+240];
        let coorY = [y+320, y+160, y, y-160, y-320];

        let latlng = utm.toLatLon(x, y, 47, 'Q');

        let nx = latlng.longitude;
        let ny = latlng.latitude;

        return {coorX:coorX,coorY:coorY,scale:scale,zoom:zoom,newcenter:[ny,nx]};
    }
    else if ((maxX - minX <= 1400 ) && (maxY - minY <= 1600)) {
        let scale = '1 : 8,000';
        let zoom = 16.45;

        let x = Math.round(xyinput.center_coordinate[0]/160) * 160;
        let y = Math.round(xyinput.center_coordinate[1]/160) * 160;

        let coorX = [x-480, x-160, x+160, x+480];
        let coorY = [y+640, y+320, y, y-320, y-640];

        let latlng = utm.toLatLon(x, y, 47, 'Q');

        let nx = latlng.longitude;
        let ny = latlng.latitude;

        return {coorX:coorX,coorY:coorY,scale:scale,zoom:zoom,newcenter:[ny,nx]};
    }
    else if ((maxX - minX <= 3500 ) && (maxY - minY <= 4000)) {
        let scale = '1 : 20,000';
        let zoom = 15.17;

        let x = Math.round(xyinput.center_coordinate[0]/400) * 400;
        let y = Math.round(xyinput.center_coordinate[1]/400) * 400;

        let coorX = [x-1200, x-400, x+400, x+1200];
        let coorY = [y+800, y+400, y, y-400, y-800];

        let latlng = utm.toLatLon(x, y, 47, 'Q');

        let nx = latlng.longitude;
        let ny = latlng.latitude;

        return {coorX:coorX,coorY:coorY,scale:scale,zoom:zoom,newcenter:[ny,nx]};
    }
    else  {
        let scale = '1 : 50,000';
        let zoom = 14.1;

        let x = Math.round(xyinput.center_coordinate[0]/1000) * 1000;
        let y = Math.round(xyinput.center_coordinate[1]/1000) * 1000;

        let coorX = [x-3000, x-1000, x+1000, x+3000];
        let coorY = [y+4000, y+2000, y, y-2000, y+4000];

        let latlng = utm.toLatLon(x, y, 47, 'Q');

        let nx = latlng.longitude;
        let ny = latlng.latitude;

        return {coorX:coorX,coorY:coorY,scale:scale,zoom:zoom,newcenter:[ny,nx]};
    }

}

function getTitle (titleinput){
    const titleArr = titleinput.split("\r\n");
    let newTitle = '';

    for (let i = 0; i < titleArr.length && i < 3; i++){
        newTitle = newTitle + titleArr[i];
        if (i < 2){
            newTitle = newTitle + '<br>';
        }

    }

    return newTitle;


}

function getMapSheet (xyinput){


    let startsheetx = 49;
    let startsheety = 44;

    let startx = 99.5;
    let starty = 17.5;

    let sheetresult = null;

    let arrSheet = [];

    for (let k = 0; k < xyinput.coordinates.length; k++) {


        let px = xyinput.coordinates[k].x;
        let py = xyinput.coordinates[k].y;

        //console.log(px, py)

        let xy = utm.toLatLon(px, py, 47, 'Q');

        let iy = xy.latitude;
        let ix = xy.longitude;

        //console.log(ix, iy)


        for (let i = 0; i <= 10; i++){//แกนx

            for (let j = 0; j <= 10; j++){//แกนy

                if ((((startx + 0.5*i) <= ix) && (ix <= ((startx + 0.5*i) + 0.5))) && (((starty + 0.5*j) <= iy) && (iy <= ((starty + 0.5*j) + 0.5)))){

                    if ((ix >= ((startx + 0.5*i + ((startx + 0.5*i) + 0.5))/2)) && (iy >= ((starty + 0.5*j + ((starty + 0.5*j) + 0.5))/2))){
                        sheetresult = startsheetx+i+''+(startsheety+j)+"I";
                        break;
                    }
                    else if ((ix >= ((startx + 0.5*i + ((startx + 0.5*i) + 0.5))/2)) && (iy <= ((starty + 0.5*j + ((starty + 0.5*j) + 0.5))/2))){
                        sheetresult = startsheetx+i+''+(startsheety+j)+"II";
                        break;
                    }
                    else if ((ix <= ((startx + 0.5*i + ((startx + 0.5*i) + 0.5))/2)) && (iy <= ((starty + 0.5*j + ((starty + 0.5*j) + 0.5))/2))){
                        sheetresult = startsheetx+i+''+(startsheety+j)+"III";
                        break;
                    }
                    else if ((ix <= ((startx + 0.5*i + ((startx + 0.5*i) + 0.5))/2)) && (iy >= ((starty + 0.5*j + ((starty + 0.5*j) + 0.5))/2))){
                        sheetresult = startsheetx+i+''+(startsheety+j)+"IV";
    
                        break;
                    }
                    else {
                        sheetresult = null;
                    }

                }

                else {

                }
            }

        }

        let valuex = false;

        for (let z = 0; z < arrSheet.length; z++){
            if (arrSheet[z] == sheetresult){
                valuex = true;
            }

        }

        if (valuex != true){
            arrSheet.push(sheetresult);
        }


    }

    return arrSheet;

}


module.exports.getMapCenter = getMapCenter;
module.exports.getXYTopo = getXYTopo;
module.exports.getXYOrtho = getXYOrtho;
module.exports.getTitle = getTitle;
module.exports.getMapSheet = getMapSheet;

let xyin = {"coordinates":[{"feature":0,"part":0,"point":0,"x":"665349","y":"2087785","zone":"47Q"},{"feature":0,"part":0,"point":1,"x":"665337","y":"2087732","zone":"47Q"},{"feature":0,"part":0,"point":2,"x":"665424","y":"2087732","zone":"47Q"},{"feature":0,"part":0,"point":3,"x":"665477","y":"2087684","zone":"47Q"},{"feature":0,"part":0,"point":4,"x":"665514","y":"2087775","zone":"47Q"},{"feature":0,"part":0,"point":5,"x":"665464","y":"2087758","zone":"47Q"},{"feature":0,"part":0,"point":6,"x":"665349","y":"2087785","zone":"47Q"},{"feature":1,"part":0,"point":0,"x":"665256","y":"2087871","zone":"47Q"},{"feature":1,"part":0,"point":1,"x":"665238","y":"2087838","zone":"47Q"},{"feature":1,"part":0,"point":2,"x":"665269","y":"2087816","zone":"47Q"},{"feature":1,"part":0,"point":3,"x":"665282","y":"2087823","zone":"47Q"},{"feature":1,"part":0,"point":4,"x":"665270","y":"2087843","zone":"47Q"},{"feature":1,"part":0,"point":5,"x":"665256","y":"2087871","zone":"47Q"},{"feature":2,"part":0,"point":0,"x":"665250","y":"2087730","zone":"47Q"},{"feature":2,"part":0,"point":1,"x":"665237","y":"2087688","zone":"47Q"},{"feature":2,"part":0,"point":2,"x":"665272","y":"2087674","zone":"47Q"},{"feature":2,"part":0,"point":3,"x":"665277","y":"2087685","zone":"47Q"},{"feature":2,"part":0,"point":4,"x":"665250","y":"2087730","zone":"47Q"}],"center_coordinate":["665320","2087767"]}  ;

console.log(getXYTopo(xyin));
console.log(getXYOrtho(xyin));

console.log(getTitle('แผนที่แสดงแปลงปลูกป่าแนวกันชน จำนวน 20 ไร่ ประจำปีงบประมาณ พ.ศ.2565 \r\n หน่วยจัดการต้นน้ำน้ำงาว ตำบลบ่อ อำเภอเมืองน่าน จังหวัดน่าน'));


console.log(getMapSheet (xyin));