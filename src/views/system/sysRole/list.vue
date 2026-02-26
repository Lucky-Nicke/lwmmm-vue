<template>
  <div>
    <!-- 搜索栏 -->
    <div class="search-div">
      <el-form label-width="70px" size="small">
        <el-row>
          <el-col :span="24">
            <el-form-item label="角色名称">
              <el-input
                style="width: 100%"
                v-model="searchObj.roleName"
                placeholder="角色名称"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row style="display: flex">
          <el-button
            type="primary"
            icon="el-icon-search"
            size="mini"
            @click="fetchData(1)"
            >搜索</el-button
          >
          <el-button icon="el-icon-refresh" size="mini" @click="resetData"
            >重置</el-button
          >
        </el-row>
      </el-form>
    </div>

    <!-- 添加、批量删除按钮 -->
    <div class="tools-div">
      <el-button type="success" icon="el-icon-plus" size="mini" @click="add"
        >添 加</el-button
      >
      <el-button class="btn-add" size="mini" @click="batchRemove()"
        >批量删除</el-button
      >
    </div>

    <!-- 表格 -->
    <el-table
      :data="list"
      stripe
      border
      style="width: 100%; margin-top: 10px"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55"> </el-table-column>
      <el-table-column label="序号" width="70" align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>

      <el-table-column prop="roleName" label="角色名称" />
      <el-table-column prop="roleCode" label="角色编码" />
      <el-table-column prop="createTime" label="创建时间" width="160" />
      <el-table-column label="操作" align="center" fixed="right">
        <template slot-scope="scope">
          <el-button
            type="primary"
            icon="el-icon-edit"
            size="mini"
            @click="edit(scope.row.id)"
            title="修改"
          />
          <el-button
            type="danger"
            icon="el-icon-delete"
            size="mini"
            @click="removeDataById(scope.row.id)"
            title="删除"
          />
          <el-button
            type="warning"
            icon="el-icon-baseball"
            size="mini"
            @click="showAssignAuth(scope.row)"
            title="分配权限"
          />
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页插件 -->
    <el-pagination
      :current-page="page"
      :page-size="limit"
      layout="total, sizes, prev,pager, next, jumper"
      style="padding: 30px 0; text-align: center"
      @current-change="fetchData"
      :total="total"
      @size-change="handleSizeChange"
      :page-sizes="[5, 10, 20]"
    >
    </el-pagination>

    <!-- 添加/编辑表单弹窗 -->
    <el-dialog title="添加/修改" :visible.sync="dialogVisible" width="40%">
      <el-form
        ref="dataForm"
        :model="sysRole"
        label-width="150px"
        v-loading="dialogLoading"
        :rules="rules"
        size="small"
        style="padding-right: 40px"
      >
        <el-form-item label="角色名称" prop="roleName">
          <el-input v-model="sysRole.roleName" />
        </el-form-item>
        <el-form-item label="角色编码" prop="roleCode">
          <el-input v-model="sysRole.roleCode" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button
          @click="dialogVisible = false"
          size="small"
          icon="el-icon-refresh-right"
          >取 消</el-button
        >
        <el-button
          type="primary"
          icon="el-icon-check"
          @click="saveOrUpdate()"
          size="small"
          >确 定</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>

<script>
import api from "@/api/role/role.js";

export default {
  data() {
    return {
      list: [],
      total: 0,
      page: 1,
      limit: 5,
      searchObj: {},
      sysRole: {},
      listLoading: true,
      dialogVisible: false,
      multipleSelection: [],
      dialogLoading: false,
      rules: {
        roleName: [
          { required: true, message: "请输入角色名称", trigger: "blur" },
        ],
        roleCode: [
          { required: true, message: "请输入角色编码", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.fetchData(1);
  },
  methods: {
    // 处理每页显示条数变化
    handleSizeChange(val) {
      this.limit = val; // 更新每页显示条数
      this.fetchData(1); // 重置页码为1并重新获取数据
    },
    fetchData(pageNum) {
      this.page = pageNum;
      api
        .getPageList(this.page, this.limit, this.searchObj)
        .then((response) => {
          //   console.log(response);
          this.list = response.data.records;
          this.total = response.data.total;
        });
    },
    resetData() {
      // 清空表单
      this.searchObj = {};
      // 再次刷新列表数据
      this.fetchData(1);
    },
    removeDataById(id) {
      this.$confirm("此操作将永久删除该用户, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        api.removeById([id]).then((response) => {
          this.$message({
            type: "success",
            message: "删除成功!",
          });
          // 刷新页面
          this.fetchData(1);
        });
      });
    },
    // 打开弹框
    add() {
      // 将 控制弹框的 属性设置为 true
      this.dialogVisible = true;
      // 清空表单
      this.sysRole = {};

      // 等待 DOM 更新后清除验证提示
      this.$nextTick(() => {
        if (this.$refs.dataForm) {
          this.$refs.dataForm.clearValidate();
        }
      });
    },
    //判断是更新还是添加
    saveOrUpdate() {
      // 使用表单引用的 validate 方法
      this.$refs.dataForm.validate((valid) => {
        if (valid) {
          // 校验通过，执行原有逻辑
          if (this.sysRole.id != null) {
            this.updateRole();
          } else {
            this.addRole();
          }
        } else {
          // 校验不通过，不执行任何操作，直接返回
          return false;
        }
      });
    },
    // 实现添加功能
    addRole() {
      api.saveRole(this.sysRole).then((response) => {
        //给出提示框
        this.$message({
          type: "success",
          message: "添加角色成功!",
        });
        // 关闭添加弹框
        this.dialogVisible = false;
        // 再次刷新数据
        this.fetchData(1);
      });
    },
    updateRole() {
      api.updateRole(this.sysRole).then((response) => {
        this.$message({
          type: "success",
          message: "修改成功!",
        });
        // 关闭弹框
        this.dialogVisible = false;
        // 刷新数据
        this.fetchData(1);
      });
    },
    // 根据id去回显数据
    edit(id) {
      //1.弹框
      this.dialogVisible = true;

      // 开启加载动画，并清空旧数据防止“闪烁”
      this.dialogLoading = true;
      this.sysRole = {};

      // 确保DOM更新后，清除可能产生的验证红字
      this.$nextTick(() => {
        if (this.$refs.dataForm) {
          this.$refs.dataForm.clearValidate();
        }
      });

      //2.赋值
      api
        .getRoleById(id)
        .then((response) => {
          // 4. 数据返回，赋值
          this.sysRole = response.data;

          // 5. 关闭加载动画
          this.dialogLoading = false;
        })
        .catch((err) => {
          // 如果请求失败，也要关闭加载动画，否则会一直转圈
          this.dialogLoading = false;
        });
    },
    //复选框
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    //批量删除
    batchRemove() {
      if (this.multipleSelection.length == 0) {
        this.$message.warning("请选择要删除的记录！");
        return;
      }
      this.$confirm("此操作将永久删除该用户, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        var ids = [];
        for (var i = 0; i < this.multipleSelection.length; i++) {
          var obj = this.multipleSelection[i];
          // 获取id值
          var id = obj.id;
          // 将id放进到数组中
          ids.push(id);
        }
        api.bactchremoveId(ids).then((response) => {
          // 提示
          this.$message({
            type: "success",
            message: "删除成功!",
          });
          // 刷新页面
          this.fetchData(1);
        });
      });
    },
    showAssignAuth(row) {
      this.$router.push(
        "/system/assignAuth?id=" + row.id + "&roleName=" + row.roleName
      );
    },
  },
};
</script>

<style>
</style>