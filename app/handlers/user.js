const { getUserByID, getScore } = require('../database')

module.exports = (req, res, next) => {
  if (req.user) {
    const id = req.user.id
    getUserByID(id).then(async user => {
      delete user.password
      const score = getScore(id)
      console.log('test')
      res.json({ id, ...user, score })
    })
  } else {
    console.log('test')
    res.json({id: 1})
  }
}
