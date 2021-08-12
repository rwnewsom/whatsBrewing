<template>
  <div>
      <h1>Admin Control Panel</h1>
      <h2>Current Users</h2>
      <user-list />
  </div>
</template>

<script>
import UserList from '../components/UserList.vue';

export default {
name: "AdminPanel",
components: {
  UserList
},
}
</script>

<style lang="scss">
@import "../styles/colors.scss";

</style>