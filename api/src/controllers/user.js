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


module.exports = {login}