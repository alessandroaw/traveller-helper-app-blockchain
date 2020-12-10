const express = require('express');
const router = express.Router();
const transactionController = require('../controllers/transaction');

router.get('/:travellerAddress', transactionController.get);
router.post('/', transactionController.post);
router.post('/:id', transactionController.patch);

module.exports = router;