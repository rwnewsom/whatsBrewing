import axios from 'axios';

// Configuration options for Axios - Added 02AUG2021
let options = {
  baseURL: 'https://localhost:44315/'
}
//Also added 02AUG2021
let client = axios.create(options); // Creating the equivalent of a RestClient in RestSharp

export default {
    reviewList(beerId) {        
        return client.get('Review/reviews/'+beerId); //TODO: right url?
      }
}