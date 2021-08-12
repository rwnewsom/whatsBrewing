<template>
  <div class="user-list">
      <div class="container">
          <table id="tblUsers">
      <thead>
        <tr>
          <!-- <th>&nbsp;</th> -->
          <th>Username</th>
          <th>Role</th>
          
        </tr>
      </thead>
      <tbody>
        <tr>
          <!-- <td>
            <input type="checkbox" id="selectAll" />
          </td> -->
          
          <td>
              <!-- v-model="filter.username"  -->
            <input type="text" id="usernameFilter" v-model="filter.searchUserName" />
          </td>  
          
          
          <td>
              <!-- v-model="filter.firstName" -->
            <input type="text" id="roleFilter" v-model="filter.searchRole" />  
          </td>
        
           
          
          <!-- <td>&nbsp;</td> -->
        </tr>        
      </tbody>

      <tr
      v-for="user of filteredUsers"
      v-bind:key="user.userId"
      >
      <td>{{user.username}}</td>
      <td>{{user.role}}</td>

      </tr>
    </table>
      </div>
  </div>
</template>

<script>
import UserService from '../services/UserService.js'
export default {
    name: 'UserList',

    data(){
      return {
        filter:{
          searchUserName: '',
          searchRole: ''
        }
      }

    },

    computed: {
        allUsers(){
            return this.$store.state.allUsers;
        },

        filteredUsers(){
          let result = this.allUsers.slice();

          if(this.filter.searchUserName || this.filter.searchRole){
            result = result.filter(user => user.username.toLowerCase().includes(this.filter.searchUserName.toLowerCase()) && user.role.toLowerCase().includes(this.filter.searchRole.toLowerCase()) );
          }
          return result;
        }
    },

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

<style lang="scss">
@import "../styles/colors.scss";

table{
    margin-top: 20px;
    margin-bottom: 20px;
    border: 2px solid $black;
    border-radius: 5px;
}

th{
    text-transform: uppercase;
}

tbody{
    margin: 0;
    padding: 0;
}

tr {
    border: 1px solid $black;
}

tr:nth-child(odd){
    background-color: $blue;
}

td {
    padding: 10px;
    border: 1px solid $black;
}

</style>