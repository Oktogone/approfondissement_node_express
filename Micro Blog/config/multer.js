const multer = require('multer');
  
const storage = multer.diskStorage({
    destination: (req, fichier, callback) => {
        callback(null, 'public/images');
    },
    filename: (req, fichier, callback) => {
        const nom = fichier.originalname.split(' ').join('_');
        callback(null, Date.now() + '_' + nom);
    }
});

module.exports = multer({storage}).single('image');