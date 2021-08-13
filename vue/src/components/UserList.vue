<template :key="componentKey">
  <div class="user-list">
      <div class="container">

      <table id="tblUsers">
      <thead>
        <tr>
           <th>&nbsp;</th>
          <th>Username</th>
          <th>Role</th>          
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            &nbsp;
          </td>           
          <td>
            <input type="text" id="usernameFilter" v-model="filter.searchUserName" />
          </td>  
          <td>
            <input type="text" id="roleFilter" v-model="filter.searchRole" />  
          </td>
        </tr>        
      </tbody>

      <tr
      v-for="user of filteredUsers"
      v-bind:key="user.userId"
      >
      <td>
            <input type="checkbox" v-bind:id="user.userId" v-bind:value="user.userId" v-model="selectedUserIds" />
          </td>
      <td>{{user.username}}</td>
      <td>{{user.role}}</td>

      </tr>
    </table>

    <div class="deleteButton">
         <button type="button" id="deleteButton" class="btn btn-outline-danger" v-on:click="deleteUser">
                            Delete User</button>
    </div>

    <div class="brewerButton">
         <button type="button" id="brewerButton" class="btn btn-outline-danger" v-on:click="toggleBrewer">
                            Toggle Brewer</button>
    </div>
    
      </div>

     
      
  </div>
</template>

<script>
import UserService from '../services/UserService.js'
export default {
    name: 'UserList',

     methods: {
        deleteUser() {
            let confirmed = confirm('Are you sure you want to delete this beer? This cannot be undone.');

            if (confirmed) {

              

              for(let i = 0; i < this.selectedUserIds.length; i++){
                let index = this.allUsers.findIndex(user => user.userId == this.selectedUserIds[i]);
                  UserService.deleteUser(this.selectedUserIds[i])
                 .then(response => {
                   console.log('Promise Resolved', response);
                   this.$store.commit('DELETE_USER', index);
                     
                   
                 });
                }    
            }
            //change store
        },

        toggleBrewer(){
          console.log('Toggle User was Clicked!', event);
          for(let i = 0; i < this.selectedUserIds.length; i++){
            let index = this.allUsers.findIndex(user => user.userId == this.selectedUserIds[i]);
            this.updatedUser.userId = this.allUsers[index].userId;
            this.updatedUser.username = this.allUsers[index].username;
            if(this.allUsers[index].role=="user"){
              this.updatedUser.role = "brewer";
            }
            else if(this.allUsers[index].role=="brewer"){
              this.updatedUser.role = "user";
            }
            else{
              return;
            }
            UserService.toggleBrewer(this.updatedUser.userId, this.updatedUser)
            .then((response) => {
              if(response.status===200){
                this.componentKey+=1;
                
              }
            });
          }


        }
    },

    data(){
      return {
        filter:{
          searchUserName: '',
          searchRole: ''
        },
        selectedUserIds: [],
        componentKey:0,
        

        updatedUser:{
          userId: 0,
          username: '',
          role: '',
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
    width: 75%;
    margin-left: auto;
    margin-right: auto;
}

th{
    text-transform: uppercase;
    border: 1px solid $black;
    overflow: hidden;
    height: 14px;
    white-space: nowrap;
}

tbody{
    margin: 0;
    padding: 0;
}

tr {
    border: 1px solid $black;
    overflow: hidden;
    height: 14px;
    white-space: nowrap;
}

tr:nth-child(odd){
    background-color: $blue;
}

td {
    padding: 10px;
    border: 1px solid $black;
}

button {
  margin-right: 5px;
}
.all-actions {
  margin-bottom: 40px;
}

#deleteButton{
    background-color: $red;
    color: $white;
    margin-top: 1rem;
}
#deleteButton:hover{
   background-color:$black;
    color: $white;
}

#brewerButton{
    background-color: $blue;
    margin-top: 1rem;
}

#brewerButton:hover{
   background-color:$white;
    color: $blue;
}

</style>