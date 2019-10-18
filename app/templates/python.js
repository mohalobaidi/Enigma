const array = (type, name, values) => {
  const isArray = type.indexOf('[]') !== -1
  const isString = type.indexOf('String') !== -1
  const isChar = type.indexOf('char') !== -1
  const arr = values.map(val => {
    val = val.trim()
    if (isArray) {
      return `[${val.slice(1, -1)}]`
    }
    const hasQoutes = val.length >= 2 && (val[0] === '"' || val[0] === "'")
    if (isString && !hasQoutes) {
      return `"${val}"`
    } else if (isChar && !hasQoutes) {
      return `'${val}'`
    } else {
      return val
    }
  })
  return `${name} = [${arr.join(', ')}]`
}

const getType = type => {
  switch (type) {
    case 'String': return 'String'
    case 'Integer': return 'int'
    case 'Double': return 'double'
    case 'Boolean': return 'boolean'
    case 'Char': return 'char'
    case 'String Array': return 'String[]'
    case 'Integer Array': return 'int[]'
    case 'Double Array': return 'double[]'
    case 'Boolean Array': return 'boolean[]'
    case 'Char Array': return 'char[]'
  }
}

const generateSubmission = (challenge, submission) => {
  const { method_name: name, method_type: type } = challenge
  let params, tests

  try {
    params = JSON.parse(challenge.parameters)
    tests = JSON.parse(challenge.tests)
  } catch (e) {
    /* eslint-disable-next-line */
    throw `Invalid challenge syntax ID: ${challenge.id}`
  }

  return `# ${name}.py


def ${name} (${params.map(param => param.name).join(', ')}):
${
  check(submission) ? submission.split('\n').map(s => s[0] === '\t' ? s : '\t' + s).join('\n') || ''
    : '\treturn None\nprint("{\\"error\\":\\"test\\",\\"payload\\":{\\"message\\":\\"You didn\'t write anything!\\"}}")'
}
#### please write above this line ####

error = "Please return something before submitting your code."

${tests.inputs.map((values, n) => array(getType(params[n].type), 'args' + n, values)).join('\n')}
${array(getType(type), 'outputs', tests.outputs)}
results = []

for i in range(len(outputs)):
  res = ${name}(${params.map((_, i) => `args${i}[i]`).join(', ')})
  results.append(res == outputs[i])
  if (res == None):
    res = ${type === 'String' ? '""' : '0'}
  print("{\\"type\\":\\"test\\",\\"payload\\":{\\"test\\":"+str(i)+",\\"result\\":\\""+str(res)+"\\",\\"value\\":"+str(results[i]).lower()+"} }")
`
}

const getSignature = challenge => {
  const { method_name: name } = challenge
  const params = JSON.parse(challenge.parameters)
  return `def ${name} (${params.map(param => param.name).join(', ')})`
}

const check = submission => {
  const isEmpty = submission.replace(/#.*\n/g, '').replace(/"""(.|\n)*?"""/g, '').trim() === ''
  if (isEmpty) {
    return false
  }
  return true
}

module.exports = { generateSubmission, getSignature }
