<template>
  <div class="quality">
    <div class="head">
      <line-chart :scoreData="scoreData" :titleData="titleData" :colors="colors"></line-chart>
    </div>
    <div class="main">
      <div class="list">
        <div class="list-title">
          <div class="department">指标分类</div>
          <div class="earlyWarningMonthly">指标名称</div>
          <div class="earlyWarningNumberToday">去年得分</div>
          <div class="timeUpdate">
            今年得分
            <span class="caret-wrapper">
              <i
                class="sort-caret ascending"
                @click="sortScore('asc')"
                :class="{active1:isActive1}"
              ></i>
              <i
                class="sort-caret descending"
                @click="sortScore('desc')"
                :class="{active2:isActive2}"
              ></i>
            </span>
          </div>
          <div class="dutyDirectorToday">得分变化</div>
          <div class="numberOfEmployeesToday">与平均值相比</div>
        </div>
        <div class="list-item" v-for="(item,index) in list" :key="index" :style="colorStyle(item)">
          <div class="department">{{item.category}}</div>
          <div class="earlyWarningMonthly overflow">{{item.name}}</div>
          <div class="earlyWarningNumberToday overflow">{{item.oldScore}}</div>
          <div class="timeUpdate overflow">{{item.newScore}}</div>
          <div class="dutyDirectorToday overflow">
            <i class="el-icon-top" v-if="(item.newScore-item.oldScore)>0"></i>
            <i class="el-icon-bottom" v-if="(item.newScore-item.oldScore)<0" style="color:red"></i>
            <span
              :class="{redColor:(item.newScore-item.oldScore)<0}"
            >{{(item.newScore-item.oldScore).toFixed(2).toString().replace('-','')}}</span>
          </div>
          <div class="numberOfEmployeesToday overflow">
            <i class="el-icon-top" v-if="item.average>0"></i>
            <i class="el-icon-bottom" v-if="item.average<0" style="color:red"></i>
            <span :class="{redColor:item.average<0}">{{item.average.toString().replace('-','')}}</span>
          </div>
          <i class="el-icon-s-data" :style="{cursor:'pointer'}" @click="handleShowChart(index)"></i>
        </div>
      </div>
    </div>
    <el-dialog title="各时间段分数" :visible.sync="showChart" width="80%">
      <line-chart :titleData="smallCategorys" :scoreData="smallScoreData" :colors="colors"></line-chart>
    </el-dialog>
  </div>
</template>

<script>
import lineChart from '@/components/lineChart'
import { thirdData } from '@/mock'
const categorys = [{ label: '人员结构', diff: '高', number: 0.02 }, { label: '人才培养', diff: '高', number: 0.02 }, { label: '学科建设', diff: '低', number: 0.02 }]
const colors = ['#02CDE6', '#f58220', '#1DE9B6']
const scoreData = [[8.1, 9.0, 7.9, 7.6, 8.1, 7.2], [7.9, 7.9, 7.7, 8.2, 8.5, 9.2], [9.1, 7.8, 7.5, 8.4, 7.7, 8.4]]

export default {
  components: { lineChart },
  data () {
    return {
      list: [],
      titleData: categorys,
      colors: colors,
      showChart: false,

      scoreData: scoreData.slice(0, 3),
      isActive1: false,
      isActive2: false,
      smallCategorys: [],
      smallScoreData: []

    }
  },
  mounted () {
    this.list = thirdData
  },
  methods: {
    colorStyle (item) {
      let styleBlock = {}
      categorys.forEach((ca, index) => {
        if (ca.label === item.category) {
          styleBlock = {
            color: colors[index]
          }
          return
        }

      })
      return styleBlock
    },
    handleShowChart (index) {
      console.log('index', index);
      this.smallScoreData = [[8.6, 7.1, 8.8, 9.4, 9.2, 9.1]]
      this.smallCategorys = [{ label: this.list[index].name, diff: '高', number: 0.02 }]
      this.showChart = true
    },
    sortScore (type) {
      if (type === 'asc') {
        //正常递增顺序
        this.list = this.list.sort((a, b) => a.newScore - b.newScore)
        this.isActive1 = true
        this.isActive2 = false
      } else {
        this.list = this.list.sort((a, b) => b.newScore - a.newScore)
        this.isActive2 = true
        this.isActive1 = false
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.quality {
  padding: 30px;
  box-sizing: border-box;
  width: 100%;
  height: calc(100vh - 50px);
  background: #011c47;

  .head {
    width: 100%;
    height: 40%;
    position: relative;
    .average {
      position: absolute;
      right: 20px;
      top: 6px;
      display: flex;
      color: white;
      font-size: 12px;
      div {
        margin-left: 10px;
      }
    }
  }
  .main {
    width: 100%;
    height: 60%;
    padding-top: 10px;
    box-sizing: border-box;
    .list {
      background-color: #09306800;
      padding-left: 10px;
      box-sizing: border-box;
      height: 90%;
      overflow: auto;
      &::-webkit-scrollbar {
        display: none;
      }
      color: rgb(255, 255, 255);
      .title {
        color: #168ce3 !important;
        font-weight: 600;
      }
      .list-title {
        display: flex;
        border-bottom: 1px solid gray;
        // height: 12.5%;
        padding: 6px 20px 6px 0;
        align-items: center;
        div {
          flex: 1;
        }

        .department {
          color: #168ce3;
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 13px;
        }
        .earlyWarningMonthly {
          color: #168ce3;
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 13px;
        }
        .earlyWarningNumberToday {
          color: #168ce3;
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 13px;
        }
        .timeUpdate {
          color: #168ce3;
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 13px;
          .caret-wrapper {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            height: 34px;
            width: 24px;
            vertical-align: middle;
            cursor: pointer;
            overflow: initial;
            position: relative;
            .sort-caret {
              width: 0;
              height: 0;
              border: 5px solid transparent;
              position: absolute;
              left: 7px;
            }
            .ascending {
              border-bottom-color: #c0c4cc;
              top: 5px;
            }
            .descending {
              border-top-color: #c0c4cc;
              bottom: 7px;
            }
            .active1 {
              border-bottom-color: #409eff;
            }
            .active2 {
              border-top-color: #409eff;
            }
          }
        }

        .dutyDirectorToday {
          text-align: center;
          color: #168ce3;

          font-size: 13px;
        }
        .numberOfEmployeesToday {
          text-align: center;
          font-size: 13px;
          color: #168ce3;
        }
        .overflow {
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        /* &:nth-child(odd) {
        background: #f2f2f2;
      }
      &:nth-child(even) {
        background: white;
      } */
        &.gray {
          color: gray;
        }
      }
      .list-item:nth-child(even) {
        background: #051d3f;
      }
      .list-item:nth-child(odd) {
        background: #134980;
      }
      .list-item {
        display: flex;
        // border-bottom: 1px solid gray;
        height: 8%;
        padding: 6px 4px 6px 0;
        box-sizing: border-box;
        align-items: center;

        div {
          flex: 1;
          text-align: center;

          .redColor {
            color: red;
          }
        }
        .department {
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 12px;
        }
        .earlyWarningMonthly {
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 12px;
        }
        .earlyWarningNumberToday {
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 12px;
        }
        .timeUpdate {
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 12px;
        }

        .dutyDirectorToday {
          text-align: center;

          font-size: 12px;
        }
        .numberOfEmployeesToday {
          text-align: center;
          font-size: 12px;
        }
        .overflow {
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        /* &:nth-child(odd) {
        background: #f2f2f2;
      }
      &:nth-child(even) {
        background: white;
      } */
        &.gray {
          color: gray;
        }
      }
    }
  }
}
::v-deep .el-dialog {
  height: 65vh;
  background: #011c47;
}
::v-deep .el-dialog__body {
  height: 100%;
}
::v-deep .el-dialog__title {
  color: white;
}
</style>
