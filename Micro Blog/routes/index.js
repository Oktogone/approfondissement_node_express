const express = require('express');
const router = express.Router();
const multer = require('../config/multer');

module.exports = (param) => {

    router.get('/', (req, rep) => {
        rep.render('layout', { pageTitle: "Bienvenue", template: "index" });
    });

    router.post('/', multer, (req, rep) => {
        rep.render('layout', { pageTitle: "Bienvenue", template: "image",
        nom: req.body.nom,
        image: `${req.file.filename}`
        });
    });

    return router;
}
