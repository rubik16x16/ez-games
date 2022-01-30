<template>
<v-app>
	<v-app-bar app>
		<v-toolbar-title>EZ-GAMES</v-toolbar-title>
	</v-app-bar>
	<v-main>
		<v-container>
			<v-row :align="align">
        <v-col md="6"><Users></Users></v-col>
      </v-row>
		</v-container>
	</v-main>
</v-app>
</template>

<script>

import Users from './Users.vue';

export default {
	components: {
		Users
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
