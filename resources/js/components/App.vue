<template>
<v-app>
	<v-app-bar app>
		<v-toolbar-title>EZ-GAMES</v-toolbar-title>
	</v-app-bar>
	<v-main>
		<v-container>
			<v-row>
        <v-col md="6"><Users></Users></v-col>
				<v-col md="6"><Teams></Teams></v-col>
      </v-row>
			<v-row>
				<v-col>
					<Matches></Matches>
				</v-col>
			</v-row>
		</v-container>
	</v-main>
</v-app>
</template>

<script>

import Users from './Users.vue';
import Teams from './Teams.vue';
import Matches from './Matches.vue';

export default {
	components: {
		Users,
		Teams,
		Matches
	},
	data: () => ({
		url: process.env.MIX_APP_URL
	}),
	mounted(){

	}
}
</script>

<style>

</style>
