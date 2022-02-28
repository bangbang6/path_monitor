<template>
  <div class="china-map">
    <div class="title">
      <span>></span>
      <span class="light" style="margin-right: 5px;color: #237dbf">></span>
      全国医院健康豆及异常情况
      <span class="light" style="margin-left: 5px;color: #237dbf">&nbsp<</span>
      <span><</span>
    </div>
    <div class="main">
      <div class="list">
        <div class="item">
          <div class="name blue" style="color: white;font-size: 16px">区域名</div>
          <div class="quality blue" style="color: white;font-size: 16px">健康豆</div>
          <div class="efficiency blue" style="color: white;font-size: 16px">异常数</div>
          <div class="develop blue" style="color: white;font-size: 16px">预警说明</div>
        </div>
        <div
          class="item"
          v-for="(item,index) in hospitals"
          :class="{wei:index%2==0,lig:index%2!=0,red:index===colorindex}"
          :key="item.area"
        >
          <div class="name green" @click="hanleClick(item.name)">{{item.area}}</div>
          <div class="quality green">{{item.count}}</div>
          <div class="efficiency green">{{item.errorNumber}}</div>
          <div class="develop green">{{item.info}}</div>
        </div>
      </div>
      <div class="map">
        <order-map :area="area" />
      </div>
    </div>
  </div>
</template>

<script>
import OrderMap from './orderMap.vue'
export default {
  components: {
    OrderMap,
  },
  data () {

    return {
      colorindex: 0,
      area: "北京",
      hospitals: [

        { area: "北京", count: 460, errorNumber: 232, info: "异常数较多" },
        { area: "天津", count: 452, errorNumber: 152, info: "流感患者增加80%" },
        { area: "武汉", count: 328, errorNumber: 166, info: "慢性病增加26%" },
        { area: "上海", count: 689, errorNumber: 142, info: "无" },
        { area: "安阳", count: 489, errorNumber: 98, info: "无" },
        { area: "金华", count: 456, errorNumber: 74, info: "无" },
        { area: "吉林", count: 451, errorNumber: 93, info: "无" },
        { area: "西安", count: 356, errorNumber: 89, info: "无" },
        { area: "湘潭", count: 342, errorNumber: 84, info: "无" },

      ]
    }
  },
  methods: {
    hanleClick (name) {
      this.$router.push({
        path: "/dashboard",
        query: {
          hospital: name
        }
      })
    }
  },
  mounted () {
    let i = 0
    setInterval(() => {
      this.colorindex = i

      this.area = this.hospitals[i].area
      i = (i + 1) % 3

    }, 3000)
  }
}
</script>

<style lang="scss" scoped>
.china-map {
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
    background: #051d3f;
  }
  .wei {
    background-color: #051d3f;
  }
  .lig {
    background-color: #134980;
  }
  .main {
    width: 100%;
    height: 90%;
    background: #093068;
    display: flex;
    .list {
      padding: 5px;
      padding-top: 20px;
      box-sizing: border-box;
      width: 35%;
      .item {
        display: flex;
        //align-items: center;
        font-size: 16px;
        height: 10%;
        padding-top: 2px;
        padding-bottom: 2px;
        box-sizing: border-box;
        color: white;
        div {
          text-align: center;
          transform: scale(0.8);
        }
        .white {
          color: 'white' !important;
          font-size: 12px;
        }

        .name {
          flex: 20%;
          margin: auto;
          transform: scale(0.8);
        }
        .quality {
          flex: 18%;
          transform: scale(0.8);
          margin: auto;
        }
        .efficiency {
          transform: scale(0.8);
          flex: 18%;
          margin: auto;
        }
        .develop {
          flex: 22%;
          transform: scale(0.8);
          margin: auto;
          font-size: 14px;
        }
      }
    }
    .map {
      width: 65%;
      height: 100%;
      padding-left: 20px;
      box-sizing: border-box;
    }
  }
}
.blue {
  color: #168ce3 !important;
}
.green {
  color: #74fbf5;
}
.red {
  div {
    color: #ec3333 !important;
  }
}
</style>
