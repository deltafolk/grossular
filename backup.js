const mysqldump = require('mysqldump');
// or const mysqldump = require('mysqldump')
 
// dump the result straight to a file

let m = new Date();
let date =
    ("0" + m.getUTCDate()).slice(-2) + "-" +
    ("0" + (m.getUTCMonth()+1)).slice(-2) + "-" +
    m.getUTCFullYear();

console.log("pending...");
setTimeout( backup,180000)

function backup() {
    mysqldump({
        connection: {
            host: 'localhost',
            user: 'root',
            port: 3306,
            password: '',
            database: 'g1s_db',
        },
        dumpToFile: '../backup_mysql/backup_g1s_'+date+'.sql',
    })
    console.log("backup completed");
}
