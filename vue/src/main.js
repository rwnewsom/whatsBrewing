import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
import JwPagination from "jw-vue-pagination"

Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;
Vue.component('jw-pagination', JwPagination)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
