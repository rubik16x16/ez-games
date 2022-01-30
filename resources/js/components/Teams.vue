<template>
<div class="teams">
<v-card>
	<v-card-title>Teams</v-card-title>
	<v-card-text>
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
					<tr v-for="(team, index) of teams" :key="'team-' + index">
						<td>{{ team.name }}</td>
						<td>{{ team.players.map(item => item.name).join(', ') }}</td>
						<td>
							<v-btn color="error" text @click="rmTeam(index)">x</v-btn>
						</td>
					</tr>
				</tbody>
			</template>
		</v-simple-table>
	</v-card-text>
	<v-divider></v-divider>
	<v-card-actions>
		<v-spacer></v-spacer>
		<v-btn color="primary" @click="dialog = true">New team</v-btn>
	</v-card-actions>
</v-card>
<v-dialog
	v-model="dialog"
	width="500"
>
	<v-card>
		<v-card-title class="text-h5 grey lighten-2">
			New Team
		</v-card-title>

		<v-card-text>
			<v-form @submit.prevent="save">
				<v-text-field v-model="newTeam.name" label="Name"></v-text-field>
				<v-simple-table>
					<template v-slot:default>
						<thead>
							<tr>
								<th class="text-center">Name</th>
								<th class="text-center">Actions</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<tr v-for="(user, index) of localUsers" :key="'localUser-' + index">
								<td>{{ user.name }}</td>
								<td>
									<v-simple-checkbox v-model="user.checked"></v-simple-checkbox>
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
		teams: [],
		dialog: false,
		newTeam: {
			name: null,
			players: []
		},
		localUsers: [],
		val: false
	}),
	mounted(){

		this.teams = this.$store.state.teams;
		this.loadUsers();
	},
	methods: {

		loadUsers(){

			this.localUsers = this.users.map(item => {
				let newItem = {...item};
				newItem.checked = false;
				return newItem;
			});
		},
		save(){

			this.newTeam.players = this.localUsers.filter(item => item.checked);
			this.teams.push(this.newTeam);
			this.newTeam = {
				name: null,
				players: []
			};

			this.localUsers = this.localUsers.map((item) => {
				item.checked = false;
				return item
			});

			this.dialog = false;
			this.$store.commit('setTeams', this.teams);
		},
		rmTeam(index){

			this.teams.splice(index, 1);
			this.$store.commit('setTeams', this.teams);
		}
	},
	computed: {

		users(){

			return this.$store.state.users;
		}
	},
	watch: {

		users(oldUsers, newUsers){

			console.log('users changed');
			this.loadUsers();
		}
	}
}
</script>

<style>

</style>
