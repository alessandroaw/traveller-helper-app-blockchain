const express = require('express');
const upload = require('../middlewares/image-upload');
const photoController = require('../controllers/photo');

const router = express.Router();

router.get('/:helperAddress', photoController.getAllPhotosHelper);
router.get('/:travellerAddress', photoController.getAllPhotosTraveller);
router.post('/', upload.single('imageFile'), photoController.post);
router.patch('/:imageHash', photoController.patch);

module.exports = router;
