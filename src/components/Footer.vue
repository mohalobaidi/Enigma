<template lang="pug">
.Footer
  .container
    .logo
      | Made with
      span.red  <3
      | by TechBench — 2019
    .list
      .item Twitter
      .item Github
      .item.special Sign in
</template>

<script>
export default {
  name: 'Footer'
}
</script>

<style lang="sass">
.Footer
  height: 64px
  border-top: 1px solid rgba(#ffffff, .1)
  background: linear-gradient(to top, rgba(#ffffff, 0), rgba(#ffffff, .01))
  color: rgba(#ffffff, .7)
  font-weight: 500
  user-select: none
  .container
    height: 100%
    display: flex
    justify-content: space-between
    align-items: center
  .logo
    font-size: 14px
    .red
      color: #f03e3e
      padding: 0 6px
  .list
    display: grid
    grid-auto-flow: column
    grid-column-gap: 24px
    font-size: 12px
    .item
      cursor: pointer
      opacity: .7
      transition: opacity .2s ease-in-out, background .1s ease-in-out
      padding: 4px 12px
      border-radius: 4px
      &:hover
        opacity: 1
        background: rgba(#ffffff, .05)
      &.special
        color: #1098ad
</style>
