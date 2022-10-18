function checkTime(inputtime){


    let atime = inputtime.split(" ");
    let date = atime[0].split("-");
    let time = atime[1].split(":");

    let day2min = date[0] * 1440;
    let month2min = date[1] * 30 * 1440;
    let year2min = date[2] * 30 * 12 * 1440;

    let hr2min = time[0] * 60;
    let min = parseInt(time[1]);

    let summin = day2min+month2min+year2min+hr2min+min;


    let m = new Date();
    let dateString =
        ("0" + m.getUTCDate()).slice(-2) + "-" +
        ("0" + (m.getUTCMonth()+1)).slice(-2) + "-" +
        m.getUTCFullYear() + " " +
        ("0" + m.getUTCHours()).slice(-2) + ":" +
        ("0" + m.getUTCMinutes()).slice(-2);


    let atime_n = dateString.split(" ");
    let date_n = atime_n[0].split("-");
    let time_n = atime_n[1].split(":");

    let day2min_n = date_n[0] * 1440;
    let month2min_n = date_n[1] * 30 * 1440;
    let year2min_n = date_n[2] * 30 * 12 * 1440;

    let hr2min_n = time_n[0] * 60;
    let min_n = parseInt(time_n[1]);

    let summin_n = day2min_n+month2min_n+year2min_n+hr2min_n+min_n;

    ////

    let sum = summin_n-summin;

    if (sum >= 0){
        if (sum < 43200){
            if (sum < 60){
                if(sum != 0){
                    return sum+" นาทีที่แล้ว";
                }
                else {
                    return "ไม่กี่วินาทีที่แล้ว";
                }
        
            }
            else if (sum < 1440){
        
                let hr_time = Math.floor(sum / 60);
                return hr_time+" ชั่วโมงที่แล้ว";
        
            }
            else if (sum < 43200){
        
                let day_time = Math.floor(sum / 60 / 24);
                return day_time+" วันที่แล้ว";
                
            }
        
        }
        else {
            return inputtime;
        }
    }
    else {
        return inputtime;
    }

}


module.exports.checkTime = checkTime;