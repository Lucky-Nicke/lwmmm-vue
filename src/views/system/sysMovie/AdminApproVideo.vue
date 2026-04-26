<template>
  <div class="app-container">
    <!-- 工具条 -->
    <div class="tools-div">
      <el-button size="mini" icon="el-icon-refresh" @click="getList"
        >刷新数据</el-button
      >
    </div>

    <el-table
        :data="pagedData"
        v-loading="loading"
        stripe
        border
        style="width: 100%"
      >
        <el-table-column
          prop="id"
          label="序号"
          width="70"
          align="center"
        ></el-table-column>

        <el-table-column label="封面" width="110" align="center">
          <template slot-scope="scope">
            <cached-image
              style="width: 80px; height: 50px; border-radius: 4px"
              :src="scope.row.image"
              fit="cover"
              :preview-src-list="[scope.row.image]"
            >
              <div slot="error" style="width:100%;height:100%;background:#f5f7fa"></div>
            </cached-image>
          </template>
        </el-table-column>

        <el-table-column
          prop="videoName"
          label="影视名称"
          min-width="140"
          show-overflow-tooltip
        ></el-table-column>

        <!-- 新增字段：导演 -->
        <el-table-column
          prop="director"
          label="导演"
          width="120"
          show-overflow-tooltip
        ></el-table-column>

        <!-- 新增字段：所属栏目 -->
        <el-table-column
          prop="cid"
          label="栏目ID"
          width="80"
          align="center"
        ></el-table-column>

        <!-- 新增字段：描述 -->
        <el-table-column
          prop="description"
          label="影视简介"
          min-width="180"
          show-overflow-tooltip
        ></el-table-column>

        <el-table-column label="审核状态" width="120" align="center">
          <template slot-scope="scope">
            <el-tag :type="getStatusType(scope.row.approStatus)" size="medium">
              {{ getStatusText(scope.row.approStatus) }}
            </el-tag>
          </template>
        </el-table-column>

        <el-table-column label="上传时间" width="155" align="center">
          <template slot-scope="scope">{{
            formatTime(scope.row.createTime)
          }}</template>
        </el-table-column>

        <el-table-column
          prop="approDesc"
          label="审核意见"
          min-width="130"
          show-overflow-tooltip
        >
          <template slot-scope="scope">{{
            scope.row.approDesc || "暂无"
          }}</template>
        </el-table-column>

        <el-table-column label="操作" width="180" align="center" fixed="right">
          <template slot-scope="scope">
            <div class="op-container">
              <template v-if="scope.row.approStatus === 'DOING'">
                <el-button
                  size="mini"
                  type="success"
                  @click="handleApprove(scope.row)"
                  >通过</el-button
                >
                <el-button
                  size="mini"
                  type="danger"
                  plain
                  @click="handleReject(scope.row)"
                  >驳回</el-button
                >
              </template>
              <span v-else class="status-end">— 已结束 —</span>
            </div>
          </template>
        </el-table-column>
      </el-table>

      <el-pagination
        style="padding: 30px 0; text-align: center"
        background
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
        :page-size="pageSize"
        :page-sizes="[5, 10, 20]"
        :current-page="currentPage"
        @current-change="handlePageChange"
        @size-change="handleSizeChange"
      ></el-pagination>

    <!-- 驳回弹窗 -->
    <el-dialog
      title="填写驳回原因"
      :visible.sync="rejectDialogVisible"
      width="400px"
    >
      <el-form :model="rejectForm" label-width="80px">
        <el-form-item label="原因" required>
          <el-input
            v-model="rejectForm.approDesc"
            type="textarea"
            :rows="4"
            placeholder="请填写驳回原因..."
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="rejectDialogVisible = false">取消</el-button>
        <el-button type="danger" :loading="submitLoading" @click="confirmReject"
          >确认驳回</el-button
        >
      </div>
    </el-dialog>
  </div>
</template>

<script>
import movieApi from "@/api/movie/movie";

export default {
  name: "AdminApproVideo",
  data() {
    return {
      loading: false,
      submitLoading: false,
      tableData: [],
      total: 0,
      pageSize: 10,
      currentPage: 1,
      rejectDialogVisible: false,
      rejectForm: { videoId: null, approDesc: "" },
    };
  },
  computed: {
    pagedData() {
      const start = (this.currentPage - 1) * this.pageSize;
      return this.tableData.slice(start, start + this.pageSize);
    },
  },
  created() {
    this.getList();
  },
  methods: {
    async getList() {
      this.loading = true;
      try {
        const res = await movieApi.getApproveList();
        if (res.code === 200 || res.code === 20000) {
          this.tableData = res.data || [];
          this.total = this.tableData.length;
        }
      } finally {
        this.loading = false;
      }
    },

    async handleApprove(row) {
      try {
        await this.$confirm(`确定审核通过《${row.videoName}》吗？`, "提示", {
          type: "success",
        });
        const userId = sessionStorage.getItem("userId");
        const res = await movieApi.doApproval({
          videoId: row.videoId,
          approStatus: "SUCC",
          userId: userId,
        });
        if (res.code === 200 || res.code === 20000) {
          this.$message.success("审核已通过");
          this.getList();
        }
      } catch (e) {}
    },

    handleReject(row) {
      this.rejectForm = { videoId: row.videoId, approDesc: "" };
      this.rejectDialogVisible = true;
    },

    async confirmReject() {
      if (!this.rejectForm.approDesc.trim())
        return this.$message.warning("请填写驳回原因");
      this.submitLoading = true;
      try {
        const userId = sessionStorage.getItem("userId");
        const res = await movieApi.doApproval({
          ...this.rejectForm,
          approStatus: "FAIL",
          userId: userId,
        });
        if (res.code === 200 || res.code === 20000) {
          this.$message.success("已驳回申请");
          this.rejectDialogVisible = false;
          this.getList();
        }
      } finally {
        this.submitLoading = false;
      }
    },

    getStatusType(status) {
      const map = {
        DOING: "warning",
        PASS: "success",
        SUCC: "success",
        REJECT: "danger",
        FAIL: "danger",
        CANCEL: "info",
      };
      return map[status] || "info";
    },

    getStatusText(status) {
      const map = {
        DOING: "审核中",
        PASS: "已通过",
        SUCC: "已通过",
        REJECT: "已驳回",
        FAIL: "已驳回",
        CANCEL: "已撤回",
      };
      return map[status] || "未知";
    },

    formatTime(timeStr) {
      return timeStr ? timeStr.replace("T", " ").substring(0, 16) : "-";
    },

    handlePageChange(page) {
      this.currentPage = page;
    },
    handleSizeChange(size) {
      this.pageSize = size;
      this.currentPage = 1;
    },
  },
};
</script>

<style scoped>
.image-error {
  line-height: 50px;
  text-align: center;
  color: #ccc;
  font-size: 12px;
}
.op-container {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
}
.status-end {
  color: #909399;
  font-size: 13px;
}
</style>