const express = require('express')
const router = express.Router()

// TODO: ADD HANDLERS
// const routes = (get = [], post = [], striction) => {
//   get = get.map(route => ({route, type: 'get'}))
//   post = post.map(route => ({route, type: 'post'}))
//   striction = striction || ((req, res, next) => next())

//   ([...get, ...post]).forEach(({ route, type }) => {
//     const name = route.split('/')[0]
//     const handler = require(`./handlers/${name}`)
//     router[type](`/api/${route}`, striction, handler)
//   })
// }

// const authenticatedUser = (get, post) => {
//   const striction = (req, res, next) => {
//     /* FOR DEVELOPMENT */ if (global.USER) req.user = global.USER
//     if (req.user) {
//       next()
//     } else {
//       res.status(401).json({ error: 'Not logged in!' })
//     }
//   }
//   return routes(get, post, striction)
// }

// const adminUser = (get, post) => {
//   const striction = (req, res, next) => {
//     /* FOR DEVELOPMENT */ if (global.USER) req.user = global.USER
//     if (req.user && req.user.type === 0) {
//       next()
//     } else {
//       res.status(401).json({ error: 'Not admin!' })
//     }
//   }
//   return routes(get, post, striction)
// }

// router.post('/login', (req, res, next) => {
//   passport.authenticate('local', (err, user, info) => {
//     if (err) {
//       return next(err)
//     }
//     if (!user) {
//       return res.redirect(303, '/login?message=' + info.message)
//     }
//     req.logIn(user, err => {
//       if (err) {
//         return next(err)
//       }
//       return res.redirect(303, '/')
//     })
//   })(req, res, next)
// })

// router.get('/logout', (req, res) => {
//   if (req.logout) {
//     req.logout()
//   }
//   res.redirect('/')
// })

// router.post('/register', require('./handlers'))

// routes(['user'])

// authenticatedUser(['challenges','challenge/:id'], ['submit'])

// adminUser([
//   'users', 'tokens'
// ], [
//   'changeUserType', 'changeUsersType','deleteUser',
//   'addChallenge', 'deleteChallenge',
//   'changeVisibility', 'changeVisibilityForAll'
// ])

module.exports = router
