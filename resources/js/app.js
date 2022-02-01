require('./bootstrap');

import Vue from 'vue';
import vuetify from './plugins/vuetify';
import Vuex from 'vuex';

Vue.use(Vuex);
Vue.component('App', require('./components/App.vue').default);

const store = new Vuex.Store({
  state: {
    users: [
			{
				name: 'Iron#6056064',
				points: 0,
			},
			{
				name: 'damqge#9252117',
				points: 0,
			}
		],
		teams: [
			{
				name: 'team1',
				points: 0,
				players: [
					{
						name: 'Iron#6056064',
						points: 0,
						matches: []
					}
				]
			},
			{
				name: 'team2',
				points: 0,
				players: [
					{
						name: 'damqge#9252117',
						points: 0,
						matches: []
					}
				]
			}
		],
		matches: [
			{
				name: 'test',
				start: '2022-02-01T04:00',
				end: '2022-02-01T06:00',
				running: false,
				teams: [
					{
						name: 'team1',
						points: 0,
						players: [
							{
								name: 'Iron#6056064',
								points: 0,
								matches: []
							}
						]
					},
					{
						name: 'team2',
						points: 0,
						players: [
							{
								name: 'damqge#9252117',
								points: 0,
								matches: []
							},
						]
					}
				]
			}
		]
  },
  mutations: {
    setUsers(state, payload) {

			state.users = payload;
    },
		setTeams(state, payload) {

			state.teams = payload;
    },
		setMatches(state, payload){

			state.matches = payload;
		}
  }
});

new Vue({
  el: '#app',
	store: store,
	vuetify
});
