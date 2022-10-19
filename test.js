//ใช้ callback สั่งให้ cal ทำงานโดยรอ 5 วินาที ก่อนที่จะสั่งให้ display() ทำงาน


function cal(x, callback){
    console.log("calculating... (about 5 seconds)")
    let sum = x+5;

    setTimeout(()=>{
        callback(sum)
    },5000)

}

function diff(x, callback){
    console.log("calculating different... (about 2 seconds))")
    let diff = x-5;

    setTimeout(()=>{
        callback(diff)
    },2000)
}

function devide(x, callback){
    console.log("calculating devide... (about 3 seconds))")
    let devide = x/5;

    setTimeout(()=>{
        callback(devide)
    },3000)
}

let test = 15;

//สั่งให้ทำงานไปทีละคำสั่ง cal -> diff -> devide (callback hell)
/* 
cal (test, function display(show){
    console.log("sum is " + show)
    diff (test, function display(show){
        console.log("different is " + show)
        devide (test, function display(show){
            console.log("devide is " + show)
        })
    })
}) 
*/


///////////////////////////////////////////////////////////////////////////
//การใช้ promise

function pcal(x){
    return new Promise((resolve, reject)=>{
        console.log("promise calculating... (about 3 seconds)")
        setTimeout(()=>{
            resolve(x+5)
        },3000)
    })
}

function pdiff(x){
    return new Promise((resolve, reject)=>{
        console.log("promise differant calculating... (about 5 seconds)")
        setTimeout(()=>{
            resolve(x-5)
        },5000)
    })
}

function pdevide(x){
    return new Promise((resolve, reject)=>{
        console.log("promise devide calculating... (about 1 seconds)")
        setTimeout(()=>{
            resolve(x/5)
        },1000)
    })
}


let test2 = 11;

// promise hell
/*
pcal (test2).then((result)=>{
    console.log(result);
    pdiff (test2).then((result)=>{
        console.log(result);
        pdevide (test2).then((result)=>{
            console.log(result);
        })
    })
})
*/

//เขียนในอีกรูปแบบหนึ่ง (promise then) ได้ดังต่อไปนี้ 

/* pcal (test2).then((result)=>{
    console.log(result);
    return pdiff(test2);
}).then((result)=>{
    console.log(result);
    return pdevide(test2);
}).then((result)=>{
    console.log(result);
})
*/




///////////////////////////////////////////////////////////////////////////
// เขียนแบบ async กับ await (ใช้ function เดียวกับข้อ promise)

async function main(){
    console.log(await pcal(test2));
    console.log(await pdiff(test2));
    console.log(await pdevide(test2));
}

main();