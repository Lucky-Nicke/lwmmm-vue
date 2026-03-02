<template>
  <div>
    <!-- 搜索框 -->
    <div class="search-div" style="margin: 20px 10px -5px 20px; border: 1px">
      <el-row>
        <el-col :span="20">
          <el-form :inline="true" class="demo-form-inline">
            <el-form-item label="登录用户名">
              <el-input
                v-model="searchObj.username"
                placeholder="输入关键字"
                style="width: 100%"
              ></el-input>
            </el-form-item>
            &nbsp;&nbsp;&nbsp;
            <el-form-item label="登录时间">
              <el-date-picker
                v-model="createTimes"
                type="datetimerange"
                range-separator="至"
                start-placeholder="开始时间"
                end-placeholder="结束时间"
                value-format="yyyy-MM-dd HH:mm:ss"
                style="margin-right: 10px; width: 100%"
              />
            </el-form-item>
            <el-form-item>
              <el-button
                type="primary"
                icon="el-icon-search"
                @click="load(1)"
                :disabled="$hasBP('bnt.sysLoginLog.list') === false"
                >搜索</el-button
              >
              <el-button icon="el-icon-refresh" @click="resetData"
                >重置</el-button
              >
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </div>
    <!-- 表格 -->
    <div>
      <el-col :span="4">
        <el-button
          style="margin: 0 0 10px 30px"
          type="danger"
          @click="batchRemove()"
          >批量删除</el-button
        >
      </el-col>
      <el-table
        v-loading="loading"
        :data="tableData"
        border
        style="width: 100%"
        :row-style="{ height: '80px' }"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" align="center" width="80">
        </el-table-column>
        <el-table-column label="序号" width="120" align="center">
          <template slot-scope="scope">
            {{ (pageNum - 1) * limit + scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column
          prop="username"
          label="用户账号"
          width="250"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="ipaddr"
          label="登录ip地址"
          width="250"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="status"
          label="登录状态"
          width="180"
          align="center"
          :value="tableData.status"
        >
          <!-- 使用scope获取列的数据，结合if进行判断 -->
          <template slot-scope="scope">
            <span v-if="scope.row.status == 0">登录成功</span>
            <span v-if="scope.row.status == 1">登录失败</span>
          </template>
        </el-table-column>
        <!-- <el-table-column
                    prop="accessTime"
                    label="登录时间"
                    width="200"
                    align="center"
                >
                </el-table-column> -->
        <el-table-column
          prop="createTime"
          label="创建时间"
          width="250"
          align="center"
        >
        </el-table-column>
        <el-table-column label="操作" width="180" align="center">
          <template slot-scope="scope">
            <el-button
              type="danger"
              icon="el-icon-delete"
              size="mini"
              @click="removeDataById(scope.row.id)"
              title="删除"
            />
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!-- 分页 -->
    <el-pagination
      @current-change="load"
      :current-page="pageNum"
      style="padding: 30px 0; text-align: center"
      :page-size="limit"
      layout="total, sizes, prev,pager, next, jumper"
      :page-sizes="[5, 10, 20]"
      :total="total"
      @size-change="handleSizeChange"
    >
    </el-pagination>
  </div>
</template>

<script>
//导入api
import api from "@/api/log/user.js";

export default {
  data() {
    return {
      tableData: [],
      loading: true,
      pageNum: 1,
      limit: 5,
      total: 0,
      searchObj: {}, //搜索条件
      createTimes: [], //时间【模糊查询条件】
      sysLoginLog: {},
      selectValueIds: [],
      tableData: [],
    };
  },
  created() {
    //加载数据
    this.load(1);
  },
  methods: {
    // 处理每页显示条数变化
    handleSizeChange(val) {
      this.limit = val; // 更新每页显示条数
      this.load(1); // 重置页码为1并重新获取数据
    },
    //加载数据
    load(pageNum) {
      this.pageNum = pageNum;
      if (this.createTimes && this.createTimes.length == 2) {
        this.searchObj.createTimeBegin = this.createTimes[0];
        this.searchObj.createTimeEnd = this.createTimes[1];
      }
      api
        .getLogPageList(this.pageNum, this.limit, this.searchObj)
        .then((res) => {
          console.log(res);
          this.loading = false;
          this.tableData = res.data.records;
          this.total = res.data.total;
        });
    },
    //获取批量删除id
    handleSelectionChange(selectValue) {
      // console.log(selectValue);
      this.selectValueIds = selectValue;
    },
    //批量删除
    batchRemove() {
      //判断selectValueIds是否为空
      if (this.selectValueIds.length == 0) {
        this.$message({
          message: "请选择删除登录日志记录",
          type: "warning",
        });
        return;
      }
      //1.创建一个封装ids的数组
      var ids = [];
      //2.for循环遍历每个对象的id
      for (var i = 0; i < this.selectValueIds.length; i++) {
        //封装ids
        ids.push(this.selectValueIds[i].id);
      }
      this.$confirm("此操作将永久删除这些登录日志, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        api.batchdelLog(ids).then((res) => {
          console.log(res);
          this.$message({
            type: "success",
            message: "删除成功!",
          });
          //重新加载数据
          this.load(1);
        });
      });
    },
    // 重置
    resetData() {
      // 清空所有搜索条件
      this.searchObj = {}; // 清空搜索对象
      this.createTimes = []; // 清空时间范围
      this.pageNum = 1; // 重置页码为第一页
      // 重新加载数据
      this.load(1);
    },
    //删除操作
    removeDataById(id) {
      this.$confirm("此操作将永久删除该登录日志, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        api.delLog(id).then((res) => {
          console.log(res);
          this.$message({
            type: "success",
            message: "删除成功!",
          });
          //重新加载数据
          this.load(1);
        });
      });
    },
  },
};
</script>

<style>
</style>