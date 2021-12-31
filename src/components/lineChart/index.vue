<template>
  <div class="men-zheng">
    <div class="chart">
      <div class="radios">
        <radio-stage @changeStage="handleChangeStage"></radio-stage>
      </div>
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
import RadioStage from '@/views/dashboard/RadioStage.vue';

export default {
  components: {
    RadioStage
  },
  data () {
    return {
      options: {},
      xAxisData: [2015, 2016, 2017, 2018, 2019, 2020],
      newScoreData: []
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
    },
    handleChangeStage (e) {
      console.log('e', e);
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
        this.newScoreData = mock
        this.xAxisData = [2015, 2016, 2017, 2018, 2019, 2020]
      } else if (e === '月') {
        const length = this.scoreData.length
        const mock = this.randomMock(length)
        this.newScoreData = mock
        this.xAxisData = ['七月', '八月', '九月', '十月', '十一月', '十二月']
      } else if (e === '周') {
       const length = this.scoreData.length
        const mock = this.randomMock(length)
        this.newScoreData = mock
        this.xAxisData = ['第一周', '第二周', '第三周', '第四周', '第五周', '第六周']
      } else if (e === '日') {
        const length = this.scoreData.length
        const mock = this.randomMock(length)
        this.newScoreData = mock
        this.xAxisData = ['25日', '26日', '27日', '28日', '29日', '30日']
      }
      this.render()
    },
    render () {
      console.log('', this.titleData);
      const series = this.titleData.map((item, index) => ({
        name: item.label,
        type: 'line',
        symbol: 'circle',

        color: this.colors[index],
        data: this.newScoreData[index]
      }))
      console.log('series', series);
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
    console.log('this.ca', this.titleData);
    this.newScoreData = this.scoreData
    console.log('this.scoreData', this.scoreData);
    this.render()

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
    position: relative;

    height: 100%;
    .echarts {
      width: 100%;
      height: 100%;
    }
    .radios {
      position: absolute;
      right: 10px;
      top: -5px;
      z-index: 99;
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
::v-deep .el-radio-button__inner {
  background-color: #3e495d;
  border: none;
  color: #c0c4cc;
}
::v-deep .el-radio-button__inner {
  border-left: none !important;
}
</style>