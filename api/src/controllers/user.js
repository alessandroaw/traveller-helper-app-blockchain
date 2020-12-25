const User = require('../models/user');

async function login(req, res, next) {

    // print request body
    console.log("This is request body of USER LGIN ", req.body);
    
    var userData = {
        ethereumAddress: req.body.ethereumAddress,
        etherBalance: req.body.etherBalance,
        travellerManagerAddress: req.body.travellerManagerAddress,
        travellerDeposit: req.body.travellerDeposit
    }

    User.create(userData, (error, match) => {
        if (error) {
            return next(error);
        } else {
            console.log(match);
            return res.status(201).send(userData);
        }
    })
}

async function getUser(req, res, next) {
    try {
        const user = await User.find({ethereumAddress: req.params.ethereumAddress});
        res.status(200).send(user);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function updateUserBalance(req, res, next) {
    const { id } = req.params;
    try {
        const updatedBalance = await User.findByIdAndUpdate(id, {$set: {etherBalance: req.body.etherBalance}});
        res.send(updatedBalance);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function userToTraveller(req, res, next) {
    const { id } = req.params;
    try {
        const travellerManagerAddress = await User.findByIdAndUpdate(id, {$set: {travellerManagerAddress: req.body.travellerManagerAddress}});
        res.send(travellerManagerAddress);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function travellerDeposit(req, res, next) {
    const { id } = req.params;
    try {
        const travellerDepositEth = await User.findByIdAndUpdate(id, {$set: {travellerDeposit: req.body.travellerDeposit}});
        res.send(travellerDepositEth);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}


module.exports = {login, getUser, updateUserBalance, userToTraveller, travellerDeposit}