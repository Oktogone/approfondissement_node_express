// Les imports de modules Node
const express = require('express');
const path = require('path');
const fs = require('fs');
const bodyParser = require('body-parser');
var logger = require('morgan');

const router = require('./routes');

const app = express();
const port = 3000;

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, './views'));
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(path.join(__dirname, './public')));

app.use(logger('dev'));
app.use('/', router());

app.listen(port, () => {
    console.log(`Le serveur a démarré sur http://localhost:${port}`);
});