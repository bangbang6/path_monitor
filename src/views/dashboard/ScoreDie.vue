<template>
  <div class="visit-home">
    <div class="title">
      <span>></span>
      <span class="light" style="margin-right: 5px;color: #237dbf">></span>
      各分类得分条形图
      <span class="light" style="margin-left: 5px;color: #237dbf">&nbsp<</span>
      <span><</span>
    </div>
    <div class="chart" id="container">
      <!-- <v-chart :options="options" :theme="{darkMode:true}"></v-chart> -->
    </div>
  </div>
</template>

<script>
import echarts from 'echarts'
export default {
  data () {
    return {
      options: {}
    }
  },
  mounted () {
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom, 'dark');

    this.options = {
      darkMode: true,
      color: ['#4992ff', '#7cffb2', '#fddd60', '#ff6e76', '#58d9f9', '#05c091', '#ff8a45', '#8d48e3', '#dd79ff'],


      // backgroundColor: '#100C2A',
      backgroundColor: '#093068c4',
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          // Use axis to trigger tooltip
          type: 'shadow' // 'shadow' as default; can also be 'line' or 'shadow'
        }
      },
      legend: { show: false },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true,
        top: '4%'
      },
      xAxis: {
        type: 'value',
        splitLine: {
          show: false
        }
      },
      yAxis: {
        type: 'category',
        data: ['2018', '2019', '2020', '2021']
      },
      series: [
        {
          name: '医疗质量',
          type: 'bar',
          stack: 'total',
          label: {
            show: true
          },
          emphasis: {
            focus: 'series'
          },
          data: [130, 150, 180, 204]
        },
        {
          name: '运营效率',
          type: 'bar',
          stack: 'total',
          label: {
            show: true
          },
          emphasis: {
            focus: 'series'
          },
          data: [98, 118, 130, 153]
        },
        {
          name: '持续发展',
          type: 'bar',
          stack: 'total',
          label: {
            show: true
          },
          emphasis: {
            focus: 'series'
          },
          data: [54, 61, 69, 73]
        },
        {
          name: '满意度',
          type: 'bar',
          stack: 'total',
          label: {
            show: true
          },
          emphasis: {
            focus: 'series'
          },
          data: [12, 18, 20, 27]
        },

      ]
    };

    myChart.setOption(this.options);


  }
}
</script>

<style lang="scss" scoped>
.visit-home {
  width: 100%;
  height: 100%;
  border: 1px solid #237dbf;
  color: #237dbf;

  .title {
    display: flex;
    width: 100%;
    height: 10%;
    justify-content: center;
    align-items: center;
    font-size: 16px;
    font-weight: bold;
    color: #237dbf;
    background: #051d3f;
  }
  .chart {
    width: 100%;
    height: 90%;
    background: #093068c4;

    .echarts {
      width: 100%;
      height: 100%;
    }
  }
}
</style>
