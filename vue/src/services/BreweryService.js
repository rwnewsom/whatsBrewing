import axios from 'axios';

// Configuration options for Axios - Added 02AUG2021
let options = {
  baseURL: 'https://localhost:44315/Brewery'
}
//Also added 02AUG2021
let client = axios.create(options); // Creating the equivalent of a RestClient in RestSharp

export default {
    list() {
        return client.get('/breweries');
      },
      detail(id){
        return client.get('/breweries/'+id);
      }
}