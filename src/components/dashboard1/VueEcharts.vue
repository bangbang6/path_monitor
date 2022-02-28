<template>
  <div class="echarts" ref="map"></div>
</template>

<script>
import Echarts from 'echarts'
export default {
  name: 'VueEcharts',
  props: {
    options: Object,
    theme: [String, Object]
  },
  watch: {
    options: function () {
      this.chart && this.chart.setOption(this.options)
    }
  },
  data () {
    return {}
  },
  mounted () {
    let dom
    if (!this.chart) {
      dom = this.$refs.map
      this.chart = Echarts.init(dom, this.theme)
    }
    if (this.options) {
      this.chart.setOption(this.options)
    }
  }
}
</script>

<style>
.echarts {
  width: 100%;
  height: 100%;
}
</style>