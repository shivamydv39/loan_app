// Utility validation functions

// PAN format: 5 letters, 4 digits, 1 letter (e.g., ABCDE1234F)
function isValidPAN(pan) {
  return /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/.test(pan);
}

// Simple email validation
function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

// Mobile number (India): 10 digits, starts with [6-9]
function isValidMobile(mobile) {
  return /^[6-9]\d{9}$/.test(mobile);
}

module.exports = { isValidPAN, isValidEmail, isValidMobile };