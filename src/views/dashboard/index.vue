<template>
  <div class="monitor">
    <div class="headWapper">
      <div class="head" style="position: relative">
        <div class="title">{{hospital}}</div>
      </div>
      <div class="head1"></div>
    </div>
    <div class="wrapper">
      <div class="navs">
        <div class="nav-item">
          <Card
            :number="allScore"
            word="总得分"
            desc="The Total Score"
            iconClass="icon-jiesuanhuizongfenxi"
          ></Card>
        </div>
        <div class="nav-item">
          <Card
            :number="qualityScore"
            word="医疗质量"
            desc="The Medical Quality Score"
            iconClass="icon-yiliaozhiliangfenxi"
          ></Card>
        </div>
        <div class="nav-item">
          <Card
            :number="efficiencyScore"
            word="运营效率"
            desc="The Operational Quality Score"
            iconClass="icon-yunyingxiaoshuai"
          ></Card>
        </div>
        <div class="nav-item">
          <Card
            :number="developmentScore"
            word="持续发展"
            desc="The Development Score"
            iconClass="icon-chixufazhan"
          ></Card>
        </div>

        <div class="nav-item">
          <Card
            :number="fullfiedScore"
            word="满意度"
            desc="The Satisfaction Score"
            iconClass="icon-manyidu1"
          ></Card>
        </div>
      </div>
      <div class="center">
        <div class="input-output">
          <score-radio></score-radio>
        </div>

        <div class="salary">
          <high-score></high-score>
        </div>
        <div class="earlyWarnings">
          <low-score></low-score>
        </div>
      </div>
      <div class="bottom">
        <div class="percentage">
          <score-die></score-die>
        </div>
        <div class="yuyue">
          <trency-line></trency-line>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import Card from './Card'
import HighScore from './HighScore.vue'
import LowScore from './LowScore.vue'
import ScoreDie from './ScoreDie.vue'
import ScoreRadio from './ScoreRadio.vue'
import TrencyLine from './TrencyLine.vue'

export default {
  components: { Card, ScoreRadio, HighScore, LowScore, ScoreDie, TrencyLine },

  data () {
    return {

      hospital: "",
      allScore: 35.46,
      fullfiedScore: 8.24,
      developmentScore: 9.12,
      efficiencyScore: 8.42,
      qualityScore: 9.68,

    }
  },
  mounted () {
    const hospital = this.$route.query.hospital || "智慧医疗质量指标监管平台"
    this.hospital = hospital

  }
}
</script>
<style scoped >
/deep/ .el-card__body {
  padding: 0;
}
</style>
<style lang="scss" scoped>
.monitor {
  width: 100%;
  min-height: calc(100vh - 50px);
  background: #011c47;
  .headWapper {
    height: 12vh;
    width: 100%;
    z-index: 2;
    .head {
      height: 12%;
      width: 50%;
      display: flex;
      margin-left: 25%;
      justify-content: center;
      align-items: center;
      //background: url("component/img/header.png");
      background-size: 100% 100%;
      border-top: 80px solid #011c47;
      border-left: 50px solid transparent;
      border-right: 50px solid transparent;

      z-index: 999;
      display: flex;

      .title {
        margin-top: -10%;
        color: white;
        font-size: 32px;
        font-weight: bold;
      }
      .sub-title {
        color: white;

        margin-top: -8%;
        font-size: 20px;
        font-weight: bold;
        margin-left: 20px;
      }
    }
    .head1 {
      height: 12%;
      width: 50%;
      display: flex;
      margin-left: 25%;
      justify-content: center;
      align-items: center;
      //background: url("component/img/header.png");
      background-size: 100% 100%;
      border-top: 80px solid #3a77e6;
      border-left: 50px solid transparent;
      border-right: 50px solid transparent;
      color: white;
      font-size: 32px;
      font-weight: bold;
      position: absolute;
      top: 1px;
      z-index: 777;
    }
    .tra1 {
      position: absolute;
      top: 0;
      height: 5%;
      width: 100%;
      background: #011c47;
      border-bottom: 1px solid #3a77e6;
      z-index: 888;
      display: flex;
      align-items: center;
      .block {
        color: white;
        font-size: 16px;
        position: absolute;
        width: 100px;

        right: 180px;
      }
      .node {
        color: white;
        font-size: 16px;
        position: absolute;

        width: 120px;
        right: 20px;
      }
      .notice {
        color: #f35833;
        font-size: 16px;
        position: absolute;

        left: 20px;
      }
    }
  }

  .wrapper {
    height: calc(88vh - 50px);
    width: 96%;
    margin-left: 2%;
    padding-top: 10px;
    box-sizing: border-box;
    .navs {
      height: 15%;
      display: flex;
      width: 100%;
      margin-left: 2%;
      .nav-item {
        display: flex;
        flex: 1;
        background-color: #011c47;
        color: white;
        border: #011c47 solid 1px;
        .el-card {
          border: #011c47 solid 1px;
        }
      }
    }
    .center {
      height: 40%;
      display: flex;
      padding-top: 10px;
      box-sizing: border-box;
      .input-output {
        width: 40%;

        flex: 1 0 40%;
        background: red;
        margin-right: 5px;
      }
      .salary {
        width: 30%;

        flex: 1 0 30%;
        background: #081326;
        margin-left: 2px;
        margin-right: 5px;
      }
      .earlyWarnings {
        width: 30%;
        flex: 1 0 30%;
        background: #081326;
        margin-left: 2px;
        margin-right: 5px;
      }

      /* .error {
        flex: 1 0 20%;
        background: #081326;
        margin-left: 2px;
        margin-right: 5px;
      } */
    }
    .bottom {
      height: 40%;
      display: flex;
      padding-top: 10px;
      box-sizing: border-box;
      .percentage {
        background: #081326;
        flex: 1 0 50%;
        margin-right: 5px;
      }
      .yuyue {
        flex: 1 0 50%;
        background: #081326;
        margin-left: 2px;
        margin-right: 5px;
      }
    }
  }
}
</style>
