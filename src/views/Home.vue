<template lang="pug">
//- TODO: WRITE A REAL TODO, or just fix the code.
#Home
  .container
    Header
    transition-group(name="fade")
      Pane(title="All Challenges" v-if="!this.challenges.length" :key="0")
        Grid(:cols="4")
          ChallengeCardPlaceholder( v-for="(_, i) in new Array(8)" :key="i")
      Pane(title="Continue Solving" v-if="inProgressChallenges.length" :key="1")
        Grid(:cols="4")
          ChallengeCard( v-for="(challenge, i) in inProgressChallenges" :key="i" v-bind="challenge")
      Pane(title="All Challenges" v-if="newChallenges.length" :key="2")
        Grid(:cols="4")
          ChallengeCard( v-for="(challenge, i) in newChallenges" :key="i" v-bind="challenge")
      Pane(title="Solved Challenges" v-if="solvedChallenges.length" :key="3")
        Grid(:cols="4")
          ChallengeCard( v-for="(challenge, i) in solvedChallenges" :key="i" v-bind="challenge")
</template>

<script>
import { mapGetters } from 'vuex'

// TODO: WRITE A REAL TODO, or just fix the code.
export default {
  name: 'Home',
  computed: {
    ...mapGetters(['challenges', 'user']),
    inProgressChallenges () {
      return this.challenges.slice(0, 3) || []
    },
    newChallenges () {
      return this.challenges.slice(3) || []
    },
    solvedChallenges () {
      return this.challenges.slice(0, 6) || []
    }
  },
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
