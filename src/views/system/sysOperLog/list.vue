<template>
  <div class="app-container">
    <!-- 搜索框 -->
    <div class="search-div">
      <el-form :inline="true" size="small">
            <el-form-item label="标题">
              <el-input
                v-model="searchObj.title"
                placeholder="输入关键字"
              ></el-input>
            </el-form-item>
            <el-form-item label="操作人员">
              <el-input
                v-model="searchObj.operName"
                placeholder="输入关键字"
              ></el-input>
            </el-form-item>
            <el-form-item label="操作时间">
              <el-date-picker
                v-model="createTimes"
                type="datetimerange"
                range-separator="至"
                start-placeholder="开始时间"
                end-placeholder="结束时间"
                value-format="yyyy-MM-dd HH:mm:ss"
              />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" @click="load(1)"
                >搜索</el-button
              >
              <el-button icon="el-icon-refresh" @click="resetData"
                >重置</el-button
              >
            </el-form-item>
      </el-form>
    </div>

    <!-- 工具条 -->
    <div class="tools-div">
      <el-button type="danger" size="mini" @click="batchRemove()">批量删除</el-button>
    </div>

    <!-- 表格 -->
    <el-table
        v-loading="loading"
        :data="tableData"
        border
        style="width: 100%"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" align="center" width="80">
        </el-table-column>
        <el-table-column label="序号" width="50" align="center" fixed>
          <template slot-scope="scope">
            {{ (pageNum - 1) * limit + scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column prop="title" label="标题" width="200" align="center">
        </el-table-column>
        <el-table-column
          prop="businessType"
          label="业务类型"
          width="170"
          align="center"
        >
          <template slot-scope="scope">
            <span v-if="scope.row.businessType === 'OTHER'">其他</span>
            <span v-if="scope.row.businessType === 'QUERY'">查询</span>
            <span v-if="scope.row.businessType === 'INSERT'">新增</span>
            <span v-if="scope.row.businessType === 'UPDATE'">修改</span>
            <span v-if="scope.row.businessType === 'DELETE'">删除</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="requestMethod"
          label="请求方式"
          width="150"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="operName"
          label="操作人员"
          width="150"
          align="center"
        >
        </el-table-column>
        <el-table-column prop="operUrl" label="请求URL" width="280">
        </el-table-column>
        <el-table-column prop="operIp" label="主机地址" width="120">
        </el-table-column>
        <el-table-column
          prop="createTime"
          label="创建时间"
          width="200"
          align="center"
        >
        </el-table-column>
        <el-table-column label="操作" align="center" fixed="right">
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
import api from "@/api/openLog/user.js";

export default {
  data() {
    return {
      loading: true,
      pageNum: 1,
      limit: 5,
      total: 0,
      searchObj: {}, //搜索条件
      createTimes: [], //时间【模糊查询条件】
      sysOperLog: {},
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
          message: "请选择删除操作日志记录",
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
      this.$confirm("此操作将永久删除这些操作日志, 是否继续?", "提示", {
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
    //重置
    resetData() {
      // 清空表单
      this.searchObj = {}; // 修改这里，将空字符串改为一个空对象
      this.createTimes = []; // 同时清空时间选择器
      // 再次刷新列表数据
      this.load(1);
    },
    //删除操作
    removeDataById(id) {
      this.$confirm("此操作将永久删除该操作日志, 是否继续?", "提示", {
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