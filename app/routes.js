const express = require('express')
const router = express.Router()

// TODO: ADD HANDLERS
const routes = (get = [], post = [], striction) => {
  get = get.map(route => ({ route, type: 'get' }))
  post = post.map(route => ({ route, type: 'post' }));

  [...get, ...post].forEach(({ route, type }) => {
    const name = route.split('/')[0]
    const handler = require(`./handlers/${name}`)
    if (striction) {
      router[type](`/api/${route}`, striction, handler)
    } else {
      router[type](`/api/${route}`, handler)
    }
  })
}

const authenticatedUser = (get, post) => {
  const striction = (req, res, next) => {
    if (global.USER) { // FOR DEVELOPMENT
      req.user = global.USER
    }
    if (req.user) {
      next()
    } else {
      res.status(401).json({ error: 'Not logged in!' })
    }
  }
  return routes(get, post, striction)
}

const adminUser = (get, post) => {
  const striction = (req, res, next) => {
    if (global.USER) {
      req.user = global.USER
    }
    if (req.user && req.user.type === 0) {
      next()
    } else {
      res.status(401).json({ error: 'Not admin!' })
    }
  }
  return routes(get, post, striction)
}

router.post('/login', require('./handlers/login'))
router.post('/login', require('./handlers/logout'))
router.post('/register', require('./handlers/register'))

routes(['user'])

authenticatedUser(['challenges']/* ['challenges','challenge/:id'], ['submit'] */)

adminUser(/* [
  'users', 'tokens'
], [
  'changeUserType', 'changeUsersType','deleteUser',
  'addChallenge', 'deleteChallenge',
  'changeVisibility', 'changeVisibilityForAll'
] */)

module.exports = router
