module.exports = (req, res) => {
  if (req.logout) {
    req.logout()
  }
  res.redirect('/')
}
