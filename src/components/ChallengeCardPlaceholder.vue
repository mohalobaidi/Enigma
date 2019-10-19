<template lang="pug">
.ChallengeCardPlaceholder(:class="id == 10 ? 'solved' : ''")
  .content.animated-background
    .level
    .title
    .description
      .line
      .line
      .line
      .line
  .footer
    .text
    .button
</template>

<script>

export default {
  name: 'ChallengeCardPlaceholder',
  props: ['id', 'name', 'description'],
  methods: {
    solveWith (lang) {
      this.$router.history.push(`solve/${lang}/${this.id}`)
    }
  }
}

</script>

<style lang="sass" scoped>
// TODO: sepereate dark theme from structural style
.ChallengeCardPlaceholder
  width: 100%
  height: 220px
  padding: 1.6rem 2.4rem
  display: flex
  flex-direction: column
  user-select: none
  border-radius: 6px
  background-color: rgba(#ffffff, .05)
  box-shadow: 0 4px 4px rgba(#000000, .2)
  pointer-events: none
  .content
    flex: 1
    overflow: hidden
    mask-image: linear-gradient(to top, rgba(black, 0) .1rem, black 1.8rem)
    .level
      height: .6rem
      width: 5.4rem
      border-radius: .4rem
      font-weight: 400
      background-color: rgba(#ffffff, .1)
      animation: placeHolderShimmer 1.5s linear infinite
    .title
      margin: 1.2rem 0
      height: 1.0rem
      width: 12.8rem
      border-radius: .6rem
      font-weight: 400
      background-color: rgba(#ffffff, .3)
      animation: placeHolderShimmer 1.5s linear infinite
      animation-delay: .1s
    .description
      padding: .1rem 0
      font-weight: 400
      color: rgba(#ffffff, .7)
      .line
        margin: 1.2rem 0
        height: .6rem
        border-radius: .4rem
        font-weight: 400
        background-color: rgba(#ffffff, .2)
        animation: placeHolderShimmer 1.5s linear infinite
        &:nth-of-type(1)
          width: 85%
          animation-delay: .2s
        &:nth-of-type(2)
          width: 95%
          animation-delay: .3s
        &:nth-of-type(3)
          width: 90%
          animation-delay: .4s
        &:nth-of-type(4)
          width: 35%
          animation-delay: .5s

  .footer
    margin-top: .4rem
    padding-top: 1.6rem
    display: flex
    align-items: center
    justify-content: space-between
    border-top: 1px solid rgba(#ffffff, .1)
    .text
      height: .6rem
      width: 9.6rem
      border-radius: .4rem
      font-weight: 400
      background-color: rgba(#ffffff, .3)
      animation: placeHolderShimmer 1.5s linear infinite
      animation-delay: .6s
    .button
      padding: .8rem 1.6rem
      margin: 0
      font-size: 1.3rem
      line-height: inherit
      text-transform: capitalize
      color: #66d9e8
      background-color: transparent
      border-color: #495057
      box-shadow: 0 1px 2px rgba(#000000, 0)
      transition-property: background, border, box-shadow
      transition-duration: .1s
      transition-timing-function: ease-in-out
      &:after
        content: ''
        display: block
        margin: .8rem 0
        height: .6rem
        width: 4.8rem
        border-radius: .4rem
        font-weight: 400
        background-color: rgba(#66d9e8, .5)
        animation: placeHolderShimmer 1.5s linear infinite
        animation-delay: .7s
      &:hover
        background: rgba(#868e96, .1)
        border-color: #868e96
        box-shadow: 0 1px 2px rgba(#000000, .2)
  @keyframes placeHolderShimmer
    0%
      background-image: linear-gradient(to right, rgba(#ffffff, 0) 18%, rgba(#ffffff, .1) 28%, rgba(#ffffff, 0) 33%)
      background-size: 80rem 80rem
      background-position: -40rem center
    100%
      background-image: linear-gradient(to right, rgba(#ffffff, 0) 18%, rgba(#ffffff, .1) 28%, rgba(#ffffff, 0) 33%)
      background-size: 80rem 80rem
      background-position: 40rem center
</style>
