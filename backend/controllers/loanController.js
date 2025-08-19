const LoanApplication = require('../models/LoanApplication');
const { checkEligibility } = require('../services/loanService');

// Submit loan application
const applyLoan = async (req, res) => {
  const userId = req.user.id;
  const { amount, tenure } = req.body;
  // Basic eligibility check
  // const eligibility = await checkEligibility(userId, amount, tenure);

  const loanApp = new LoanApplication({
    user: userId,
    amount,
    tenure,
    eligibility,
    status: 'Submitted'
  });
  await loanApp.save();
  res.json({ message: 'Loan application submitted', loanApp });
};

// Get all user's loan applications
const getLoanStatus = async (req, res) => {
  const userId = req.user.id;
  const loans = await LoanApplication.find({ user: userId }).sort({ appliedAt: -1 });
  res.json(loans);
};

// Admin or system: Approve/Reject loan (mock logic)
const updateLoanStatus = async (req, res) => {
  const { loanId, status, remarks } = req.body;
  if (!['Approved', 'Rejected', 'Disbursed'].includes(status)) {
    return res.status(400).json({ message: 'Invalid status' });
  }

  const updates = { status, remarks };
  if (status === 'Approved') updates.approvedAt = new Date();
  if (status === 'Disbursed') updates.disbursedAt = new Date();

  const loan = await LoanApplication.findByIdAndUpdate(loanId, updates, { new: true });
  res.json({ message: `Loan ${status}`, loan });
};

module.exports = { applyLoan, getLoanStatus, updateLoanStatus };