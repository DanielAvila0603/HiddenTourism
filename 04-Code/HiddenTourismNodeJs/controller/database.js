const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
    host: 'localhost',
    port: 3307,
    user: 'root',
    password: '12345678',
    database: 'hiddentourismdata'
});

mysqlConnection.connect(function(err){
    if(err){
        console.log(err);
        return;
    }else{
        console.log('Db is connected');
    }
});

module.exports = mysqlConnection;