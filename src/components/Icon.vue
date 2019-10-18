<template lang="pug">
.Icon(@click="$emit('click', $event)")
  slot
</template>

<script>
export default {
  name: 'Icon'
}
</script>

<style lang="sass" scoped>
.Icon
  font-family: 'Material Icons'
  font-weight: normal
  font-style: normal
  display: inline-block
  line-height: 1
  text-transform: none
  letter-spacing: normal
  word-wrap: normal
  white-space: nowrap
  user-select: none

  /* Support for all WebKit browsers. */
  -webkit-font-smoothing: antialiased
  /* Support for Safari and Chrome. */
  text-rendering: optimizeLegibility

  /* Support for Firefox. */
  -moz-osx-font-smoothing: grayscale

  /* Support for IE. */
  font-feature-settings: 'liga'
</style>
