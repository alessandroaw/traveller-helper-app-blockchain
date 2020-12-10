const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
    ethereumAddress: {
        type: String,
        unique: true,
        required: true,
    },
    etherBalance: {
        type: Number,
        required: true
    },
    travellerManagerAddress: {
        type: String,
    },
    travellerDeposit: {
        type: Number
    }
});

UserSchema.methods.toJSON = function() {
    const user = this;
    const userObject = user.toObject();

    return userObject;
}


const User = mongoose.model('User', UserSchema);

module.exports = User;