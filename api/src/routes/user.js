const express = require('express');
const userController = require('../controllers/user');

const router = express.Router()

router.post('/login', userController.login);
router.post('/updateBalance', userController.updateUserBalance);
router.post('/beTraveller', userController.userToTraveller);
router.post('/travellerDeposit', userController.travellerDeposit);

router.get('/user', userController.getUser);

module.exports = router;