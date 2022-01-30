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
				name: 'user1',
			},
			{
				name: 'user2'
			},
			{
				name: 'user3',
			},
			{
				name: 'user4'
			}
		],
		teams: [
			{
				name: 'team1',
				players: [
					{
						name: 'user1',
					},
					{
						name: 'user2'
					},
				]
			},
			{
				name: 'team2',
				players: [
					{
						name: 'user3',
					},
					{
						name: 'user4'
					}
				]
			}
		],
		matches: [
			{
				name: 'test',
				start: '2022-01-30T00:00',
				end: '2022-01-31T00:00',
				running: false,
				teams: [
					{
						name: 'team1',
						players: [
							{
								name: 'user1',
							},
							{
								name: 'user2'
							},
						]
					},
					{
						name: 'team2',
						players: [
							{
								name: 'user3',
							},
							{
								name: 'user4'
							}
						]
					}
				]
			},
			{
				name: 'test2',
				start: '2022-01-30T00:00',
				end: '2022-01-31T00:00',
				running: false,
				teams: [
					{
						name: 'team1',
						players: [
							{
								name: 'user1',
							},
							{
								name: 'user2'
							},
						]
					},
					{
						name: 'team2',
						players: [
							{
								name: 'user3',
							},
							{
								name: 'user4'
							}
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
