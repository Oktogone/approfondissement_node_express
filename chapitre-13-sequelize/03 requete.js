const sequelize = new Sequelize("mabdd", "nom_utilisateur", "mot_de_passe_utilisateur", {
    dialect: "mysql",
    host: "localhost"
   });
   
   try {
      sequelize.authenticate();
      console.log('Connecté à la base de données MySQL!');
      sequelize.query("SELECT eleves.id as 'eleve_id', eleves.nom as 'eleve_nom', eleves.cours_id, cours.nom as 'cours_nom', cours.date as 'cours_date' FROM eleves JOIN cours on eleves.cours_id = cours.id").then(([results, metadata]) => {
          console.log(results);
        })
    } catch (error) {
      console.error('Impossible de se connecter, erreur suivante :', error);
    }