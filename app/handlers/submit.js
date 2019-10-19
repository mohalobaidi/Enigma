const fs = require('fs')
const path = require('path')
const { createFolder, generateSubmission, getExtension, compile } = require('../utils')

const database = require('../database')

module.exports = (req, res, next) => {
  const Joi = require('joi')
  const data = req.body
  const schema = Joi.object().keys({
    id: Joi.number().required(),
    lang: Joi.valid('String', ['java', 'python']).required(),
    submission: Joi.string().required()
  })
  Joi.validate(data, schema, async (err, value) => {
    if (err) {
      console.error('\x1B[0;31m[ERR] Invalid submission at "./handlers/submit.js:17"\x1B[0m')
      res.status(422).json({
        status: 'error',
        message: 'Invalid request data',
        data: data
      })
    } else {
      const userID = req.user.id
      const { id, lang, submission } = value
      const challenge = await database.getChallenge(id)
      const usersFolderDirectory = path.join(__dirname, '../users')
      await createFolder(usersFolderDirectory)

      const userFolderDirectory = path.join(
        usersFolderDirectory,
        `${req.user.id}`
      )
      await createFolder(userFolderDirectory)

      const submissionFileDirectory = path.join(
        userFolderDirectory,
        `/Challenge_${challenge.id}.${getExtension(lang)}`
      )
      try {
        await fs.writeFileSync(
          submissionFileDirectory,
          generateSubmission(lang, challenge, submission)
        )
      } catch (err) {
        console.error('\x1B[0;31m[err] Couldn\'t write a submission file "./handlers/submit.js:46"\x1B[0m')
        console.log(err)
        res.json({ error: 'Unexpected Error...', code: 1 })
      }

      const { response, code } = await compile(
        lang,
        submissionFileDirectory
      ).catch(err => {
        console.error('\x1B[0;31m[ERR] Couldn\'t compile a submission "./handlers/submit.js:55"\x1B[0m')
        console.log(err)
      })
      const trimmedResponse = (r => r.slice(r.indexOf('{'), r.lastIndexOf('}') + 1) || '{}')(response).trim()
      if (code === 0) {
        let results
        try {
          results = JSON.parse(
            '[' + `${trimmedResponse}`.replace(/\n/g, ',') + ']'
          )
        } catch (e) {
          console.error('\x1B[0;31m[ERR] Couldn\'t parse submission results "./handlers/submit.js:65"\x1B[0m')
          console.log(trimmedResponse)
          res.json({ error: 'Unexpected Error...###ERROR###' + e + '\n\n' + trimmedResponse, code: 1 })
        }
        const score = results.filter(result => result.payload.value).length
        await database.addSubmission({
          player_id: userID,
          challenge_id: challenge.id,
          code: submission,
          is_solved: challenge.points <= score,
          score,
          lang
        })
        res.json({ results, code })
      } else if (code === 1) {
        res.json({ error: response.replace(/\/.*\//g, ''), code })
      }
    }
  })
}
