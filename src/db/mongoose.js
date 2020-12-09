const mongoose = require('mongoose');

const MONGODB_URI = "mongodb://jeffry:jeffry123@ds035673.mlab.com:35673/traveller-helper";

mongoose.connect(MONGODB_URI, {
    useNewUrlParser: true,
    useCreateIndex: true
});

module.exports = mongoose;