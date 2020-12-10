const mongoose = require('mongoose');
const Web3 = require('web3');

const photoSchema = new mongoose.Schema({
    index: {
        type: Number,
        unique: true,
        required: true
    }, 
    imagePath: {
        type: String,
        required: true
    },
    travellerAddress: {
        type: String,
        unique: true,
        required: true
    },
    helperAddress: {
        type: String,
        unique: true,
        required: true
    },
    travellerManager: {
        type: String, 
        required: true,
        trim: true
    },
});

const Photo = mongoose.model('Photo', photoSchema);

module.exports = Photo;