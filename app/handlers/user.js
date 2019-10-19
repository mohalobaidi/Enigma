const { getUserByID, getScore } = require('../database')

module.exports = (req, res, next) => {
  if (req.user) {
    const id = req.user.id
    getUserByID(id).then(async user => {
      delete user.password
      const score = await getScore(id)
      res.json({ id, ...user, score })
    })
  } else {
    res.json({})
  }
}
