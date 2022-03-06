<template>
  <div class="total-people">
    <div class="title">
      <span>></span>
      <span class="light" style="margin-right: 5px;color: #237dbf">></span>
      重要疾病就医时间段人次统计
      <span class="light" style="margin-left: 5px;color: #237dbf">&nbsp<</span>
      <span><</span>
    </div>
    <div class="main">
      <div class="total">
        <div class="pre">共计</div>
        <div class="center">{{totalNumber}}</div>
        <div class="end">人次</div>
      </div>

      <div class="chart">
        <div class="head">
          <div class="title1">
            <!-- <span class="bold">{{diasease}}</span> -->
            <el-select v-model="type" placeholder="请选择" size="mini">
              <el-option label="高血压" value="高血压"></el-option>
              <el-option label="糖尿病" value="糖尿病"></el-option>
              <el-option label="心脏病" value="心脏病"></el-option>
            </el-select>
            <span style="marginLeft:2px">就医人数</span>
          </div>
          <div class="type">
            <el-radio-group v-model="stage" size="mini">
              <el-radio-button label="日"></el-radio-button>
              <el-radio-button label="周"></el-radio-button>
              <el-radio-button label="月"></el-radio-button>

              <el-radio-button label="年"></el-radio-button>
            </el-radio-group>
          </div>
        </div>

        <v-chart :options="options"></v-chart>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      stage: '日',
      totalNumber: 40037987,
      options: {},
      diasease: '高血压',
      type: "高血压"
    }
  },
  watch: {
    type: function () {
      if (this.type === "糖尿病") {
        this.groupData = [2887, 3319, 1401, 3666, 4255, 5120, 2807, 3178, 1600, 3350, 2440, 3840, 2000]
        this.totalNumber = 34637152
        this.diasease = this.type

        this.options = this.renderOptions(this.groupData, this.xAxis)
      } else {
        this.groupData = [2867, 3219, 1901, 3566, 4355, 5420, 2907, 3278, 2200, 3350, 2140, 3540, 2400]
        this.diasease = this.type
        this.totalNumber = 40037987


        this.options = this.renderOptions(this.groupData, this.xAxis)
      }
    },
    stage (newStage) {
      if (newStage === '年') {
        this.groupData = [2887, 3319, 1401, 3666, 4255, 5120, 2807, 3178, 1600, 3350, 2440, 3840, 2000]
        this.totalNumber = 1564982216
        this.diasease = this.type
        this.xAxis = ['2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021']
      } else if (newStage === '月') {
        this.groupData = [2867, 3219, 1901, 3566, 4355, 5420, 2907, 3278, 2200, 3350, 2140, 3540, 2400]

        this.totalNumber = 16546012
        this.diasease = this.type
        this.xAxis = ['四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月', '一月', '二月', '三月']
      } else if (newStage === '周') {
        this.groupData = [2887, 3319, 1401, 3666, 4255]
        this.totalNumber = 1564651
        this.diasease = this.type
        this.xAxis = ['第一周', '第二周', '第三周', '第四周', '第五周',]

      } else {
        this.groupData = [2887, 3319, 1401, 3666, 4255, 5120, 2807, 3178, 1600, 3350, 2440, 3840, 2000]
        this.totalNumber = 34637152
        this.diasease = this.type
        this.xAxis = [
          '8:00',
          '9:00',
          '10:00',
          '11:00',
          '12:00',
          '13:00',
          '14:00',
          '15:00',
          '16:00',
          '17:00',
          '18:00',
          '19:00',
          '20:00',

        ]
      }
      this.options = this.renderOptions(this.groupData, this.xAxis)


    }

  },
  methods: {
    renderOptions (data, axis) {
      return {
        xAxis: {
          type: 'category',
          data: axis,
          axisTick: {
            alignWithLabel: true
          },
          axisLine: {
            lineStyle: {
              color: '#999'
            }
          },
          axisLabel: {
            color: 'white',
            fontSize: 10
          }
        },
        title: {

          textStyle: {
            fontSize: 12,
            color: '#666'
          },
          left: 25,
          top: 20
        },

        yAxis: {
          axisLine: {
            show: false
          },
          axisTick: {
            show: false
          },
          splitLine: {
            lineStyle: {
              color: '#333'
            },
            show: true
          },
          axisLabel: {
            color: 'white',
            fontSize: 10,
            show: true


          }
        },
        tooltip: {
          trigger: 'item',
          formatter: function (params) {
            return '访问人数' + params.data
          }
        },
        series: [{
          type: 'line',
          animation: true,
          animationDuration: 2000,
          data,
          barWidth: "30%",
          label: {
            show: false,
            position: 'top',
            distance: 5,
            fontSize: 11,

            color: "#D7A717"
          },

          itemStyle: {
            normal: {
              color: "#02CDE6"
            }


          }

        }],
        color: ['#BBBBBB', '#009ECA', '#74fbf5', '#A3D2F6', '#B2EAC0',],
        grid: {
          top: 20,
          left: 40,
          right: 10,
          bottom: 30
        }
      }
    }
  },
  mounted () {
    this.groupData = [2867, 3219, 1901, 3566, 4355, 5420, 2907, 3278, 2200, 3350, 2140, 3540, 2400]
    this.xAxis = [
      '8:00',
      '9:00',
      '10:00',
      '11:00',
      '12:00',
      '13:00',
      '14:00',
      '15:00',
      '16:00',
      '17:00',
      '18:00',
      '19:00',
      '20:00',

    ]
    this.options = this.renderOptions(this.groupData, this.xAxis)
  }
}
</script>

<style lang="scss" scoped>
.total-people {
  width: 100%;
  height: 100%;
  border: 1px solid #237dbf;
  color: #237dbf;

  .title {
    display: flex;
    width: 100%;
    height: 8%;
    justify-content: center;
    align-items: center;
    font-size: 16px;
    font-weight: bold;
    color: #237dbf;
    background: #051d3f;
  }

  .main {
    height: 90%;
    background: #093068c4;
    .total {
      display: flex;
      height: 26%;
      width: 100%;
      justify-content: center;
      align-items: center;
      .pre,
      .end {
        font-size: 12px;
        letter-spacing: 1px;
      }
      .pre {
        margin-right: 10px;
      }
      .end {
        margin-left: 10px;
      }
      .center {
        font-size: 20px;
        letter-spacing: 2px;
        color: #ffff20;
        font-weight: 600;
      }
    }
    .chart {
      width: 100%;
      height: 74%;
      .head {
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 30px;
        .title1 {
          color: white;
          font-size: 13px;
          margin-left: 6px;
        }
        .type {
          margin-right: 4px;
        }
      }
      .echarts {
        width: 100%;
        height: calc(100% - 30px);
      }
    }
  }
}
::v-deep .el-input__inner {
  width: 83px !important;
  background-color: #072c61;
  border-color: #eee;
  color: #eee;
}
</style>
