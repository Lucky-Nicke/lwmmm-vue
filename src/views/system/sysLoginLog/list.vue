<template>
  <div class="app-container">
    <!-- 工具条 -->
    <div class="tools-div">
      <el-button
        :disabled="$hasBP('bnt.sysLoginLog.remove')"
        type="danger"
        round
        icon="el-icon-delete"
        size="small"
        @click="removeDataByIds()"
        title="删除"
        >批量删除</el-button
      >
    </div>
    <!-- 列表 -->
    <el-table
      ref="multipleTable"
      v-loading="listLoading"
      :data="list"
      @selection-change="handleSelectionChange"
      stripe
      border
      style="width: 100%; margin-top: 10px"
    >
      <el-table-column type="selection" width="55" /><!-- checkbox复选框 -->
      <el-table-column label="序号" width="70" algin="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>

      <el-table-column prop="username" label="登录账号" width="180" />
      <el-table-column prop="ipaddr" label="登录ip地址" width="180" />
      <el-table-column
        prop="status"
        label="登录状态"
        :formatter="statusformatter"
        width="180"
      />
      <el-table-column prop="msg" label="提示信息" width="180" />
      <el-table-column prop="createTime" label="创建时间" />

      <el-table-column label="操作" algin="center" fixed="right">
        <template slot-scope="scope">
          <el-button
            :disabled="$hasBP('bnt.sysLoginLog.remove')"
            type="danger"
            round
            icon="el-icon-delete"
            size="mini"
            @click="removeDataById(scope.row.id)"
            title="删除"
          />
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页组件
    监听页码改变事件
    @current-change="fetchData"
    监听条数改变事件
    @size-change="handleSizeChange"
    -->
    <el-pagination
      :current-page="page"
      :total="total"
      :page-sizes="[2, 5, 10]"
      :page-size="limit"
      style="padding: 30px 0; text-align: center"
      layout="total,sizes, prev, pager, next, jumper"
      @current-change="fetchData"
      @size-change="handleSizeChange"
    />
  </div>
</template>

<script>
import api from "@/api/log/user.js";

export default {
  data() {
    return {
      listLoading: true, // 数据是否正在加载
      list: [], // 数据列表
      // 当前页码
      page: 1,
      // 每次显示条数
      limit: 5,
      // 总记录数
      total: 0,
      // 多选按钮id数组
      multipleSelection: [],
      checkAll: false,
    };
  },
  created() {
    this.fetchData();
  },
  methods: {
    handleCheckAllChange(value) {
      // value 当前勾选状态true/false
      this.userRoleIds = value ? this.allRoles.map((item) => item.id) : [];
      // 如果当前不是全选也不全不选时, 指定为false
      this.isIndeterminate = false;
    },
    // 监听分页条数变更按钮
    handleSizeChange(val) {
      this.limit = Number(val);
      console.log("改分页：" + this.page);
      this.fetchData();
    },
    // 更新按钮id数组
    handleSelectionChange(val) {
      this.multipleSelection = val;
      // console.log(this.multipleSelection);
    },
    // 取消选中按钮
    toggleSelection(rows) {
      if (rows) {
        rows.forEach((row) => {
          this.$refs.multipleTable.toggleRowSelection(row);
        });
      } else {
        this.$refs.multipleTable.clearSelection();
      }
    },
    // 删除
    removeDataById(id) {
      this.$confirm("是否删除该纪录, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          console.log("delete");
          api.delLog(id).then((response) => {
            if (response.code == 200) {
              this.$message({
                type: "success",
                message: "删除成功",
                center: true,
              });
              this.fetchData();
            } else {
              this.$message({
                type: "error",
                message: response.message || "删除失败",
                center: true,
              });
            }
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
            center: true,
          });
        });
    },
    // 批量删除
    removeDataByIds() {
      if (this.multipleSelection.length == 0) {
        this.$message({
          message: "请勾选需要删除的列",
          type: "warning",
          center: true,
        });
        return;
      }
      this.$confirm("是否删除选中的纪录, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          var ids = [];
          for (var i = 0; i < this.multipleSelection.length; i++) {
            ids.push(this.multipleSelection[i].id);
            console.log(this.multipleSelection[i].id);
          }
          console.log(ids);
          api.batchdelLog(ids).then((response) => {
            if (response.code == 200) {
              this.$message({
                message: "删除成功",
                type: "success",
                center: true,
              });
              // 再次刷新列表
              this.fetchData();
            } else {
              this.$message({
                message: response.message || "删除失败",
                type: "error",
                center: true,
              });
            }
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
            center: true,
          });
        });
    },
    // 刷新列表
    fetchData(page) {
      // this.page = page;
      if (page != null) this.page = page;
      if (this.createTimes && this.createTimes.length == 2) {
        this.searchObj.createTimeBegin = this.createTimes[0];
        this.searchObj.createTimeEnd = this.createTimes[1];
      }

      api.getLogPageList(this.page, this.limit).then((response) => {
        console.log(response.data.records);
        var list1 = response.data.records;
        for (var i = 0; i < list1.length; i++) {
          list1[i].status = String(list1[i].status);
        }
        this.list = list1;
        this.total = response.data.total;
        // 数据加载并绑定成功
        this.listLoading = false;
      });
    },
    //重置表单
    resetData() {
      // 1.清空条件搜索
      this.searchObj = {};
      //2.清空日期条件
      this.createTimes = [];
      //3.刷新数据列表
      this.fetchData();
    },

    /*
   列表选中项发生改变的监听
   */
    handleCheckedChange(value) {
      const { userRoleIds, allRoles } = this;
      this.checkAll =
        userRoleIds.length === allRoles.length && allRoles.length > 0;
      this.isIndeterminate =
        userRoleIds.length > 0 && userRoleIds.length < allRoles.length;
    },

    statusformatter(row) {
      if (row.status == 0) {
        return "失败";
      } else if (row.status == 1) {
        return "成功";
      }
    },
  },
};
</script>

<style>
</style>