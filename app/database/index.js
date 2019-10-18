const pg = require('pg')
const queries = require('./queries.json')

const pool = new pg.Pool({
  database: 'enigma',
  host: 'localhost',
  password: 'hadi',
  port: 5432,
  user: 'admin'
})

pool.connect(err => {
  if (err) {
    console.log('\x1B[0;31m' + "[pg] couldn't connect" + '\x1B[0m')
    console.error(err)
  } else {
    console.log('\x1B[0;32m' + '[pg] connected' + '\x1B[0m')
  }
})

module.exports = {

  // Users
  getUsers: () => {
    return pool.query(queries.GET_USERS).then(res => {
      return res.rows
    })
  },

  getUserByID: id => {
    return pool.query(queries.GET_USER, [id]).then(res => {
      return { ...res.rows[0] }
    }).catch(() => {})
  },

  getUserByUsername: async (username = '') => {
    username = username.toLowerCase()
    const res = await pool.query(queries.GET_USER_BY_USERNAME, [username])
    return { ...res.rows[0] }
  },

  getUserData: id => {
    return pool.query(queries.GET_USER_DATA, [id]).then(res => {
      return { ...res.rows[0] }
    }).catch(() => {})
  },

  registerUser: ({ name, username = '', email, phoneNumber, password, gender, token }) => {
    username = username.toLowerCase()
    return pool.query(queries.ADD_USER, [name, username, email, phoneNumber, password, gender])
  },

  deleteUser: id => {
    return pool.query(queries.DELETE_USER, [id])
  },

  changeUserType: (id, type) => {
    return pool.query(queries.CHANGE_USER_TYPE, [id, +type])
  },

  changeUsersType: type => {
    return pool.query(queries.CHANGE_USERS_TYPE, [+type])
  },

  getScore: async id => {
    const res = await pool.query(queries.GET_USER_SUBMISSIONS, [id])
    return res.rows[0].score
  },

  // Challenges

  getChallenges: async id => {
    const res = await pool.query(queries.GET_CHALLENGES, [id])
    return res.rows
  },

  getChallenge: async id => {
    const res = await pool.query(queries.GET_CHALLENGE, [id])
    return res.rows[0]
  },

  addChallenge: async data => {
    const res = await pool.query(queries.ADD_CHALLENGE, [
      data.challenge.name,
      data.challenge.description,
      data.method.name,
      data.method.type,
      JSON.stringify(data.tests),
      JSON.stringify(data.params),
      data.challenge.score
    ])
    return res.insertId
  },

  deleteChallenge: id => {
    return pool.query(queries.DELETE_CHALLENGE, [id])
  },

  changeVisibilityForAll: type => {
    return pool.query(queries.CHANGE_CHALLENGES_TYPE, [+type])
  },

  changeVisibility: (id, type) => {
    return pool.query(queries.CHANGE_CHALLENGE_TYPE, [+type, id])
  },

  // Submissions

  //

  addSubmission: async ({
    player_id: playerID,
    challenge_id: challengeID,
    code,
    score,
    lang,
    is_solved: isSolved
  }) => {
    const args = [playerID, challengeID, code, score, lang, !!isSolved]
    const res = await pool.query(queries.UPDATE_SUBMISSION, args)
    if (res.rowCount === 0) {
      return pool.query(queries.ADD_SUBMISSION, args)
    }
    return res
  },

  getTokens: () => {
    return pool.query(queries.GET_TOKENS).then(res => res.rows)
  }
}
