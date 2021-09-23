<template>
  <!-- TradingVueJs 101 (example from 'Getting Started' ) -->

  <trading-vue
    titleTxt= "DRIPBNB (Custom DEX)"
    :data="chart"
    :width="this.width"
    :height="this.height"
    :color-back="colors.colorBack"
    :color-grid="colors.colorGrid"
    :color-text="colors.colorText"
  >
  </trading-vue>
</template>

<script>
import TradingVue from "trading-vue-js";
import getPrices from "./http/getPrices.js";

export default {
  name: "app",
  components: { TradingVue },
  methods: {
    onResize(event) {
      this.width = window.innerWidth;
      this.height = window.innerHeight;
    },
  },
  async mounted() {
    window.addEventListener("resize", this.onResize);
    this.$isLoading(true)

    const self = this;

    const prices = await getPrices();

    var data = [];

    for (const price of prices.data) {
      const values = [
        price.timestamp,
        price.open,
        price.high,
        price.low,
        price.close,
        0,
      ];
      data.push(values);
    }

    var newChart = {
      chart: {
        type: "Candles",
        data: data,
      },
    };

    self.chart = newChart;

    this.$isLoading(false)
  },
  beforeDestroy() {
    window.removeEventListener("resize", this.onResize);
  },
  data() {
    const data = {
      chart: {
        type: "Candles",
        data: [],
      },
    };
    // const dataHolder = computed(() => data.value);

    return {
      chart: data,
      width: window.innerWidth,
      height: window.innerHeight,
      colors: {
        colorBack: "#fff",
        colorGrid: "#eee",
        colorText: "#333",
      },
    };
  },
};
</script>
