<template>
  <div class="men-zheng">
    <div class="chart">
      <v-chart :options="options"></v-chart>
    </div>
    <div class="cards">
      <el-card
        v-for="(item,index) in this.titleData"
        :key="item.label"
        :style="cardStyle(item,index)"
      >
        <el-popover
          placement="top-start"
          width="160"
          trigger="hover"
          :content="`比平均值${item.diff}${item.number}`"
        >
          <!-- <el-button slot="reference">hover 激活</el-button> -->
          <div slot="reference">{{item.label}}:{{item.diff}}</div>
        </el-popover>
      </el-card>
    </div>
  </div>
</template>
 
<script>
export default {
  data () {
    return {
      options: {},

    }
  },
  props: ['scoreData', 'colors', 'titleData'],
  computed: {
    tabs () {
      return this.titleData.map(item => item.label)
    },



  },
  methods: {
    cardStyle (item, index) {
      return {
        backgroundColor: this.colors[index]
      }
    }
  },
  mounted () {
    console.log('this.ca', this.titleData);
    const series = this.titleData.map((item, index) => ({
      name: item.label,
      type: 'line',
      symbol: 'circle',

      color: this.colors[index],
      data: this.scoreData[index]
    }))
    this.options = {

      tooltip: {
        trigger: 'axis'
      },
      legend: {
        data: this.tabs,
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
      series: series
    };

  }
}
</script>
 
<style lang="scss" scoped>
.men-zheng {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  /* background-color: #091629; */
  .chart {
    width: 90%;
    height: 100%;
    .echarts {
      width: 100%;
      height: 100%;
    }
  }
  .cards {
    width: 10%;
    height: 100%;
    align-items: center;
    display: flex;
    flex-direction: column;
    justify-content: space-around;

    .el-card {
      height: 16%;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
    }
  }
}
::v-deep .el-card__body {
  padding: 0 !important;
  text-align: center;
}
</style>