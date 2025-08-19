const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: { type: String },
  dob: { type: Date },
  gender: { type: String, enum: ["Male", "Female", "Other"] },
  email: { type: String, unique: true, sparse: true },
  pan: { type: String, unique: true, sparse: true },
  mobile: { type: String, required: true, unique: true },
  creditScore: { type: Number, default: 650 },
  otp: { type: String },
  password: { type: String },
  emailOtp: { type: String },
  createdAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model("User", userSchema);
