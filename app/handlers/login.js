const { authenticate } = require('../passport')

module.exports = (req, res, next) => {
  authenticate('local', (err, user, info) => {
    if (err) {
      return next(err)
    }
    if (!user) {
      return res.redirect(303, '/login?message=' + info.message)
    }
    req.logIn(user, err => {
      if (err) {
        return next(err)
      }
      return res.redirect(303, '/')
    })
  })(req, res, next)
}
