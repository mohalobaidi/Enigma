<template lang="pug">
#Login
  .container
    header
      h1 Login
    form(action="login" method="POST").row
      .column.column-33.column-offset-33.column-sm-50.column-sm-offset-25.column-xs-80.column-xs-offset-10
        Alert(v-if="error" type="error") {{ error }}
        label username
        input(type="text" name="username")
        br
        br
        label password
        input(type="password" name="password")
        br
        br
        br
        .row
          .column.column-50.column-offset-25
             input(type="submit" value="login")
</template>

<script>
export default {
  name: 'Login',
  computed: {
    error () {
      return this.$route.query.message
    }
  }
}
</script>

<style lang="sass" scoped>
#Login
  .container
    padding: 64px 36px
  header
    text-align: center
    padding: 64px 0
  input[type="submit"]
    width: 100%
    font-size: 1.6rem
    height: 4.8rem
</style>
