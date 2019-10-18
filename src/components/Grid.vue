<template lang="pug">
transition-group.Grid(:style="style" tag="div")
  slot
</template>

<script>
export default {
  name: 'Grid',
  props: ['cols', 'rows'],
  computed: {
    style () {
      let style = '--cols:' + (this.cols || 6)
      if (this.rows) {
        style += `;grid-template-rows: repeat(${this.rows}, 1fr)`
      }
      return style
    }
  }
}
</script>

<style lang="sass" scoped>
.Grid
  display: grid
  grid-template-columns: repeat(var(--cols), 1fr)
  grid-column-gap: 24px
  grid-row-gap: 24px
  @media (max-width: 80.0rem)
    grid-template-columns: repeat(3, 1fr)
  @media (max-width: 60.0rem)
    grid-template-columns: repeat(2, 1fr)
  @media (max-width: 40.0rem)
    grid-template-columns: repeat(1, 1fr)
</style>
