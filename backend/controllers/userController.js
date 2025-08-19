const User = require("../models/User");

// Get user profile
const getProfile = async (req, res) => {
  try {
    if (!req.user) return res.status(404).json({ message: "User not found" });
    res.status(200).json(req.user); // Directly return attached user
  } catch (err) {
    res.status(500).json({ message: "Server error", error: err.message });
  }
};

// Update user profile
const updateProfile = async (req, res) => {
  try {
    const updates = req.body;
    const user = await User.findByIdAndUpdate(req.user._id, updates, { new: true });

    if (!user) return res.status(404).json({ message: "User not found" });

    res.status(200).json({ message: "Profile updated", user });
  } catch (err) {
    res.status(500).json({ message: "Server error", error: err.message });
  }
};
module.exports = { getProfile, updateProfile };