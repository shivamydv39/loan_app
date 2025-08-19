const jwt = require("jsonwebtoken");
const User = require("../models/User");

const authMiddleware = async (req, res, next) => {
  const authHeader = req.headers.authorization;

  console.log("authHeader:", authHeader); // <-- log authHeader here

  if (!authHeader || !authHeader.startsWith("Bearer ")) {
    return res.status(401).json({ message: "No token provided" });
  }

  const token = authHeader.split(" ")[1];

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    console.log("Decoded JWT:", decoded); // <-- log decoded JWT here

    const user = await User.findById(decoded.id).select("-__v"); // fresh user from DB
    console.log("User from DB:", user); // <-- log user from DB here

    if (!user) {
      return res.status(401).json({ message: "User not found" });
    }

    req.user = user; // Attach full user object
    next();
  } catch (err) {
    return res.status(401).json({ message: "Invalid token" });
  }
};

module.exports = { authMiddleware };
