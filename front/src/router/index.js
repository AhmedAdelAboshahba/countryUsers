import Vue from 'vue';
import Router from 'vue-router';
import CountryUsers from '../components/CountryUsers.vue';
import CountryUsersCount from '../components/CountryUsersCount.vue';
import HomePage from '../components/HomePage.vue';

Vue.use(Router);

export const router = new Router({
  mode: 'history',
  scrollBehavior() {
    return { x: 0, y: 0 };
  },
  routes: [   
    {
      path: '/',
      component: HomePage
    },
    {
      path: '/country_users',
      name: 'country-users',
      component: CountryUsers
    },
    {
      path: '/country_users_count',
      name: 'country-users-count',
      component: CountryUsersCount
    }
  ]
});
export default router;
