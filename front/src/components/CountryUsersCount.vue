<template>
  <div>
    <h1 class="justify-center">Country Users Count</h1>
    <v-data-table
      :headers="headers"
      :items="countryFrequency"
      :footer-props="{ disablePagination: true, disableItemsPerPage: true }"
      hide-default-footer
      class="elevation-10"
    ></v-data-table>
    <vue-apex-charts
      class="mt-10"
      :key="`chart${chartKey}`"
      type="donut"
      height="200"
      :options="chartOptions"
      :series="series"
    />
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import VueApexCharts from "vue-apexcharts";
export default {
  data() {
    return {
      headers: [
        {
          text: "Country",
          align: "start",
          sortable: false,
          value: "country",
        },
        { text: "Number of users", value: "count" },
      ],
      chartKey: 0,
      countryFrequency: [],
      series: [],
      chartOptions: {
        chart: {
          width: 500,
          type: "donut",
        },
        dataLabels: {
          enabled: false,
        },
        labels: [],
        responsive: [
          {
            breakpoint: 480,
            options: {
              chart: {
                width: 200,
              },
              legend: {
                position: "bottom",
              },
            },
          },
        ],
      },
    };
  },
  methods: {
    ...mapActions(["getCountryUsersCount"]),
  },
  computed: {
    ...mapGetters(["countryUsersCount"]),
  },
  mounted() {
    this.getCountryUsersCount().then(() => {
      this.countryFrequency = this._.map(
        this.countryUsersCount.data,
        (count, country) => ({
          country,
          count,
        })
      );

      this.series = this._.map(this.countryUsersCount.data, (data) => data);
      this.chartOptions.labels = this._.map(
        this.countryUsersCount.data,
        (key, val) => val
      );
      this.chartKey++;
    });
  },
  components: {
    VueApexCharts,
  },
};
</script>