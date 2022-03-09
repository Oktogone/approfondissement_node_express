const express = require('express');
const router = express.Router();

module.exports = (param) => {

    router.get('/', (req, rep) => {
        rep.render('layout', { pageTitle: "Bienvenue", template: "index" });
    });

    router.post('/', (req, rep) => {
        console.log(req.file);
        rep.render('layout', { pageTitle: "Bienvenue", template: "image",
        nom: req.body.nom,
        });
    });

    return router;
}
