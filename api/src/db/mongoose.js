require('dotenv').config();
const mongoose = require('mongoose');

const MONGODB_URI = process.env.MONGODB_URI;

mongoose.connect(MONGODB_URI, {
    useNewUrlParser: true,
    useCreateIndex: true
}).then(() => { console.log('success!! connected to database') });

module.exports = mongoose;