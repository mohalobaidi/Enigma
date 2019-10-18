
<template lang="pug">
.Editor
  textarea
</template>

<script>
// TODO: get light mode
import CodeMirror from 'codemirror'
import 'codemirror/lib/codemirror.css'
import 'codemirror/theme/monokai.css'
import 'codemirror/mode/clike/clike'
import 'codemirror/mode/python/python'

export default {
  name: 'Editor',
  props: ['value'],
  data () {
    return {
      canChange: false
    }
  },
  watch: {
    value (val) {
      this.setValue(val)
    }
  },
  methods: {
    setValue (val) {
      this.canChange = true
      if (val !== this.editor.getDoc().getValue()) {
        this.editor.getDoc().setValue(val)
      }
      this.canChange = false
    }
  },
  mounted () {
    const textarea = this.$el.getElementsByTagName('textarea')[0]
    this.editor = CodeMirror.fromTextArea(textarea, {
      mode: this.$route.params.lang === 'python' ? 'python' : 'text/x-java',
      theme: 'monokai',
      lineNumbers: true,
      indentUnit: 4,
      spellcheck: true,
      indentWithTabs: true,
      autoCloseBrackets: true
    })
    this.editor.setSize('100%', '100%')
    this.setValue(this.value)
    this.editor.on('beforeChange', (cm, change) => {
      if (this.canChange) {
        return true
      }
      const readOnlyLines = [0, 1, 2, cm.doc.size - 3, cm.doc.size - 2, cm.doc.size - 1]
      if (change.to.line === cm.doc.size - 3 && change.to.ch === 0) {
        change.cancel()
      }
      if (~readOnlyLines.indexOf(change.from.line)) {
        change.cancel()
      }
    })
    this.editor.on('change', cm => {
      this.$emit('update:value', cm.getValue())
    })
  }
}
</script>

<style lang="sass">
// TODO: sepereate dark theme from structural style
.Editor
  height: 100%
  width: 100%
  padding: 32px 0 0
  box-shadow: inset 29px 0 0 #363636, inset 30px 0 0 #484848
  .CodeMirror
    flex: 1
    background: transparent
    &-scroll
    &-linenumbers
      background: #363636
      border-right: 1px solid #484848
</style>
