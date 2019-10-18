<template lang="pug">
.Pane
  .header
    .title {{title || 'Pane Title'}}
  .wrapper
    slot
</template>

<script>
export default {
  name: 'Pane',
  props: ['title']
}
</script>

<style lang="sass" scoped>
.Pane
  margin: 2.4rem 0 7.2rem
  min-height: 5.6rem
  .header
    .title
      font-size: 2.4rem
      white-space: nowrap
      overflow: hidden
      text-overflow: ellipsis
    .Icon
      opacity: .7
  .wrapper
    margin: 2.4rem 0
</style>
