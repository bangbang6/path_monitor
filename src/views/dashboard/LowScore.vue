<template>
  <div class="trans-list">
    <div class="title">
      <span>></span>
      <span class="light" style="margin-right: 5px;color: #237dbf">></span>
      各指标得分后10
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
        { category: "质量安全", name: "通过国家室间质量评价的临床检验项目数", oldScore: 4.25, newScore: 4.77, difference: -0.16, average: 1.37 },
        { category: "质量安全", name: "低风险组病例死亡率", oldScore: 6.12, newScore: 6.71, difference: 0.16, average: 0.72 },
        { category: "质量安全", name: "优质护理服务病房覆盖率", oldScore: 8.76, newScore: 9.03, difference: 0.16, average: -1.68 },
        { category: "合理用药", name: "点评处方占处方总数的比例", oldScore: 6.93, newScore: 6.89, difference: -0.16, average: 1.28 },
        { category: "合理用药", name: "抗菌药物使用强度（DDDs）", oldScore: 7.85, newScore: 7.69, difference: 0.16, average: 1.31 },
        { category: "收支结构", name: "住院收入中来自医保基金的比例", oldScore: 8.08, newScore: 7.10, difference: 0.16, average: 1.74 },
        { category: "收支结构", name: "医疗服务收入（不含药品、耗材、检查检验收入）占医疗收入比例", oldScore: 5.31, newScore: 7.80, difference: 0.16, average: 1.36 },
        { category: "医务人员满意度", name: "医务人员满意度", oldScore: 6.48, newScore: 8.12, difference: -0.16, average: 1.93 },

        { category: "人员结构", name: "医护比", oldScore: 7.74, newScore: 6.52, difference: -0.16, average: 1.81 },
        { category: "人才培养", name: "医院接受其他医院（尤其是对口支援医院、医联体内医院）进修并返回原医院独立工作人数占比", oldScore: 9.51, newScore: 7.37, difference: 0.16, average: -0.33 },

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