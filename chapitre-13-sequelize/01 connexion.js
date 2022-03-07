
// npm install mysql2

const { Sequelize } = require('sequelize');

const sequelize = new Sequelize("nom_base_de_donnees", "nom_utilisateur", "mot_de_passe_utilisateur", {
    dialect: "mysql",
    host: "localhost"
});

try {
    sequelize.authenticate();
    console.log('Connecté à la base de données MySQL!');
  } catch (error) {
    console.error('Impossible de se connecter, erreur suivante :', error);
  }