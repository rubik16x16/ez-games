<template>
<div class="users">
<v-card>
	<v-card-title>Users</v-card-title>
	<v-card-text>
		<v-simple-table>
			<template v-slot:default>
				<thead>
					<tr>
						<th class="text-center">Name</th>
						<th class="text-center">Actions</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr v-for="(user, index) of users" :key="'user-' + index">
						<td>{{ user.name }}</td>
						<td>
							<v-btn color="error" text @click="rmUser(index)">x</v-btn>
						</td>
					</tr>
				</tbody>
			</template>
		</v-simple-table>
	</v-card-text>
	<v-divider></v-divider>
	<v-card-actions>
		<v-spacer></v-spacer>
		<v-btn color="primary" @click="dialog = true">New user</v-btn>
	</v-card-actions>
</v-card>
<v-dialog
	v-model="dialog"
	width="500"
>
	<v-card>
		<v-card-title class="text-h5 grey lighten-2">
			New User
		</v-card-title>

		<v-card-text>
			<v-form @submit.prevent="save">
				<v-text-field v-model="newUser.name" label="Name"></v-text-field>
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
		users: [],
		dialog: false,
		newUser: {
			name: null
		}
	}),
	mounted(){

		this.users = this.$store.state.users;
	},
	methods: {

		save(){

			this.users.push(this.newUser);
			this.newUser = {
				name: null
			};
			this.dialog = false;
			this.$store.commit('setUsers', this.users);
		},
		rmUser(index){

			this.users.splice(index, 1);
			this.$store.commit('setUsers', this.users);
		}
	}
}
</script>

<style>

</style>
