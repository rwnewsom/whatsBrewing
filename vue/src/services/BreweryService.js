import axios from 'axios';

// Configuration options for Axios - Added 02AUG2021
let options = {
  baseURL: 'https://localhost:44315/'
}
//Also added 02AUG2021
let client = axios.create(options); // Creating the equivalent of a RestClient in RestSharp

export default {
    list() {
        return client.get('Brewery/breweries');
      },
      detail(id){
        return client.get('Brewery/breweries/'+id);
      },
      beer(id){
        //https://localhost:44315/Beer/breweries/1/beer
        return client.get('Beer/breweries/'+id+'/beer');
      },
      beerDetails(id, beerId){ //TODO: input URL
        return client.get('Beer/breweries/'+id+'/beer/'+beerId);
      }
}