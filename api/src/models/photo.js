const mongoose = require('mongoose');
const Web3 = require('web3');

const photoSchema = new mongoose.Schema({
    index: {
        type: Number,
        required: true
    },
    image: {
        type: String,
        required: true,
        trim: true
    }, 
    imagePath: {
        type: String,
        required: true
    },
    imageHash: {
        type: String
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
    price: {
        type: Number,
        required: true
    }
});

// hashing photo before saving it to the database
photoSchema.pre('save', async function(next) {
    const photo = this;

    if (photo.isModified('image')) {
        photo.imageHash = Web3.utils.keccak256(`${new Date().toISOString()}-${photo.image}`)
    }

    next();
});

const Photo = mongoose.model('Photo', photoSchema);

module.exports = Photo;