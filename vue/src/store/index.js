import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')

let currentUser = null;
if ((localStorage.getItem('user') && localStorage.getItem('user') != 'undefined')) {
  currentUser = JSON.parse(localStorage.getItem('user'));
}

if(currentToken && currentToken != 'undefined') {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    allUsers:[],
    brewery: [],
    breweries: [],
    beer: [],
    beerDetails:[],
    reviews:[],
    isLoggedIn: false,
    token: currentToken || '',
    user: currentUser || {}, // If a user is an admin, their user.role will be 'admin'
    isAddFormVisible: false,
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
      state.isLoggedIn = true;
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      state.isLoggedIn = false;
      axios.defaults.headers.common = {};
    },
    LOADED_BREWERIES(state, payload){
      state.breweries = payload;
    },

    LOADED_BREWERY(state, payload){
      state.brewery = payload;
    },
    LOADED_BEER(state, payload){
      state.beer = payload;
    },
    LOADED_BEER_DETAILS(state, payload){
      state.beerDetails = payload;
    },
    LOADED_REVIEWS(state, payload){
      state.reviews = payload;
    },
    TOGGLE_ADD_FORM_VISIBLE(state){
      state.isAddFormVisible = !state.isAddFormVisible;
    },
    ADD_BEER(state, payload){
      state.beer.push(payload);
    },
    ADD_REVIEW(state, payload){
      state.reviews.push(payload);
    },
    ADD_BREWERY(state, payload){
      state.breweries.push(payload);
    },
    LOADED_USERS(state, payload){
      state.allUsers = payload;
    },
    DELETE_USER(state, payload){
      state.allUsers.splice(payload, 1)
    },
    ADD_USER(state, payload){
      state.allUsers.push(payload)
    }
  }
})
