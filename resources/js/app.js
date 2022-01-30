require('./bootstrap');

import Vue from 'vue';
import vuetify from './plugins/vuetify';

Vue.component('App', require('./components/App.vue').default);

new Vue({
  el: '#app',
	vuetify
});
