const crypto = require('crypto')
const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy
const database = require('./database')

passport.serializeUser(function (user, done) {
  done(null, user.id)
})

passport.deserializeUser((id, done) => {
  database.getUserByID(id).then(res => {
    done(null, { id, username: res.username, type: res.type })
  /* eslint-disable-next-line */
  }).catch(err => {
    done({})
  })
})

passport.use('local', new LocalStrategy((username, password, done) => {
  const hashed = crypto.createHash('sha256').update(password).digest('base64')
  const user = username.trim().toLowerCase()
  database.getUserByUsername(user).then(res => {
    console.log("HERE!!!")
    if (hashed !== res.password) {
      return done(null, false, {
        message: 'You have entered an invalid username or password.'
      })
    }
    return done(null, { id: res.id, username: user })
  /* eslint-disable-next-line */
  }).catch(err => {
    console.log('\x1B[0;31m' + `[ERR] Unexpected error caught in "./passport.js:31"` + '\x1B[0m')
    done(null, false, {
      message: 'Failed to connect to the server.'
    })
  })
}))

module.exports = passport
