const express = require('express');
const userController = require('../controllers/user');

const router = express.Router()

router.post('/login', userController.login);
router.post('/updateBalance/:ethereumAddress', userController.updateUserBalance);
router.post('/beTraveller/:ethereumAddress', userController.userToTraveller);
router.post('/travellerDeposit/:ethereumAddress', userController.travellerDeposit);

router.get('/:ethereumAddress', userController.getUser);

module.exports = router;