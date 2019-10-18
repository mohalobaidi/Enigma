const express = require('express')
const bodyParser = require('body-parser')
const session = require('express-session')
const history = require('connect-history-api-fallback')
const logger = require('morgan')
const cors = require('cors')
const Routes = require('./routes')

const app = express()

// FOR DEVELOPMENT
if (process.argv[2] === 'dev') {
  // Logger middleware.
  app.use(logger('dev'))

  // Login with id 1 - or a specified id.
  global.USER = { id: +process.argv[3] || 1 }
  console.log('[DEV] logged in with id ' + global.USER.id)
}

// Parse res.body to JSON.
app.use(bodyParser.json())

// Use a simple parsing algorithm for shallow parsing.
app.use(bodyParser.urlencoded({ extended: false }))

// Provides a fallback for non-existing directories - except "/logout".
app.use(history({
  rewrites: [{ from: '/logout$', to: '/logout' }]
}))

// Serve the Vue app and all static files within it.
app.use('/', express.static('./dist'))

// Save and maintain user/client sessions.
app.use(
  session({
    secret: '6NwMtfKpv7OZyUdAlkZ6',
    resave: false,
    saveUninitialized: false
  })
)

// TODO: ADD DATABASE
// // Initialize Passport (authentication middleware).
// app.use(passport.initialize())

// // Remove user session id with USER object - that includes all user's info.
// app.use(passport.session())

// Ignore CORS
app.use(cors())

// Serve RESTful API - by overrideing the previous app.use('/') with "Routes".
app.use('/', Routes)

// Get our app's port from environment variables - use 3000 if not available.
const port = process.env.PORT || 3000

// Start the app by listening to a specified port.
app.listen(port, () => {
  console.log('\x1B[0;36m' + `[URL] http://localhost:${port}` + '\x1B[0m')
})
