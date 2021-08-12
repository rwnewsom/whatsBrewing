import axios from 'axios';

let options = {
    baseURL: 'https://localhost:44315/'
  }

let client = axios.create(options); // Creating the equivalent of a RestClient in RestSharp

export default {
    listAllUsers(){
        return client.get('/User/admin/users');
    },

    deleteUser(id){
        return client.delete('User/admin/users/'+id)
    },

}