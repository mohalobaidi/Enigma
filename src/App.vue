<template lang="pug">
  #app
    Navbar
    transition(name="fade")
      router-view.view(:key="$route.fullPath")
</template>

<script>

export default {
  name: 'app'
}
</script>

<style lang="sass">
@import '@/assets/sass/main.sass'
#app
  height: calc(100% - 4.8rem)
  .view
    padding-top: 7.2rem
    min-height: calc(100% - 4.8rem)
</style>
