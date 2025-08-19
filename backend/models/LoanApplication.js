const mongoose = require("mongoose");

const loanApplicationSchema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  amount: { type: Number, required: true },
  tenure: { type: Number, required: true }, // in months
  status: {
    type: String,
    enum: ["Submitted", "Under Review", "Approved", "Rejected", "Disbursed"],
    default: "Submitted",
  },
  eligibility: { type: Boolean, default: false },
  remarks: { type: String },
  appliedAt: { type: Date, default: Date.now },
  approvedAt: { type: Date },
  disbursedAt: { type: Date },
});

module.exports = mongoose.model("LoanApplication", loanApplicationSchema);
