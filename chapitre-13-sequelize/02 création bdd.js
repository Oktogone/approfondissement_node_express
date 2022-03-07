const sequelize = new Sequelize("", "nom_utilisateur", "mot_de_passe_utilisateur", {
    dialect: "mysql",
    host: "localhost"
   });
   
   try {
      sequelize.authenticate();
      console.log('Connecté à la base de données MySQL!');
      sequelize.query("CREATE DATABASE `mabdd`;").then(([results, metadata]) => {
          console.log('Base de données créée !');
        })
    } catch (error) {
      console.error('Impossible de se connecter, erreur suivante :', error);
    }