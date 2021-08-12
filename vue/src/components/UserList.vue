<template>
  <div class="user-list">
  </div>
</template>

<script>
import UserService from '../services/UserService.js'
export default {
    name: 'UserList',

    created(){
        console.log('Attempting user request...');

        UserService.listAllUsers()
        .then(result => {
            console.log('Promise Resolved', result);

            if(result.status === 200) {
                this.$store.commit('LOADED_USERS', result.data);
            }
        });
    }

}
</script>

<style>

</style>