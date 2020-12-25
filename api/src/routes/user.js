const express = require('express');
const userController = require('../controllers/user');

const router = express.Router()

router.post('/login', userController.login);
router.post('/updateBalance/:id', userController.updateUserBalance);
router.post('/beTraveller/:id', userController.userToTraveller);
router.post('/travellerDeposit/:id', userController.travellerDeposit);

router.get('/:ethereumAddress', userController.getUser);

module.exports = router;