// You can use this for advanced error handling
const errorMiddleware = (err, req, res, next) => {
  console.error('Error:', err);
  res.status(err.status || 500).json({ message: err.message || 'Something went wrong' });
};

module.exports = { errorMiddleware };