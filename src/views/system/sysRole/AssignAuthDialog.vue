<template>
  <div>
    <div style="padding: 10px 0">
      授权角色：{{ roleName }}
    </div>

    <el-tree
      style="margin: 20px 0"
      ref="tree"
      :data="sysMenuList"
      node-key="id"
      show-checkbox
      default-expand-all
      :props="defaultProps"
    />

    <div style="text-align: right">
      <el-button
        :loading="loading"
        type="primary"
        size="mini"
        @click="save"
      >
        保存
      </el-button>
    </div>
  </div>
</template>

<script>
import api from "@/api/menu/menu.js";

export default {
  name: "AssignAuthDialog",

  props: {
    roleId: {
      type: String,
      required: true,
    },
    roleName: {
      type: String,
      required: true,
    },
  },

  data() {
    return {
      loading: false,
      sysMenuList: [],
      defaultProps: {
        children: "children",
        label: "name",
      },
    };
  },

  watch: {
    roleId: {
      immediate: true,
      handler(val) {
        if (val) {
          this.fetchData();
        }
      },
    },
  },

  methods: {
    fetchData() {
      api.toAssign(this.roleId).then((result) => {
        const sysMenuList = result.data;
        this.sysMenuList = sysMenuList;

        this.$nextTick(() => {
          const checkedIds = this.getCheckedIds(sysMenuList);
          this.$refs.tree.setCheckedKeys(checkedIds);
        });
      });
    },

    getCheckedIds(auths, initArr = []) {
      auths.forEach((item) => {
        if (item.select && (!item.children || item.children.length === 0)) {
          initArr.push(item.id);
        }
        if (item.children && item.children.length > 0) {
          this.getCheckedIds(item.children, initArr);
        }
      });
      return initArr;
    },

    save() {
      const allCheckedNodes = this.$refs.tree.getCheckedNodes(false, true);
      let idList = allCheckedNodes.map((node) => node.id);

      let assginMenuVo = {
        roleId: this.roleId,
        menuIdList: idList,
      };

      this.loading = true;
      api.doAssign(assginMenuVo).then((result) => {
        this.loading = false;
        this.$message.success("分配权限成功");
        this.$emit("success"); // 通知父组件
      });
    },
  },
};
</script>