module.exports = (req, res) => {
  console.log('test')
  if (req.logout) {
    req.logout()
  }
  res.redirect('/')
}
