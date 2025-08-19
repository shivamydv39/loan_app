const express = require("express");
const router = express.Router();
const { sendOtp, verifyOtp } = require("../controllers/authController");

router.post("/otp", sendOtp);
router.post("/verify", verifyOtp);

module.exports = router;
