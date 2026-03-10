<template>
  <div class="app-container">
    <div class="filter-container">
      <h2>这是一个普通的页面示例</h2>
      <p>这个页面遵循了 vue-admin-template 的基本布局和样式规范。</p>
    </div>

    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>页面功能区</span>
      </div>
      <div>
        <p>这里是页面的主要内容区域。</p>
        <p>你可以在这里放置表格、表单或其他任何组件。</p>
      </div>
    </el-card>

    <el-card class="box-card" style="margin-top: 20px">
      <div slot="header" class="clearfix">
        <span>操作按钮</span>
      </div>
      <div>
        <el-button type="primary" @click="handleClick">主要按钮</el-button>
        <el-button @click="handleReset">重置</el-button>
      </div>
    </el-card>
  </div>
</template>
  
  <script>
export default {
  name: "视频门户", // 组件名，最好和路由的 name 保持一致
  data() {
    return {
      // 在这里定义你的响应式数据
    };
  },
  methods: {
    handleClick() {
      this.$message({
        message: "按钮被点击了！",
        type: "success",
      });
    },
    handleReset() {
      this.$message.info("已重置");
    },
  },
};
</script>
  
  <style scoped>
/* 
    scoped 属性确保这些样式只作用于当前组件
    .app-container 是模板自带的容器类，提供了基础的内边距
  */
.box-card {
  /* 可以在这里添加卡片的自定义样式 */
}

.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}
</style>