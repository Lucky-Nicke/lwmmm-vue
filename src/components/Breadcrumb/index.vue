<template>
  <el-breadcrumb class="app-breadcrumb" separator="/">
    <transition-group name="breadcrumb">
      <el-breadcrumb-item v-for="(item, index) in levelList" :key="item.path">
        <!-- 添加 class 控制非活跃链接 -->
        <span
          v-if="item.redirect === 'noRedirect' || index == levelList.length - 1"
          class="no-redirect custom-breadcrumb-text"
          >{{ item.meta.title }}</span
        >
        <!-- 添加 class 控制活跃链接 -->
        <a
          v-else
          @click.prevent="handleLink(item)"
          class="custom-breadcrumb-link"
          >{{ item.meta.title }}</a
        >
      </el-breadcrumb-item>
    </transition-group>
  </el-breadcrumb>
</template>

<script>
import pathToRegexp from "path-to-regexp";

export default {
  data() {
    return {
      levelList: null,
    };
  },
  watch: {
    $route() {
      this.getBreadcrumb();
    },
  },
  created() {
    this.getBreadcrumb();
  },
  methods: {
    getBreadcrumb() {
      // only show routes with meta.title
      let matched = this.$route.matched.filter(
        (item) => item.meta && item.meta.title
      );
      const first = matched[0];

      if (!this.isDashboard(first)) {
        matched = [
          { path: "/dashboard", meta: { title: "影视管理系统" } },
        ].concat(matched);
      }

      this.levelList = matched.filter(
        (item) => item.meta && item.meta.title && item.meta.breadcrumb !== false
      );
    },
    isDashboard(route) {
      const name = route && route.name;
      if (!name) {
        return false;
      }
      return (
        name.trim().toLocaleLowerCase() === "Dashboard".toLocaleLowerCase()
      );
    },
    pathCompile(path) {
      // To solve this problem https://github.com/PanJiaChen/vue-element-admin/issues/561
      const { params } = this.$route;
      var toPath = pathToRegexp.compile(path);
      return toPath(params);
    },
    handleLink(item) {
      const { redirect, path } = item;
      if (redirect) {
        this.$router.push(redirect);
        return;
      }
      this.$router.push(this.pathCompile(path));
    },
  },
};
</script>

<style lang="scss" scoped>
// 注意 scoped 属性，确保样式只影响当前组件
.app-breadcrumb.el-breadcrumb {
  display: inline-block;
  // font-size: 14px; // 可选：修改字体大小
  line-height: 50px;
  margin-left: 8px;

  // 2. 保留原有的 .no-redirect 样式（用于最后一个非可点击项）
  .no-redirect {
    // 如果上面的 .el-breadcrumb__inner 规则设置了通用颜色，
    // 这里可以覆盖它，或者如果你希望最后一个也遵循通用颜色，可以删除这行。
    color: #bfcbd9; // 原来的颜色
    cursor: text; // 保持不可点击的光标样式
  }
}

// 单独设置可点击链接的颜色（如果有不同需求）
.custom-breadcrumb-link {
  color: #bfcbd9; // 如果想和不可点击的不同，取消注释并修改
  cursor: pointer;

  &:hover {
    color: #409eff !important; // 悬停颜色
  }
}
</style>
