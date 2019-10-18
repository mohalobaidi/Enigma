<template lang="pug">
.Navbar(:class="{collapsed}")
  .container
    router-link.brand(:to="'/'")
      Icon.back(:class="{showBack}") arrow_back_ios
      | ENIGMA
    .list
      //- hide from normal users
      router-link.item(v-for="route in routes" :to="route.link" :key="route.link")
        Icon {{ route.icon }}
        | {{ route.name }}
    .list
      //- TODO: add register and login button
      a.item(href="/logout")
        Icon power_settings_new
        | Logout
</template>

<script>
const routes = [
  {
    name: 'Challenges',
    icon: 'assignment',
    link: '/challenges'
  }, {
    name: 'Users',
    icon: 'people',
    link: '/users'
  }, {
    name: 'Tokens',
    icon: 'vpn_key',
    link: '/tokens'
  }, {
    name: 'Leaderboard',
    icon: 'show_chart',
    link: '/leaderboard'
  }, {
    name: 'Create',
    icon: 'add',
    link: '/create'
  }
]

export default {
  name: 'Navbar',
  data () {
    return {
      scrollTop: 0,
      routes
    }
  },
  computed: {
    collapsed () {
      return this.scrollTop > 64 || this.showBack
    },
    showBack () {
      return ['/', '/logout', '/login', '/register'].indexOf(this.$route.fullPath) === -1
    }
  },
  mounted () {
    window.addEventListener('scroll', () => {
      this.scrollTop = scrollY
    })
  }
}
</script>

<style lang="sass" scoped>
@import '@/assets/sass/_Color.sass'

.Navbar
  width: 100%
  z-index: 100
  top: 0
  position: fixed
  font-size: 1.2rem
  user-select: none
  transition: height .2s ease-in-out, background .2s ease-in-out, box-shadow .2s ease-in-out
  height: 7.2rem
  background-color: $color-background
  box-shadow: 0 0 .4rem rgba(0, 0, 0, 0)
  &.collapsed
    height: 4.8rem
    background-color: #101010
    box-shadow: 0 .1rem .2rem rgba(0, 0, 0, .5)
  .container
    height: 100%
    display: flex
  .back
    opacity: 0
    font-size: 1.8rem
    margin-left: -0.6rem
    margin-right: 0.6rem
    transition: opacity .2s ease-in-out, margin .2s ease-in-out
    &.showBack
      opacity: 1
      margin: 0
  .brand
    display: flex
    align-items: center
    padding-inline-end: 4.8rem
    font-size: 2.0rem
    font-weight: 700
    text-shadow: 0 .3rem .6rem rgba(23, 23, 23, .5)
    color: $color-initial
    direction: ltr
  .list
    display: flex
    text-shadow: 0 2px 4px rgba(23, 23, 23, 1)
    &:first-of-type
      flex: 1
    .item
      color: $color-initial
      display: flex
      align-items: center
      text-align: center
      padding: 0 1.2rem
      font-size: 1.3rem
      margin: 0
      opacity: .7
      transition: color .2s ease-in-out
      cursor: pointer
      &:hover
        opacity: 1
      &.selected
        font-weight: 500
        color: #fff
      .Icon
        line-height: inherit
        padding-inline-end: .8rem
        opacity: .7
</style>
