import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

const state = {
  countryUsers: [],
  countryUsersCount: []
};

const getters = {
  countryUsers: state => state.countryUsers,
  countryUsersCount: state => state.countryUsersCount
};

const actions = {
  async getCountryUsers({ commit }, params) {
    let response = await this.$app.$http.get(`/v1/users/country_users`, {
      params: {
        page: params.page,
        country: params.country,
        per_page: params.perPage
      }
    });
    if (response.status.toString() === "200") {
      commit('setCountryUsers', response.data);
    }
  },
  async getCountryUsersCount({ commit }) {
    let response = await this.$app.$http.get(`/v1/users/country_users_count`);
    if (response.status.toString() === "200") {
      commit('setCountryUsersCount', response.data);
    }
  }
};

const mutations = {
  setCountryUsers: (state, countryUsers) => (state.countryUsers = countryUsers),
  setCountryUsersCount: (state, countryUsersCount) => (state.countryUsersCount = countryUsersCount)
};

export default new Vuex.Store({
  state,
  getters,
  mutations,
  actions
});

