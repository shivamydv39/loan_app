const User = require('../models/User');

// Basic loan eligibility logic
async function checkEligibility(userId, amount, tenure) {
  // Fetch user profile
  const user = await User.findById(userId);
  if (!user) return false;

  // Example eligibility rules:
  // - PAN present
  // - Age > 21
  // - Email present
  // - Credit score above 600
  if (!user.pan || !user.email || !user.dob) return false;

  // Age calculation
  const age = Math.floor((Date.now() - new Date(user.dob).getTime()) / (365.25 * 24 * 60 * 60 * 1000));
  if (age < 21) return false;

  if (user.creditScore < 600) return false;

  // Amount between 10k and 5L, tenure between 6 and 36 months
  if (amount < 10000 || amount > 500000) return false;
  if (tenure < 6 || tenure > 36) return false;

  return true;
}

module.exports = { checkEligibility };