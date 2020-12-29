const express = require('express');
const router = express.Router();
const transactionController = require('../controllers/transaction');

router.get('/helper/:helperAddress', transactionController.getHelperTrans);
router.get('/pending/:travellerAddress', transactionController.getPendingTrans);
router.post('/create', transactionController.post);
router.post('/confirmation/:id', transactionController.patch);

module.exports = router;