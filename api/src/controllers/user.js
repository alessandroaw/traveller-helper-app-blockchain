const User = require('../models/user');

async function login(req, res, next) {

    // print request body
    console.log("This is request body of USER LGIN ", req.body);
    
    var userData = {
        ethereumAddress: req.body.ethereumAddress.toLowerCase(),
        travellerManagerAddress: req.body.travellerManagerAddress.toLowerCase(),
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
        const user = await User.findOne({ethereumAddress: req.params.ethereumAddress.toLowerCase()});
        res.status(200).send(user);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function userToTraveller(req, res, next) {
    const { ethereumAddress } = req.params;
    try {
        const travellerManagerAddress = await User.findOneAndUpdate(ethereumAddress, {travellerManagerAddress: req.body.travellerManagerAddress});
        res.send(travellerManagerAddress);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function travellerDeposit(req, res, next) {
    const { ethereumAddress } = req.params;
    try {
        const travellerDepositEth = await User.findOneAndUpdate(ethereumAddress, {travellerDeposit: req.body.travellerDeposit});
        res.send(travellerDepositEth);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}


module.exports = {login, getUser, userToTraveller, travellerDeposit}