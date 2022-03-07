const express = require('express');
const router = express.Router();
const multer = require('../middleware/multer-config');

module.exports = (param) => {

    router.get('/', (req, rep) => {
        rep.render('layout', { pageTitle: "Bienvenue", template: "index" });
    });

    router.post('/', multer, (req, rep) => {
        console.log(req.file);
        rep.render('layout', { pageTitle: "Bienvenue", template: "image",
        nom: req.body.nom,
        image: `${req.protocol}://${req.get('host')}/images/${req.file.filename}`
        });
    });

    return router;
}
