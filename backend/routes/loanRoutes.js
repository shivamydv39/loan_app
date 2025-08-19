const express = require('express');
const router = express.Router();
const { applyLoan, getLoanStatus, updateLoanStatus } = require('../controllers/loanController');
const { authMiddleware } = require('../middlewares/authMiddleware');

// Submit loan application
router.post('/apply', authMiddleware, applyLoan);

// Get user's loan applications/statuses
router.get('/status', authMiddleware, getLoanStatus);

// Update loan status (admin/system/mock endpoint)
// router.post('/status/update', updateLoanStatus);

module.exports = router;