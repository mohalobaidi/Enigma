<template lang="pug">
  #app
    Navbar
    transition(name="fade")
      router-view.view(:key="$route.fullPath")
    Footer
</template>

<script>

export default {
  name: 'app',
  mounted () {
    this.$store.dispatch('fetchUser').then(res => {
      const meta = this.$router.history.meta
      if ((meta && meta.requiresAuth) || res.id) {
        this.$router.history.push(`/`)
      }
    })
  }
}
</script>

<style lang="sass">
@import '@/assets/sass/main.sass'
@import '@/assets/sass/_Misc.sass'
#app
  height: calc(100% - 6.4rem)
  .view
    padding-top: 7.2rem
    min-height: 100%
</style>
