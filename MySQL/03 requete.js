const mysql = require('mysql');

const bdd = mysql.createConnection({
   host: "localhost",
   user: "demo",
   password: "Topsecret007!",
   database : "disquaire"
 });

bdd.connect(function(err) {
  if (err) throw err;
  console.log(`Connecté à la base de données 'disquaire'`);
  bdd.query("SELECT G.nom AS Groupe, A.nom AS Album FROM groupe G, album A WHERE G.id = A.groupe", function (err, result) {
      if (err) throw err;
      console.log(result);
      bdd.end();
    });
});