const mysql = require('mysql');

const db = mysql.createConnection({ 
    host: "localhost",
    user: "demo",
    password: "topsecret"
});

db.connect((err) => { 
    if (err) throw err;

    console.log("Connecté à la base de données MySQL!");

    db.query("CREATE DATABASE IF NOT EXISTS mabdd", 
    (err, result) => { 
        if (err) throw err; 
        console.log("Base de données créée !");
        });
        
    let sql = "CREATE TABLE IF NOT EXISTS mabdd.groupe ("
        + "id int(11) NOT NULL, "
        + "nom varchar(80) NOT NULL, "
        + "groupe int(11) NOT NULL"
        + ") ENGINE=InnoDB DEFAULT CHARSET=utf8;";

    db.query(sql,
    (err, result) => { 
        if (err) throw err; 
        console.log("Table groupe créée !");
        });

});