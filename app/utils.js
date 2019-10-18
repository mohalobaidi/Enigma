const fs = require('fs')
const path = require('path')
const { spawn } = require('child_process')

module.exports = {
  createFolder: async dir => {
    try {
      fs.statSync(dir)
    } catch (e) {
      fs.mkdirSync(dir)
    }
  },

  generateSubmission: (lang, ...args) => {
    return require(`./templates/${lang}`).generateSubmission(...args)
  },

  getExtension: lang => {
    switch (lang) {
      case 'java': return 'java'
      case 'python': return 'py'
    }
  },

  getSignatures: challenge => {
    return {
      java: `${require('./templates/java').getSignature(challenge)}`,
      python: `${require('./templates/python').getSignature(challenge)}`
    }
  },

  compile: (lang, file) => {
    switch (lang) {
      case 'java':
        return process('javac', [file])
          .then(res => {
            const dir = path.join(
              file.split('/').slice(0, -1).join('/')
            )
            const fileName = file.split('/').pop().split('.')[0]
            return process('java', ['-cp', dir, fileName])
          })
      case 'python':
        return process('python', [file])
    }
  }
}

const process = async (command, args) => {
  const ls = spawn(command, args)

  return new Promise((resolve, reject) => {
    let response = []

    ls.stdout.on('data', d => (response += d))

    ls.stderr.on('data', d => (response += d))

    ls.on('close', code => {
      resolve({ response, code })
    })
  })
}
