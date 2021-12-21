<template>
  <div class="quality">
    <div class="head">
      <line-chart :scoreData="scoreData" :titleData="titleData" :colors="colors"></line-chart>
      <div class="average">
        <div class="one">
          <el-popover placement="top-start" width="160" trigger="hover" content="比平均值高0.02">
            <!-- <el-button slot="reference">hover 激活</el-button> -->
            <div slot="reference">功能定位:高</div>
          </el-popover>
        </div>
        <div class="two">
          <el-popover placement="top-start" width="160" trigger="hover" content="比平均值高低0.24">
            <!-- <el-button slot="reference">hover 激活</el-button> -->
            <div slot="reference">质量安全:低</div>
          </el-popover>
        </div>
        <div class="three">
          <el-popover placement="top-start" width="160" trigger="hover" content="比平均值高0.08">
            <!-- <el-button slot="reference">hover 激活</el-button> -->
            <div slot="reference">合理用药:高</div>
          </el-popover>
        </div>
        <div class="three">
          <el-popover placement="top-start" width="160" trigger="hover" content="比平均值低0.12">
            <!-- <el-button slot="reference">hover 激活</el-button> -->
            <div slot="reference">服务流程:低</div>
          </el-popover>
        </div>
      </div>
    </div>
    <div class="main">
      <div class="list">
        <div class="list-title">
          <div class="department">指标分类</div>
          <div class="earlyWarningMonthly">指标名称</div>
          <div class="earlyWarningNumberToday">去年得分</div>
          <div class="timeUpdate">今年得分</div>
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
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import lineChart from '@/components/lineChart'
import { forthData } from '@/mock'
const categorys = [{ label: '患者满意度', diff: '高', number: 0.02 }, { label: '医务人员满意度', diff: '高', number: 0.02 }]
const colors = ['#02CDE6', '#f58220']
const scoreData = [[8.6, 7.2, 8.8, 9.4, 9.2, 9.0], [7.6, 8.2, 7.4, 9.0, 8.1, 9.6], [7.8, 7.2, 8.1, 9.4, 8.6, 9.4],[9.1, 8.2, 8.4, 9.4, 8.6, 8.0]]
export default {
  components: { lineChart },
  data () {
    return {
      list: [],
      scoreData: scoreData.slice(0,2),
      titleData: categorys,
      colors: colors
    }
  },
  mounted () {
    this.list = forthData
  },
  methods: {
    colorStyle (item) {
      let styleBlock = {}
      categorys.forEach((ca, index) => {
        if (ca === item.category) {
          styleBlock = {
            color: colors[index]
          }
          return
        }

      })
      return styleBlock
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
</style>
