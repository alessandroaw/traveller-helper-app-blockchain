const User = require('../models/user');

async function login(req, res, next) {

    // print request body
    console.log("This is request body of USER LOGIN ", req.body);
    
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
        if (user == null) {
            console.log("Ethreum address have not yet registered");
            res.status(404);
        }
        res.status(200).send(user);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function userToTraveller(req, res, next) {
    const { ethereumAddress } = req.params;
    
    try {
        const user = await User.findOneAndUpdate({ethereumAddress: ethereumAddress.toLowerCase()}, {travellerManagerAddress: req.body.travellerManagerAddress.toLowerCase()});
        if (user == null) {
            console.log("Ethreum address have not yet registered");
            res.status(404);
        }
        res.send(user);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}

async function travellerDeposit(req, res, next) {
    const { ethereumAddress } = req.params;
    try {
            const user = await User.findOneAndUpdate({ethereumAddress: ethereumAddress.toLowerCase()}, {travellerDeposit: req.body.travellerDeposit});
            if (user == null) {
                console.log("Ethreum address have not yet registered");
                res.status(404);
            }
        res.send(user);
    } catch(e) {
        console.error(e);
        res.status(400).send(e);
    }
}


module.exports = {login, getUser, userToTraveller, travellerDeposit}