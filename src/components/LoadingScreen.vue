<template lang="pug">
.LoadingScreen(:class="{hidden}")
  .brand ENIGMA
  .status
</template>

<script>
export default {
  name: 'LoadingScreen',
  props: ['hidden']
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="sass" scoped>
@import '@/assets/sass/_Color.sass'

.LoadingScreen
  background: $color-background
  position: fixed
  width: 100%
  height: 100%
  top: 0
  left: 0
  z-index: 1000
  display: flex
  align-items: center
  justify-content: center
  flex-direction: column
  user-select: none
  transition: opacity .2s ease-in-out, z-index 0s
  &.hidden
    opacity: 0
    z-index: -100
    transition: opacity .2s ease-in-out .3s, z-index 0s .6s
    pointer-events: none
  .brand
    font-size: 2.4rem
    font-weight: 700
  .status
    margin: 1.2rem
    position: relative
    width: 6px
    height: 6px
    border-radius: 50%
    background-color: rgba(#dee2e6, 1)
    animation: pulse .85s infinite ease-in-out
    animation-delay: -.1s
    &::before, &::after
      content: ''
      display: inline-block
      position: absolute
      top: 0
      width: 6px
      height: 6px
      border-radius: 50%
      background-color: rgba(#dee2e6, 1)
    &::before
      left: -1.8rem
      animation: pulse .85s infinite ease-in-out
      animation-delay: -.2s
    &::after
      left: 1.8rem
      animation: pulse .85s infinite ease-in-out
      animation-delay: 0s
    @keyframes pulse
      0%,100%,80%
        background-color: rgba(#dee2e6, .1)
        // transform: scale(.8)
      40%
        background-color: rgba(#dee2e6, 1)
        // transform: scale(1)
</style>
