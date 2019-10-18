const Joi = require('joi')
const crypto = require('crypto')
const { getUserByUsername, registerUser } = require('../database')

module.exports = (req, res, next) => {
  const schema = Joi.object().keys({
    name: Joi.string()
      .required()
      .regex(/^[a-z\d\s\-.,']*$/i)
      .min(4)
      .max(25)
      .error(err => {
        switch (err[0].type) {
          case 'string.min': return 'Full name should be 4 letters or longer.'
          case 'string.max': return 'Full name should not be longer than 25 letters'
          case 'string.regex.base': return 'Full name should only contain letters'
          default: return 'Full name is required'
        }
      }),
    email: Joi.string()
      .email()
      .required()
      /* eslint-disable-next-line */
      .error(err => 'Email is required.'),
    phoneNumber: Joi.string()
      .regex(/^[a-z\d\s\-.,']*$/i)
      .min(9)
      .max(21)
      .required()
      /* eslint-disable-next-line */
      .error(err => 'Phone number is required.'),
    username: Joi.string()
      .required()
      .alphanum()
      .min(4)
      .max(16)
      .error(err => {
        switch (err[0].type) {
          case 'string.min': return 'Username should be longer than 4 letters'
          case 'string.max': return 'Username should not be longer than 16 letters'
          case 'string.alphanum': return 'Username should only contain letters and numbers'
          default: return 'Username is required'
        }
      }),
    gender: Joi.valid('String', ['male', 'female'])
      .required()
      /* eslint-disable-next-line */
      .error(err => 'Gender is required.'),
    password: Joi.string()
      .required()
      .min(8)
      .max(32)
      .regex(/^[A-Za-z\d@$!%*#?&()-]*$/i)
      .error(err => {
        switch (err[0].type) {
          case 'string.min': return 'Password should be longer than 8 characters'
          case 'string.max': return 'Password should not be longer than 32 characters'
          case 'string.regex.base': return 'Password should not contain invalid special characters'
          default: return 'Password is required'
        }
      }),
    verifyPassword: Joi.string()
      .valid(Joi.ref('password'))
      .required()
      .error(err => {
        switch (err[0].type) {
          case 'any.empty': return 'Password verification is required'
          case 'any.allowOnly': return 'Password and Password verification does not match'
          default: return err[0].type
        }
      }),
    token: Joi.string()
      .required()
      .min(32)
      .max(32)
      .error(err => {
        switch (err[0].type) {
          case 'string.min':
          case 'string.max': return 'Token has to be exactly 32 characters long'
          default: return 'Token is required'
        }
      })
  })

  Joi.validate(req.body, schema, async (err, value) => {
    if (err) {
      res.redirect(303, '/register?type=error&message=' + err.details[0].message)
    } else {
      const { name, email, phoneNumber, username, password, gender, token } = value
      const hashedPassword = crypto.createHash('sha256').update(password).digest('base64')
      getUserByUsername(username).then(async user => {
        if (user.id) {
          res.redirect(303, '/register?type=error&message=Username is already taken')
        } else {
          const result = await registerUser({
            name,
            email,
            phoneNumber,
            username,
            password: hashedPassword,
            gender: gender === 'male',
            token
          })
          if (result.rowCount === 0) {
            res.redirect(303, '/register?type=error&message=Token is already used!')
          } else {
            res.redirect(303, '/register?type=success&message=You have been registered!')
          }
        }
      /* eslint-disable-next-line */
      }).catch(err => {
        console.log('\x1B[0;31m' + `[ERR] Unexpected error caught in "./handlers/register.js:103"` + '\x1B[0m')
        res.redirect(303, '/register?type=error&message=Failed to connect to the server.')
      })
    }
  })
}
