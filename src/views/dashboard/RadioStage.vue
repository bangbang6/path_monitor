<template>
  <div class="radio-stage">
    <el-radio-group v-model="timeStage" size="mini" @change="handleTimeStage">
      <el-radio-button label="年"></el-radio-button>
      <el-radio-button label="月"></el-radio-button>
      <el-radio-button label="周"></el-radio-button>
      <el-radio-button label="日"></el-radio-button>
    </el-radio-group>
  </div>
</template>
 
<script>
export default {
  data () {
    return {
      timeStage: '年',

    }
  },
  methods:{
    handleTimeStage (e) {
      this.$emit('changeStage',e)
    },
  }
}
</script>
 
<style lang="scss" scoped>
</style>