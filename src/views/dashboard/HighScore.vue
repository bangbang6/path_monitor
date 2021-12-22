<template>
  <div class="trans-list">
    <div class="title">
      <span>></span>
      <span class="light" style="margin-right: 5px;color: #237dbf">></span>
      各指标得分前10
      <span class="light" style="margin-left: 5px;color: #237dbf">&nbsp<</span>
      <span><</span>
    </div>
    <div class="list">
      <div class="list-title">
        <div class="department">指标分类</div>
        <div class="department">指标名称</div>
        <div class="earlyWarningMonthly">指标得分</div>
        <div class="earlyWarningNumberToday">指标平均分对比</div>
      </div>
      <div class="list-item" v-for="(item,index) in list" :key="index" @click="handleClick(index)">
        <div class="department">{{item.category}}</div>
        <div class="earlyWarningMonthly overflow">{{item.name}}</div>
        <div class="earlyWarningNumberToday overflow">{{item.newScore}}</div>
        <div class="timeUpdate overflow">
          <i class="el-icon-top" v-if="item.average>0"></i>
          <i class="el-icon-bottom" v-if="item.average<0" style="color:red"></i>
          <span :class="{redColor:item.average<0}">{{item.average.toString().replace('-','')}}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  data () {
    return {
      list: [
        { category: "功能定位", name: "门诊人次数与出院人次数比", oldScore: 8.96, newScore: 9.13, difference: 0.16, average: 0.02 },
        { category: "功能定位", name: "下转患者人次数（门急诊、住院）", oldScore: 7.35, newScore: 6.84, difference: -0.16, average: -1.20 },
        { category: "功能定位", name: "日间手术占择期手术比例", oldScore: 8.77, newScore: 8.54, difference: -0.16, average: 1.11 },
        { category: "质量安全", name: "低风险组病例死亡率", oldScore: 6.12, newScore: 6.71, difference: 0.16, average: 0.72 },
        { category: "质量安全", name: "优质护理服务病房覆盖率", oldScore: 8.76, newScore: 9.03, difference: 0.16, average: -1.68 },
        { category: "合理用药", name: "点评处方占处方总数的比例", oldScore: 6.93, newScore: 6.89, difference: -0.16, average: 1.28 },
        { category: "收支结构", name: "门诊收入占医疗收入比例", oldScore: 9.53, newScore: 7.15, difference: -0.16, average: 0.76 },
        { category: "人才培养", name: "医院承担培养医学人才的工作成效", oldScore: 9.85, newScore: 7.55, difference: 0.16, average: 0.84 },
        { category: "学科建设", name: "每百名卫生技术人员科研项目经费", oldScore: 9.54, newScore: 8.57, difference: 0.16, average: 1.54 },
        { category: "患者满意度", name: "住院患者满意度", oldScore: 6.31, newScore: 7.38, difference: -0.16, average: -1.31 },

      ]
    }
  },
  methods: {
    handleClick (index) {

    }
  }
}
</script>
<style lang="scss" scoped>
.trans-list {
  //   margin-left: 10px;
  //   margin-right: 10px;
  //   overflow-y: hidden;
  //   overflow: hidden;
  background: #093068c4;
  border: 1px solid #237dbf;

  height: 100%;
  width: 100%;
  box-sizing: border-box;
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
  .list {
    background-color: #093068c4;
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
    .list-item {
      display: flex;
      // border-bottom: 1px solid gray;
      // height: 12.5%;
      padding: 6px 20px 6px 0;
      align-items: center;
      div {
        flex: 1;
      }
      .department {
        color: #74fbf5;
        //flex: 1;
        // height: 12.5%;

        text-align: center;
        font-size: 10px;
      }
      .earlyWarningMonthly {
        color: #74fbf5;
        //flex: 1;
        // height: 12.5%;

        text-align: center;
        font-size: 10px;
      }
      .earlyWarningNumberToday {
        color: #74fbf5;
        //flex: 1;
        // height: 12.5%;

        text-align: center;
        font-size: 10px;
      }
      .timeUpdate {
        color: #74fbf5;
        //flex: 1;
        // height: 12.5%;

        text-align: center;
        font-size: 10px;
      }

      .dutyDirectorToday {
        text-align: center;
        color: #74fbf5;

        font-size: 10px;
      }
      .numberOfEmployeesToday {
        text-align: center;
        font-size: 10px;
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
</style>