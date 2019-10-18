const { getChallenge } = require('../database')

const { getSignatures } = require('../utils')

module.exports = (req, res, next) => {
  const { id } = req.params
  getChallenge(id).then(challenge => {
    res.json({ ...challenge, signatures: getSignatures(challenge) })
  })
}
