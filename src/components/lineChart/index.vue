<template>
  <div class="men-zheng">
    <v-chart :options="options"></v-chart>
  </div>
</template>
 
<script>
export default {
  data () {
    return {
      options: {}
    }
  },
  mounted () {
    this.options = {

      tooltip: {
        trigger: 'axis'
      },
      legend: {
        data: ['功能定位', '质量安全', '合理用药', '服务流程'],
        formatter: function (name) {
          return name
        },
        textStyle: {
          color: 'white'
        },
        top: 3,
        show: true
      },

      calculable: true,


      xAxis:
      {
        // axisLabel: {
        //   rotate: 30,
        //   interval: 0
        // },
        axisLine: {
          lineStyle: {
            color: '#CECECE'
          }
        },
        axisLabel: {
          fontSize: 12
        },
        type: 'category',
        boundaryGap: false,
        data: ['2015', '2016', '2017', '2018', '2019', '2020']
      },
      yAxis: [
        {

          type: 'value',
          axisLine: {
            lineStyle: {
              color: '#CECECE'
            },
            show: false
          },
          axisLabel: {
            fontSize: 12
          },
          min: function (value) {
            return value.min - 0.5
          }
        },

      ],
      grid: {
        top: 30,
        left: 40,
        right: 20,
        bottom: 30,
      },
      series: [
        {
          name: '功能定位',
          type: 'line',
          symbol: 'circle',

          color: ['#02CDE6'],
          data: [8.6, 7.2, 8.8, 9.4, 9.2, 9.0]
        },
        {
          name: '质量安全',
          type: 'line',
          symbol: 'circle',

          color: ['#2480B4'],
          data: [7.6, 8.2, 7.4, 9.0, 8.1, 9.6]
        },
        {
          name: '合理用药',
          type: 'line',
          symbol: 'circle',

          color: ['#1DE9B6'],
          data: [7.8, 7.2, 8.1, 9.4, 8.6, 9.4]
        },
        {
          name: '服务流程',
          type: 'line',
          symbol: 'circle',

          color: ['#1DE9B6'],
          data: [9.1, 8.2, 8.4, 9.4, 8.6, 8.0]
        }
      ]
    };

  }
}
</script>
 
<style lang="scss" scoped>
.men-zheng {
  width: 100%;
  height: 100%;
  /* background-color: #091629; */

  .echarts {
    width: 100%;
    height: 100%;
  }
}
</style>