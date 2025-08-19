// General helpers

// Calculate age from DOB
function getAge(dob) {
  if (!dob) return null;
  const diffMs = Date.now() - new Date(dob).getTime();
  return Math.floor(diffMs / (365.25 * 24 * 60 * 60 * 1000));
}

// Loan EMI calculation: principal, rate per annum, tenure in months
function calculateEMI(principal, annualRate, tenureMonths) {
  const monthlyRate = annualRate / 12 / 100;
  const emi =
    (principal * monthlyRate * Math.pow(1 + monthlyRate, tenureMonths)) /
    (Math.pow(1 + monthlyRate, tenureMonths) - 1);
  return Math.round(emi);
}

module.exports = { getAge, calculateEMI };