<template>
  <div class="visit-home">
    <div class="title">
      <span>></span>
      <span class="light" style="margin-right: 5px;color: #237dbf">></span>
      指标符合趋势前五
      <span class="light" style="margin-left: 5px;color: #237dbf">&nbsp<</span>
      <span><</span>
      <div class="wrapper">
        <el-radio-group v-model="typeTrency" size="mini" @change="handleChange">
          <el-radio-button label="上升"></el-radio-button>
          <el-radio-button label="下降"></el-radio-button>
        </el-radio-group>
      </div>
      <div class="radios">
        <radio-stage @changeStage="handleChangeStage"></radio-stage>
      </div>
    </div>
    <div class="chart">
      <v-chart :options="options"></v-chart>
    </div>
  </div>
</template>

<script>
import RadioStage from './RadioStage.vue';
export default {
  components: { RadioStage },
  data () {
    return {
      options: {},
      typeTrency: "上升",
      categorys: [],
      colors: [],
      scoreData: [],
      xAxisData: [2015, 2016, 2017, 2018, 2019, 2020],


    }
  },


  methods: {
    handleChangeStage (e) {
      // const month = moment().month() + 1
      // const monthData = []
      // for (let i = 1; i <= month; i++) {
      //   monthData.push(`${i}月`)
      // }
      // const week = Math.ceil(moment().date() / 7)
      // const weekData = []
      // for (let i = 1; i <= week; i++) {
      //   weekData.push(`第${i}周`)
      // }
      // const day = moment().day()
      // const daykData = []

      // for (let i = day; i >= Math.min((day - 10), 1); i--) {
      //   daykData.shift(`第${i}天`)
      // }
    if (e === '年') {
        const length = this.scoreData.length
        const mock = this.randomMock(length)
        this.scoreData = mock
        this.xAxisData = [2015, 2016, 2017, 2018, 2019, 2020]
      } else if (e === '月') {
        const length = this.scoreData.length
        const mock = this.randomMock(length)
        this.scoreData = mock
        this.xAxisData = ['七月', '八月', '九月', '十月', '十一月', '十二月']
      } else if (e === '周') {
       const length = this.scoreData.length
        const mock = this.randomMock(length)
        this.scoreData = mock
        this.xAxisData = ['第一周', '第二周', '第三周', '第四周', '第五周', '第六周']
      } else if (e === '日') {
        const length = this.scoreData.length
        const mock = this.randomMock(length)
        this.scoreData = mock
        this.xAxisData = ['25日', '26日', '27日', '28日', '29日', '30日']
      }
      this.render()
    },
    handleChange (e) {
      console.log('e', e);
      this.typeTrency = e
      if (e === '上升') {
        this.titleData = ['每百张病床药师人数', '收支结余', '医护比', '门诊次均费用增幅', '患者满意度']
        this.colors = ['#02CDE6', '#f58220', '#1DE9B6', '#ffc20e']
        this.scoreData = [[8.6, 7.2, 8.8, 9.4, 9.2, 9.0], [7.6, 8.2, 7.4, 9.0, 8.1, 9.6], [7.8, 7.2, 8.1, 9.4, 8.6, 9.4], [9.1, 8.2, 8.4, 9.4, 8.6, 8.0]]

      } else {
        this.titleData = ['辅助用药收入占比', '资产负债率', '医护比', '医务人员满意度', '门诊收入占医疗收入比例']
        this.colors = ['#02CDE6', '#f58220', '#1DE9B6', '#ffc20e']
        this.scoreData = [[8.6, 7.2, 8.8, 9.4, 9.2, 9.0], [7.6, 8.2, 7.4, 9.0, 8.1, 9.6], [7.8, 7.2, 8.1, 9.4, 8.6, 9.4], [9.1, 8.2, 8.4, 9.4, 8.6, 8.0]]

      }
      this.render()
    },

    render () {
      const series = this.titleData.map((item, index) => ({
        name: item,
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
          data: this.titleData,
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
          data: this.xAxisData
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
  },
  mounted () {
    this.titleData = ['每百张病床药师人数', '收支结余', '医护比', '门诊次均费用增幅', '患者满意度']
    this.colors = ['#02CDE6', '#f58220', '#1DE9B6', '#ffc20e']
    this.scoreData = [[8.6, 7.2, 8.8, 9.4, 9.2, 9.0], [7.6, 8.2, 7.4, 9.0, 8.1, 9.6], [7.8, 7.2, 8.1, 9.4, 8.6, 9.4], [9.1, 8.2, 8.4, 9.4, 8.6, 8.0]]


    this.render()



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
    position: relative;

    background: #051d3f;
    .wrapper {
      position: absolute;
      left: 10px;
      top: 2px;
      height: 100%;
    }
    .radios {
      position: absolute;
      right: 10px;
      top: 2px;
      height: 100%;
    }
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
::v-deep .el-radio-button__inner {
  background-color: #3e495d;
  border: none;
  color: #c0c4cc;
}
::v-deep .el-radio-button__inner {
  border-left: none !important;
}
</style>
