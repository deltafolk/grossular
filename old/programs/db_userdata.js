function db_userdata (idkey){

    if (idkey == ''){
        sql_userdat = "SELECT * FROM taskdata WHERE idkey LIKE '" + + "'";
    }

}

module.exports.db_userdata = db_userdata;