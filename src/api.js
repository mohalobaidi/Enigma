import axios from 'axios'

// TODO: CHECK YOUR CODE
const api = axios.create({
  baseURL: 'http://localhost:3000/api',
  // baseURL: '/api',
  headers: {
    'Content-Type': 'application/json'
  }
})

export default {
  getTokens () {
    return api('/tokens')
  },
  getUser () {
    return api('/user')
  },
  getUsers () {
    return api('/users')
  },
  changeUserType (id, type) {
    return api.post('/changeUserType', { id, type })
  },
  changeUsersType (type) {
    return api.post('/changeUsersType', { type })
  },
  getChallenges () {
    return api('/challenges')
  },
  getChallenge (id) {
    return api(`/challenge/${id}`)
  },
  addChallenge (data) {
    return api.post('/addChallenge', data)
  },
  login (data) {
    return api.post('/login', data)
  },
  changeVisibility (id, type) {
    return api.post('/changeVisibility', { id, type })
  },
  changeVisibilityForAll (visibility) {
    return api.post('/changeVisibilityForAll', { visibility })
  },
  deleteUser (id) {
    return api.post('/deleteUser', { id })
  },
  deleteChallenge (id) {
    return api.post('/deleteChallenge', { id })
  },
  submit (id, lang, challenge, submission, tests) {
    return api.post('/submit', { id, lang, submission }).then(res => {
      const { error, results, code } = res.data
      if (code === 0) {
        const payload = results.map(({ type, payload }) => {
          switch (type) {
            case 'test':
              const { method_name: method, method_type: outputType } = challenge
              const parameters = JSON.parse(challenge.parameters)
              const { test, result, value } = payload
              const $ = (type, val) => {
                const isArray = type.indexOf('Array') !== -1
                const isString = type.indexOf('String') !== -1
                const isChar = type.indexOf('Char') !== -1
                const hasQoutes = val.length >= 2 && (val[0] === '"' || val[0] === "'")
                if (isArray) {
                  return `<span class="${type}">${val}</span>`
                } else if (isString && !hasQoutes) {
                  return `<span class="${type}">"${val}"</span>`
                } else if (isChar && !hasQoutes) {
                  return `<span class="${type}">'${val}'</span>`
                }
                return `<span class="${type}">${val}</span>`
              }

              const args = tests.inputs.map((v, i) => {
                const type = parameters[i].type
                return $(type, v[test])
              })

              const out = (val) => $(outputType, val)

              if (value) {
                return {
                  type: 'correct',
                  message: `${method}(${args.join(', ')}) <i>returns</i> ${out(result)}`
                }
              } else {
                return {
                  type: 'wrong',
                  message: `${method}(${args.join(', ')}) <i>should return</i> ${out(tests.outputs[test])} <i>but it returns</i> ${out(result)}`
                }
              }
            default:
              return {
                message: payload.message,
                type: 'warning'
              }
          }
        })
        return { code, payload }
      }
      if (code === 1) {
        return { code, payload: error }
      }
    })
  }
}
