<template lang="pug">
.Header
  h2  Welcome, {{ user.name }}
  h3 Your current score is
    span {{ user.score }}
    | points
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'Header',
  computed: { ...mapGetters(['user']) }
}
</script>

<style lang="sass" scoped>
// TODO: sepereate dark theme from structural style
.Header
  text-align: center
  padding: 64px 0
  h3
    color: rgba(#fff, .7)
    span
      color: #fff
      padding: 0 12px
</style>
