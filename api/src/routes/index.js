const express = require('express');
const userRouter = require('./user');
const photoRouter = require('./photo');
const transactionRouter = require('./transaction');

const router = express.Router()

router.use('/user', userRouter);
router.use('/photo', photoRouter);
router.use('/transaction', transactionRouter);  

module.exports = router