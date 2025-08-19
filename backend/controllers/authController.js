const User = require("../models/User");
const jwt = require("jsonwebtoken");
const { generateOTP, verifyOTP } = require("../services/otpService");

const sendOtp = async (req, res) => {
  try {
    const { mobile } = req.body;
    if (!mobile)
      return res.status(400).json({ message: "Mobile number is required" });

    const user = await User.findOne({ mobile });
    if (user) {
      console.log(user);
      return res.status(400).json({ message: "User already exists" });
    }

    const otp = generateOTP(mobile);

    const newUser = await User.create({ mobile, otp });

    // In prod: send via SMS
    res.status(200).json({ message: "OTP sent", otp });
  } catch (err) {
    co
    res.status(500).json({ message: "Server error", error: err.message });
  }
};

const verifyOtp = async (req, res) => {
  try {
    const { mobile, otp } = req.body;
    if (!mobile || !otp)
      return res.status(400).json({ message: "Mobile and OTP are required" });

    const user = await User.findOne({ mobile });
    if (!user) {
      return res.status(400).json({ message: "User not found" });
    }

    if (otp !== user.otp) {
      return res.status(400).json({ message: "Invalid OTP" });
    }

    const token = jwt.sign(
      { id: user._id, mobile: user.mobile },
      process.env.JWT_SECRET,
      { expiresIn: "7d" }
    );

    res.status(200).json({ message: "OTP verified", token, user });
  } catch (err) {
    res.status(500).json({ message: "Server error", error: err.message });
  }
};

module.exports = { sendOtp, verifyOtp };
