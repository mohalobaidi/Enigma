<template lang="pug">
.ChallengeCard(:class="id == 10 ? 'solved' : ''")
  .content
    .level Beginner
    .title {{ name }}
    .description(:alt="description") {{ description.replace(/\\n/g, ' ') }}
  .footer
    //- TODO: remove placeholder
    .text 10 Students are working on this
    //- TODO: do this
    .button
</template>

<script>

export default {
  name: 'ChallengeCard',
  props: ['id', 'name', 'description']
}

</script>

<style lang="sass" scoped>
// TODO: sepereate dark theme from structural style
.ChallengeCard
  width: 100%
  max-height: 220px
  padding: 1.6rem 2.4rem
  display: flex
  flex-direction: column
  user-select: none
  border-radius: 6px
  background-color: rgba(#ffffff, .05)
  box-shadow: 0 4px 4px rgba(#000000, .2)
  .content
    flex: 1
    overflow: hidden
    mask-image: linear-gradient(to top, rgba(black, 0) .1rem, black 1.8rem)
    .level
      font-size: 1.2rem
      font-weight: 400
      color: rgba(#ffffff, .7)
    .title
      padding: 1.2rem 0
      font-size: 1.8rem
      font-weight: 500
      color: #ffffff
    .description
      font-size: 1.2rem
      font-weight: 400
      color: rgba(#ffffff, .7)
  .footer
    margin-top: .4rem
    padding-top: 1.6rem
    display: flex
    align-items: center
    justify-content: space-between
    border-top: 1px solid rgba(#ffffff, .1)
    .text
      font-size: 1.0rem
      color: rgba(#ffffff, .7)
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
        content: 'Go Solve'
      &:hover
        background: rgba(#868e96, .1)
        border-color: #868e96
        box-shadow: 0 1px 2px rgba(#000000, .2)
  &.solved
    background-color: rgba(#00E676, .08)
    .button
      color: #8ce99a
      pointer-events: none
      &::after
        content: 'Challenge Solved'
</style>
