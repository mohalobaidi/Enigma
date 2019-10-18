const components = require.context('./', true, /\.vue$/)

export default Vue => {
  components.keys()
    .filter(d => d.match(/\.\/(\w+)\.vue/g))
    .map(d => components(d).default)
    .forEach(component => Vue.component(component.name, component))
}
