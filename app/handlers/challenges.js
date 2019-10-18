const { getChallenges } = require('../database')

module.exports = (req, res, next) => {
  const id = req.user.id
  getChallenges(id).then(challenges => {
    res.json(challenges)
  })
}
