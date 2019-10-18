const array = (type, name, values) => {
  const isArray = type.indexOf('[]') !== -1
  const isString = type.indexOf('String') !== -1
  const isChar = type.indexOf('char') !== -1
  const arr = values.map(val => {
    val = val.trim()
    if (isArray) {
      return `{${val.slice(1, -1)}}`
    }
    const hasQoutes = val.length >= 2 && (val[0] === '"' || val[0] === "'")
    if (isString && !hasQoutes) {
      return `"${val}"`
    } if (isChar && !hasQoutes) {
      return `'${val}'`
    } else {
      return val
    }
  })
  return `${type}[] ${name} = {${arr.join(', ')}};`
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
    throw "Invalid challenge syntax ID: " + challenge.id;
  }

  const isArray = type.indexOf('Array') !== -1
  const isString = type.indexOf('String') !== -1

  return `import java.util.*; class Challenge_${challenge.id} {

  public static ${getType(type)} ${name} (${params.map(param => `${getType(param.type)} ${param.name}`).join(', ')}) {int System = 0;
${
  check(submission) ? submission
    : `isEmpty = true; return ${type === 'String' ? '""' : type === 'Boolean' ? 'false' : '0'};`
}
  }

  public static boolean isEmpty = false;

  public static void main (String[] args) {

      // Preventing user from printing
      java.io.PrintStream originalStream = System.out;
      java.io.PrintStream dummyStream = new java.io.PrintStream(new java.io.OutputStream () {
          public void write(int b) {
              // NO-OP
              // deduct point if user tried to print ;)
          }
      });

      ${tests.inputs.map((values, n) => array(getType(params[n].type), 'args' + n, values)).join('\n      ')}
      ${array(getType(type), 'outputs', tests.outputs)}
      boolean [] results = new boolean[outputs.length];
      
      for (int i = 0; i < results.length; i++) {
          System.setOut(dummyStream);
          try {
            ${getType(type)} res = ${name}(${params.map((_, i) => `args${i}[i]`).join(', ')});
            results[i] = ${isArray ? 'java.util.Arrays.equals(res, outputs[i])' : isString ? 'res.equals(outputs[i])' : 'res == outputs[i]'};
            System.setOut(originalStream);
            if (isEmpty) {
              if (i == 0)${''/* eslint-disable-next-line */}
                System.out.println("{\\"error\\":\\"test\\",\\"payload\\":{\\"message\\":\\"You didn\'t write anything!\\"}}");
              results[i] = false;
            }
            String resStr = ${isArray ? 'java.util.Arrays.toString(res)' : 'res + ""'};
            System.out.println("{\\"type\\":\\"test\\",\\"payload\\":{\\"test\\":"+i+",\\"result\\":\\""+resStr+"\\",\\"value\\":"+results[i]+"}}");
          } catch (Exception e) {
            System.setOut(originalStream);
            System.out.println("{\\"error\\":\\"test\\",\\"payload\\":{\\"message\\":\\""+e.toString()+"\\"}}");          
          }

      }
  }


}
`
}

const getSignature = challenge => {
  const { method_name: name, method_type: type } = challenge
  const params = JSON.parse(challenge.parameters)
  return `public static ${getType(type)} ${name} (${params.map(param => `${getType(param.type)} ${param.name}`).join(', ')})`
}

const check = submission => {
  const isEmpty = submission.replace(/\/\/.*\n/g, '').replace(/\/\*(.|\n)*?\*\//g, '').trim() === ''
  if (isEmpty) {
    return false
  }
  return true
}

module.exports = { generateSubmission, getSignature }
