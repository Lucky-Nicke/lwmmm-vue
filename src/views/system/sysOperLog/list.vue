<template>
  <div>
    <!-- 搜索框 -->
    <div class="search-div" style="margin: 20px 10px -5px 20px; border: 1px">
      <el-row>
        <el-col :span="24">
          <el-form :inline="true" class="demo-form-inline">
            <el-form-item label="标题">
              <el-input
                v-model="searchObj.title"
                placeholder="输入关键字"
                style="width: 100%"
              ></el-input>
            </el-form-item>
            <el-form-item label="操作人员">
              <el-input
                v-model="searchObj.operName"
                placeholder="输入关键字"
                style="width: 100%"
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
                style="margin-right: 10px; width: 100%"
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
        </el-col>
      </el-row>
    </div>

    <div style="margin: 10px 30px; border: 1px">
      <el-button type="danger" @click="batchRemove()">批量删除</el-button>
    </div>

    <!-- 表格 -->
    <div>
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
        <el-table-column label="序号" width="120" align="center" fixed>
          <template slot-scope="scope">
            {{ (pageNum - 1) * limit + scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column prop="title" label="标题" width="120" align="center">
        </el-table-column>
        <el-table-column
          prop="businessType"
          label="业务类型"
          width="170"
          align="center"
        >
          <template slot-scope="scope">
            <span v-if="scope.row.businessType === 'OTHER'">其他</span>
            <span v-if="scope.row.businessType === 'INSERT'">新增</span>
            <span v-if="scope.row.businessType === 'UPDATE'">修改</span>
            <span v-if="scope.row.businessType === 'DELETE'">删除</span>
          </template>
        </el-table-column>
        <el-table-column prop="method" label="方法名称" width="200">
        </el-table-column>
        <el-table-column
          prop="requestMethod"
          label="请求方式"
          width="150"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="operatorType"
          label="操作类别"
          width="120"
          align="center"
        >
          <template slot-scope="scope">
            <span v-if="scope.row.operatorType === 'OTHER'">其他</span>
            <span v-if="scope.row.operatorType === 'MANAGE'">后台用户</span>
            <span v-if="scope.row.operatorType === 'MOBILE'">手机端用户</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="operName"
          label="操作人员"
          width="150"
          align="center"
        >
        </el-table-column>
        <el-table-column
          prop="deptName"
          label="部门名称"
          width="150"
          align="center"
        >
        </el-table-column>
        <el-table-column prop="operUrl" label="请求URL" width="200">
        </el-table-column>
        <el-table-column prop="operIp" label="主机地址" width="200">
        </el-table-column>
        <!-- <el-table-column
                    prop="operParam"
                    label="请求参数"
                    width="200"
                >
                </el-table-column> -->
        <!-- <el-table-column
                    prop="jsonResult"
                    label="返回参数"
                    width="200"
                >
                </el-table-column> -->
        <el-table-column prop="status" label="状态" width="150" align="center">
          <template slot-scope="scope">
            <span
              v-if="scope.row.status === 0 || scope.row.status === 'SUCCESS'"
              >正常</span
            >
            <span v-if="scope.row.status === 1 || scope.row.status === 'FAIL'"
              >异常</span
            >
          </template>
        </el-table-column>
        <!-- <el-table-column
                    prop="operTime"
                    label="操作时间"
                    width="200"
                    align="center"
                >
                </el-table-column> -->
        <el-table-column
          prop="createTime"
          label="创建时间"
          width="200"
          align="center"
        >
        </el-table-column>
        <el-table-column label="操作" width="120" align="center" fixed="right">
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
      layout="total, prev, pager, next, jumper"
      :total="total"
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
      limit: 4,
      total: 0,
      searchObj: {}, //搜索条件
      createTimes: [], //时间【模糊查询条件】
      sysOperLog: {},
      selectValueIds: [],
    };
  },
  created() {
    //加载数据
    this.load(1);
  },
  methods: {
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
      this.searchObj = "";
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