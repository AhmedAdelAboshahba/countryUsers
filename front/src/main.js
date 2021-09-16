import Vue from 'vue'
import App from './App.vue'
import vuetify from '@/plugins/vuetify'
import router from '@/router';
import axios from '@/plugins/axios.js';
import store from './store';
import VueLodash from 'vue-lodash';
import lodash from 'lodash';


Vue.config.productionTip = false
Vue.prototype.$http = axios;
Vue.use(VueLodash, { lodash: lodash });

const app = new Vue({
  router,
  vuetify,
  store,
  axios,
  render: h => h(App)
});

store.$app = app;
app.$mount('#app');
