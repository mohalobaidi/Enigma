<template lang="pug">
.Alert(:class="type")
  Icon {{type === 'error' ? 'highlight_off' : type === 'success' ? 'check' : 'info_outline'}}
  slot
</template>

<script>
export default {
  name: 'Alert',
  props: ['type']
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="sass" scoped>
.Alert
  width: 100%
  height: 4.8rem
  display: flex
  align-items: center
  padding: 0 1.2rem
  margin-bottom: 2.4rem
  background: rgba(#1c7ed6, .1)
  border: 1px solid rgba(#339af0, .3)
  border-radius: .4rem
  font-size: 1.6rem
  .Icon
    color: #339af0
    font-size: 2.4rem
    margin-right: 1.2rem
  &.error
    background: rgba(#c92a2a, .1)
    border: 1px solid rgba(#f03e3e, .5)
    .Icon
      color: #f03e3e
  &.success
    background: rgba(#37b24d, .1)
    border: 1px solid rgba(#51cf66, .3)
    .Icon
      color: #51cf66
</style>
