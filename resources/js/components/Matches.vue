<template>
<div class="matches">
<v-card>
	<v-card-title>Matches</v-card-title>
	<v-card-text>
		<v-simple-table>
			<template v-slot:default>
				<thead>
					<tr>
						<th class="text-center">Name</th>
						<th class="text-center">Teams</th>
						<th class="text-center">Start</th>
						<th class="text-center">End</th>
						<th class="text-center">Actions</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr v-for="(match, index) of matches" :key="'match-' + index">
						<td>{{ match.name }}</td>
						<td>{{ match.teams.map(item => item.name).join(', ') }}</td>
						<td>{{ match.start }}</td>
						<td>{{ match.end }}</td>
						<td>
							<v-btn color="error" text @click="rmMatch(index)">x</v-btn>
							<v-btn v-if="!match.running" color="success" @click="runMatch(match)">Run</v-btn>
							<v-btn v-else color="warning" @click="stopMatch(match)">Stop</v-btn>
						</td>
					</tr>
				</tbody>
			</template>
		</v-simple-table>
	</v-card-text>
	<v-divider></v-divider>
	<v-card-actions>
		<v-spacer></v-spacer>
		<v-btn color="primary" @click="dialog = true">New match</v-btn>
	</v-card-actions>
</v-card>
<v-dialog
	v-model="dialog"
	width="500"
>
	<v-card>
		<v-card-title class="text-h5 grey lighten-2">
			New Match
		</v-card-title>

		<v-card-text>
			<v-form @submit.prevent="save">
				<v-text-field v-model="newMatch.name" label="name"></v-text-field>
				<label for="match-start">Start</label>
				<input class="form-control" v-model="newMatch.start" type="datetime-local" id="match-start">
				<label for="match-end">End</label>
				<input class="form-control" v-model="newMatch.end" type="datetime-local" id="match-end">
				<v-simple-table>
					<template v-slot:default>
						<thead>
							<tr>
								<th class="text-center">Name</th>
								<th class="text-center">Players</th>
								<th class="text-center">Actions</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<tr v-for="(team, index) of localTeams" :key="'localTeam-' + index">
								<td>{{ team.name }}</td>
								<td>{{ team.players.map(item => item.name).join(', ') }}</td>
								<td>
									<v-simple-checkbox v-model="team.checked"></v-simple-checkbox>
								</td>
							</tr>
						</tbody>
					</template>
				</v-simple-table>
			</v-form>
		</v-card-text>

		<v-divider></v-divider>
		<v-card-actions>
			<v-spacer></v-spacer>
			<v-btn color="success" @click="save">Save</v-btn>
		</v-card-actions>
	</v-card>
</v-dialog>
</div>
</template>

<script>
export default {
	data: () => ({
		matches: [],
		dialog: false,
		newMatch: {
			name: null,
			teams: [],
			start: null,
			end: null,
			running: false
		},
		localTeams: []
	}),
	mounted(){

		this.matches = this.$store.state.matches;
		this.loadTeams();
	},
	methods: {

		loadTeams(){

			this.localTeams = this.teams.map(item => {
				let newItem = {...item};
				newItem.checked = false;
				return newItem;
			});
		},
		save(){

			this.newMatch.teams = this.localTeams.filter(item => item.checked);
			this.matches.push(this.newMatch);
			this.newMatch = {
				name: null,
				teams: [],
				start: null,
				end: null
			};
			this.dialog = false;
			this.localTeams = this.localTeams.map((item) => {

				item.checked = false;
				return item;
			});
			this.$store.commit('setMatches', this.matches);
		},
		rmMatch(index){

			this.matches.splice(index, 1);
			this.$store.commit('setMatches', this.matches);
		},
		runMatch(match){

			match.running = true;
			match.loop = setInterval(() => {

				console.log(`run match ${match.name}`);
			}, 2000);
		},
		stopMatch(match){

			match.running = false;
			clearInterval(match.loop);
		}
	},
	computed: {

		teams(){

			return this.$store.state.teams;
		}
	},
	watch: {

		teams(oldTeams, newTeams){

			console.log('teams changed');
			this.loadTeams();
		}
	}
}
</script>

<style>

.form-control{

	width: 100%;
	display: 'block';
}

</style>
