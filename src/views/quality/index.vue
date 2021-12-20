<template>
  <div class="quality">
    <div class="head">
      <line-chart></line-chart>
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
        <div class="list-item" v-for="(item,index) in list" :key="index">
          <div class="department">{{item.category}}</div>
          <div class="earlyWarningMonthly overflow">{{item.name}}</div>
          <div class="earlyWarningNumberToday overflow">{{item.oldScore}}</div>
          <div class="timeUpdate overflow">{{item.newScore}}</div>
          <div class="dutyDirectorToday overflow">{{item.difference}}</div>
          <div class="numberOfEmployeesToday overflow">{{item.average}}</div>
        </div>
      </div>
    </div>
  </div>
</template>
 
<script>
import lineChart from '@/components/lineChart'
import { firstData } from '@/mock'
export default {
  components: { lineChart },
  data () {
    return {
      list: []
    }
  },
  mounted () {
    this.list = firstData
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
      overflow: hidden;

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
        }
        .department {
          color: #74fbf5;
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 12px;
        }
        .earlyWarningMonthly {
          color: #74fbf5;
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 12px;
        }
        .earlyWarningNumberToday {
          color: #74fbf5;
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 12px;
        }
        .timeUpdate {
          color: #74fbf5;
          //flex: 1;
          // height: 12.5%;

          text-align: center;
          font-size: 12px;
        }

        .dutyDirectorToday {
          text-align: center;
          color: #74fbf5;

          font-size: 12px;
        }
        .numberOfEmployeesToday {
          text-align: center;
          font-size: 12px;
          color: #74fbf5;
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