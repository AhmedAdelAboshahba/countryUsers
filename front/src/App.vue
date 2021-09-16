<template>
  <div id="app">
    <v-app>
      <v-navigation-drawer dark app permenant clipped>
        <v-list dense rounded>
          <v-list-item
            v-for="item in items"
            :key="item.title"
            link
            @click="$router.push({ path: `${item.path}` })"
          >
            <v-list-item-icon>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-navigation-drawer>

      <v-app-bar color="#363636" app dark clipped-left>
        <v-app-bar-title>USERS APP</v-app-bar-title>
      </v-app-bar>

      <v-main>
        <v-container fluid>
          <router-view></router-view>
        </v-container>
      </v-main>
    </v-app>
  </div>
</template>

<script>
export default {
  data() {
    return {
      sidebar: false,
      items: [
        { title: "List Users", icon: "mdi-account", path: "/country_users" },
        {
          title: "Users count",
          icon: "mdi-chart-bar",
          path: "/country_users_count",
        },
      ],
    };
  },
};
</script>

<style>
h1 {
  text-align: center;
  margin: 30px;
}
</style>
