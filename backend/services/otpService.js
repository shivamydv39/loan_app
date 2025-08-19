// Simple in-memory OTP store (use Redis in production)
const otpStore = {};

function generateOTP(mobile) {
  const otp = Math.floor(1000 + Math.random() * 9000).toString();
  otpStore[mobile] = {
    otp,
    expires: Date.now() + (parseInt(process.env.OTP_VALIDITY_MINUTES) || 5) * 60 * 1000
  };
  return otp;
}

function verifyOTP(mobile, otp) {
  if (!otpStore[mobile]) return false;
  const record = otpStore[mobile];
  if (record.otp !== otp) return false;
  if (Date.now() > record.expires) {
    delete otpStore[mobile];
    return false;
  }
  delete otpStore[mobile]; // OTP used up
  return true;
}

module.exports = { generateOTP, verifyOTP };