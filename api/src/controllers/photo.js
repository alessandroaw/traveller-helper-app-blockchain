const Photo = require('../models/photo');

async function post (req, res, next) {
    const photo = new Photo({...req.body, imagePath: `uploads/${req.file.filename}` });
    try {
        await photo.save();
        res.status(201).send(photo);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function getAllPhotosTraveller(req, res, next) {
    try {
        const photos = await Photo.find({travellerAddress: req.params.travellerAddress});
        if (photos == null) {
            console.log("Photos not found")
            res.status(404);
        }
        res.status(200).send(photos);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function getAllPhotosHelper(req, res, next) {
    try {
        const photos = await Photo.find({helperAddress: req.params.helperAddress});
        if (photos == null) {
            console.log("Photos not found")
            res.status(404);
        }
        res.status(200).send(photos);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function patch(req, res, next) {
	res.send(req.params.imageHash);
}

module.exports = {
    post,
    getAllPhotosHelper,
    getAllPhotosTraveller,
    patch
}
