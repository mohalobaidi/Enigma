<template lang="pug">
//- TODO: WRITE A REAL TODO, or just fix the code.
#Home
  .container
    Header
    Pane(title="Continue Solving")
      Grid(:cols="4")
        ChallengeCard( v-for="(challenge, i) in challenges.slice(0, 3)" :key="i" v-bind="challenge")
    Pane(title="All Challenges")
      Grid(:cols="4")
        ChallengeCard( v-for="(challenge, i) in challenges.slice(3)" :key="i" v-bind="challenge")
    Pane(title="Solved Challenges")
      Grid(:cols="4")
        ChallengeCard( v-for="(challenge, i) in challenges.slice(0, 6)" :key="i" v-bind="challenge")
</template>

<script>
import { mapGetters } from 'vuex'

// TODO: WRITE A REAL TODO, or just fix the code.
export default {
  name: 'Home',
  computed: { ...mapGetters(['challenges', 'user']) },
  mounted () {
    this.$store.dispatch('fetchChallenges')
    this.$store.dispatch('fetchUser')
  }
}
</script>

<style lang="sass" scoped>
#Home
  .container
    padding: 6.4rem 3.6rem
</style>
