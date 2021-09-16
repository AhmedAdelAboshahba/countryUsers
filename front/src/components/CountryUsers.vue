<template>
  <div>
    <h1>List Users</h1>
    <v-row align="center">
      <v-col class="d-flex" cols="12" sm="3">
        <v-select v-model="currentCountry" :items="countries" label="Country"></v-select>
      </v-col>
    </v-row>
    <v-data-table
      :headers="headers"
      :items="users"
      class="elevation-10"
      :options.sync="options"
      :server-items-length="totalUsers"
      :loading="loading"
      :footer-props="{ itemsPerPageOptions: [10, 20, 50, 100] }"
    >
      <template v-slot:item.parcel_weight="{ item }">
        <v-chip :color="getColor(item.parcel_weight)" dark>
          {{ item.parcel_weight }}
        </v-chip>
      </template>
    </v-data-table>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  data() {
    return {
      countries: ["Cameroon", "Ethiopia", "Morocoo", "Mozambique", "Uganda"],
      headers: [
        {
          text: "ID",
          align: "start",
          sortable: false,
          value: "id",
        },
        { text: "E-mail", value: "email" },
        { text: "Phone Number", value: "phone_number" },
        { text: "Parcel Weight", value: "parcel_weight" },
      ],
      users: [],
      totalUsers: 0,
      loading: true,
      options: {},
      currentCountry: "Cameroon",
    };
  },
  methods: {
    ...mapActions(["getCountryUsers"]),
    getColor(parcelWeight) {
      if (parcelWeight > 20) return "red";
      else if (parcelWeight > 10) return "orange";
      else return "green";
    },
    getUsers() {
      this.loading = true;
      let params = {
        country: this.currentCountry,
        page: this.options.page,
        perPage:
          this.options.itemsPerPage == -1
            ? this.totalUsers
            : this.options.itemsPerPage,
      };
      this.getCountryUsers(params).then(() => {
        this.users = this._.map(this.countryUsers.data, (user) => ({
          id: user.id,
          email: user.attributes.email,
          phone_number: user.attributes.phone_number,
          parcel_weight: user.attributes.parcel_weight,
        }));
        this.totalUsers = this.countryUsers.total_number;
        this.loading = false;
      });
    },
  },
  watch: {
    options: {
      handler() {
        this.getUsers();
      },
      deep: true,
    },
    currentCountry() {
      this.options = { page: 1 }
      this.getUsers()
    }
  },
  computed: {
    ...mapGetters(["countryUsers"]),
  },
  mounted() {
    this.getUsers();
  },
};
</script>
