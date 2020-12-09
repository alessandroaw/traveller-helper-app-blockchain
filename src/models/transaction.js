const mongoose = require('mongoose');

const transactionSchema = new mongoose.Schema({
    travellerAddress: {
        type: String,
        required: true,
        trim: true
    },
    paymentAddress: {
        type: String,
        unique: true,
        trim: true
    },
    index: {
        type: Number
    },
    approval: {
        type: String,
        enum: ['Pending', 'Rejected', 'Approved'],
        default: 'Pending'
    },
    imageId: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: 'Photos'
    }
});

const Transaction = mongoose.model('Transactions', transactionSchema);

module.exports = Transaction;