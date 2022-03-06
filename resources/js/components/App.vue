<template>
<v-app>
	<v-app-bar app>
		<v-toolbar-title>EZ-BATTLES</v-toolbar-title>
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
import CountDown from './CountDown';

export default {
	components: {
		Users,
		Teams,
		Matches,
		CountDown
	},
	data: () => ({
		url: process.env.MIX_APP_URL,
		end: new Date('2022-03-30T18:37:00')
	}),
	mounted(){

	}
}
</script>

<style>

</style>
