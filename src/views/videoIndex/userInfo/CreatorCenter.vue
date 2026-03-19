<template>
  <div class="creator-container">
    <el-container class="creator-main-box">
      <!-- 左侧侧边栏 -->
      <el-aside width="200px" class="creator-sidebar">
        <div class="sidebar-header">
          <i class="el-icon-s-custom"></i> 创作中心
        </div>
        <el-menu
          :default-active="activeMenu"
          @select="handleMenuSelect"
          class="creator-menu"
        >
          <el-menu-item index="submission">
            <i class="el-icon-upload"></i>
            <span slot="title">投稿与审核管理</span>
          </el-menu-item>
          <el-menu-item index="myVideos">
            <i class="el-icon-video-camera"></i>
            <span slot="title">我上传的</span>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <!-- 右侧内容区 -->
      <el-main class="creator-content">
        <transition name="el-fade-in-linear" mode="out-in">
          <!-- 1. 投稿与审核管理区 -->
          <div v-if="activeMenu === 'submission'" key="submission">
            <h2 class="content-title">投稿与审核管理</h2>

            <div class="toolbar">
              <div class="toolbar-left">
                <span style="font-size: 14px; color: #606266; margin-right: 8px"
                  >状态筛选:</span
                >
                <el-select
                  v-model="searchQuery.status"
                  placeholder="请选择"
                  clearable
                  @change="handleStatusFilter"
                >
                  <el-option label="全部" value=""></el-option>
                  <el-option label="审核中" value="DOING"></el-option>
                  <el-option label="审核通过" value="PASS"></el-option>
                  <el-option label="已驳回" value="REJECT"></el-option>
                  <el-option label="用户已撤回" value="CANCEL"></el-option>
                </el-select>
                <el-button icon="el-icon-refresh-right" @click="handleReset"
                  >重置</el-button
                >
              </div>

              <div class="toolbar-right">
                <el-button
                  icon="el-icon-refresh"
                  circle
                  title="刷新数据"
                  @click="getList"
                  :loading="loading"
                  style="margin-right: 10px"
                ></el-button>
                <el-button
                  type="success"
                  icon="el-icon-upload2"
                  @click="openUploadDialog"
                  >上传新视频</el-button
                >
              </div>
            </div>

            <el-table
              :data="tableData"
              v-loading="loading"
              stripe
              border
              style="width: 100%"
            >
              <el-table-column
                prop="id"
                label="序号"
                width="80"
                align="center"
              ></el-table-column>
              <el-table-column label="封面" width="120" align="center">
                <template slot-scope="scope">
                  <el-image
                    style="width: 80px; height: 50px; border-radius: 4px"
                    :src="scope.row.image"
                    fit="cover"
                  ></el-image>
                </template>
              </el-table-column>
              <el-table-column
                label="影视名称"
                min-width="150"
                show-overflow-tooltip
              >
                <template slot-scope="scope">
                  <span style="font-weight: bold">{{
                    scope.row.videoName
                  }}</span>
                </template>
              </el-table-column>
              <el-table-column label="审核状态" width="120" align="center">
                <template slot-scope="scope">
                  <el-tag
                    :type="getStatusType(scope.row.approStatus)"
                    size="medium"
                  >
                    {{ getStatusText(scope.row.approStatus) }}
                  </el-tag>
                </template>
              </el-table-column>
              <el-table-column label="上传时间" width="160" align="center">
                <template slot-scope="scope">{{
                  formatTime(scope.row.createTime)
                }}</template>
              </el-table-column>
              <el-table-column label="审核意见" min-width="150">
                <template slot-scope="scope">{{
                  scope.row.approDesc || "无"
                }}</template>
              </el-table-column>
              <el-table-column
                label="操作"
                width="150"
                align="center"
                fixed="right"
              >
                <template slot-scope="scope">
                  <el-button
                    v-if="scope.row.approStatus === 'DOING'"
                    size="mini"
                    type="danger"
                    plain
                    @click="handleCancelReview(scope.row)"
                    >取消审核</el-button
                  >
                  <el-button
                    v-if="scope.row.approStatus === 'PASS'"
                    size="mini"
                    type="success"
                    plain
                    @click="goToDetail(scope.row)"
                    >查看视频</el-button
                  >
                  <span
                    v-if="scope.row.approStatus === 'CANCEL'"
                    style="color: #909399; font-size: 12px"
                    >流程已结束</span
                  >
                  <span
                    v-if="scope.row.approStatus === 'REJECT'"
                    style="color: #f56c6c; font-size: 12px"
                    >审核被驳回</span
                  >
                </template>
              </el-table-column>
            </el-table>
          </div>

          <!-- 2. 我上传的内容区 -->
          <div v-else-if="activeMenu === 'myVideos'" key="myVideos">
            <h2 class="content-title">我上传的影视作品</h2>
            <el-table
              :data="myVideosData"
              v-loading="loading"
              stripe
              border
              style="width: 100%"
              class="custom-table"
            >
              <el-table-column
                prop="id"
                label="ID"
                width="80"
                align="center"
              ></el-table-column>
              <el-table-column label="封面" width="120" align="center">
                <template slot-scope="scope">
                  <el-image
                    style="width: 80px; height: 50px; border-radius: 4px"
                    :src="scope.row.image"
                    fit="cover"
                  ></el-image>
                </template>
              </el-table-column>
              <el-table-column
                prop="name"
                label="影视名称"
                min-width="150"
              ></el-table-column>
              <el-table-column
                prop="cid"
                label="所属栏目"
                width="120"
                align="center"
              ></el-table-column>
              <el-table-column label="状态" width="100" align="center">
                <template slot-scope="scope">
                  <el-tag
                    :type="scope.row.isApproval == 1 ? 'success' : 'info'"
                  >
                    {{ scope.row.isApproval == 1 ? "已发布" : "下架/未审" }}
                  </el-tag>
                </template>
              </el-table-column>
              <el-table-column label="操作" width="100" align="center">
                <template slot-scope="scope">
                  <el-button
                    size="mini"
                    type="text"
                    @click="goToDetail(scope.row)"
                    >详情</el-button
                  >
                </template>
              </el-table-column>
            </el-table>
          </div>
        </transition>
      </el-main>
    </el-container>

    <!-- 上传弹窗 -->
    <el-dialog
      title="🎬 上传新视频"
      :visible.sync="uploadDialogVisible"
      width="600px"
      :close-on-click-modal="false"
      @closed="resetUploadForm"
    >
      <el-form
        ref="uploadForm"
        :model="uploadForm"
        label-width="100px"
        size="medium"
      >
        <el-form-item label="影视名称" required>
          <el-input
            v-model="uploadForm.name"
            placeholder="请输入影视名称"
          ></el-input>
        </el-form-item>
        <el-form-item label="所属栏目" required>
          <el-select
            v-model="uploadForm.cid"
            placeholder="请选择栏目"
            style="width: 100%"
          >
            <el-option
              v-for="item in categories"
              :key="item.id"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="封面图片" required>
          <el-upload
            action=""
            :http-request="uploadImageAction"
            list-type="picture"
            :limit="1"
            :on-remove="handleImageRemove"
            :file-list="imageFileList"
          >
            <el-button
              size="small"
              type="primary"
              plain
              icon="el-icon-picture"
              :loading="imageUploading"
              >选择图片</el-button
            >
          </el-upload>
        </el-form-item>
        <el-form-item label="影视文件" required>
          <el-upload
            action=""
            :http-request="uploadVideoAction"
            accept="video/*"
            :limit="1"
            :on-remove="handleVideoRemove"
            :file-list="videoFileList"
          >
            <el-button
              size="small"
              type="primary"
              plain
              icon="el-icon-video-camera"
              :loading="videoUploading"
              >选择视频</el-button
            >
          </el-upload>
        </el-form-item>
        <el-form-item label="影视描述">
          <el-input
            type="textarea"
            v-model="uploadForm.description"
            placeholder="请输入描述"
            rows="4"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="uploadDialogVisible = false">取 消</el-button>
        <el-button
          type="primary"
          :loading="submitLoading"
          @click="submitUploadForm"
          >确认上传</el-button
        >
      </div>
    </el-dialog>
  </div>
</template>

<script>
import movieApi from "@/api/movie/movie.js";
import categoryApi from "@/api/category/category.js";
import request from "@/utils/request";
import axios from "axios";

export default {
  name: "CreatorCenter",
  data() {
    return {
      activeMenu: "submission",
      loading: false,
      submitLoading: false,
      imageUploading: false,
      videoUploading: false,
      imageFileList: [],
      videoFileList: [],
      allTableData: [],
      searchQuery: { status: "" },
      tableData: [],
      myVideosData: [],
      categories: [],
      uploadDialogVisible: false,
      uploadForm: { name: "", cid: "", description: "", image: "", playId: "" },
    };
  },
  created() {
    this.getList();
    this.getCategories();
  },
  methods: {
    formatTime(timeStr) {
      return timeStr ? timeStr.replace("T", " ") : "-";
    },

    handleMenuSelect(index) {
      this.activeMenu = index;
      if (index === "myVideos") {
        this.getMyUploadedVideos();
      } else {
        this.getList();
      }
    },

    async getCategories() {
      const res = await categoryApi.findAll();
      if (res.code === 200 || res.code === 20000) this.categories = res.data;
    },

    async getMyUploadedVideos() {
      this.loading = true;
      try {
        // 1. 从 localStorage 获取用户名
        const username = localStorage.getItem("username");

        // 2. 校验用户名是否存在
        if (!username) {
          this.$message.error("用户信息已失效，请重新登录");
          return;
        }
        // 3. 传入 username 调用接口
        const res = await movieApi.showMyUploadVideo(username);

        if (res.code === 200 || res.code === 20000) {
          this.myVideosData = res.data || [];
        } else {
          this.$message.error(res.message || "获取列表失败");
        }
      } catch (error) {
        console.error("获取我上传的视频失败:", error);
        this.$message.error("网络异常，请稍后再试");
      } finally {
        this.loading = false;
      }
    },

    async getList() {
      this.loading = true;
      try {
        const userId = localStorage.getItem("userId");
        const res = await movieApi.showApproveRecord(userId);
        if (res.code === 200 || res.code === 20000) {
          this.allTableData = res.data || [];
          this.handleStatusFilter(); // 加载后应用当前筛选条件
        }
      } finally {
        this.loading = false;
      }
    },

    handleStatusFilter() {
      if (!this.searchQuery.status) {
        this.tableData = [...this.allTableData];
      } else {
        this.tableData = this.allTableData.filter(
          (item) => item.approStatus === this.searchQuery.status
        );
      }
    },

    handleReset() {
      this.searchQuery.status = "";
      this.handleStatusFilter(); // 重置后显示全部
      this.$message.success("已重置筛选条件");
    },

    async uploadImageAction(option) {
      this.imageUploading = true;
      let formData = new FormData();
      formData.append("uploadImage", option.file);
      try {
        const res = await request({
          url: "/admin/system/upload/uploadImage",
          method: "post",
          data: formData,
        });
        if (res.code === 200 || res.code === 20000) {
          this.uploadForm.image = res.data;
          this.$message.success("封面上传成功！");
          option.onSuccess();
        }
      } finally {
        this.imageUploading = false;
      }
    },

    async uploadVideoAction(option) {
      this.videoUploading = true;
      let formData = new FormData();
      formData.append("uploadVideo", option.file);
      try {
        const baseURL = request.defaults.baseURL || "";
        const res = await axios({
          url: baseURL + "/admin/system/upload/uploadVideo",
          method: "post",
          data: formData,
        });
        if (res.data) {
          this.uploadForm.playId = res.data;
          this.$message.success("视频上传成功！");
          option.onSuccess();
        }
      } finally {
        this.videoUploading = false;
      }
    },

    async submitUploadForm() {
      const { name, cid, image, playId } = this.uploadForm;
      if (!name || !cid || !image || !playId)
        return this.$message.warning("请完善必填项！");

      this.submitLoading = true;
      try {
        const finalData = {
          movie: { ...this.uploadForm, isApproval: "0" },
          userId: localStorage.getItem("userId"),
          username: localStorage.getItem("username"),
        };
        const res = await movieApi.userUploadVideo(finalData);
        if (res.code === 200 || res.code === 20000) {
          this.$message.success("投稿成功！");
          this.uploadDialogVisible = false;
          this.getList();
        }
      } finally {
        this.submitLoading = false;
      }
    },

    goToDetail(row) {
      // 逻辑修正：审批通过(PASS) 或者 isApproval 为 1 均视为通过
      const isPassed =
        row.approStatus === "PASS" || Number(row.isApproval) === 1;
      if (isPassed) {
        const videoId = row.videoId || row.id;
        // 跳转到指定路径 /index/video/id
        this.$router.push(`/index/video/${videoId}`);
      } else {
        this.$message.warning("该视频尚未审核通过，暂不可预览！");
      }
    },

    openUploadDialog() {
      this.uploadDialogVisible = true;
    },
    handleImageRemove() {
      this.uploadForm.image = "";
    },
    handleVideoRemove() {
      this.uploadForm.playId = "";
    },
    resetUploadForm() {
      this.uploadForm = {
        name: "",
        cid: "",
        description: "",
        image: "",
        playId: "",
      };
      this.imageFileList = [];
      this.videoFileList = [];
    },

    async handleCancelReview(row) {
      try {
        await this.$confirm(`确定取消《${row.videoName}》的审核吗？`, "提示", {
          type: "warning",
        });
        const res = await movieApi.doUserCancelApproval(
          localStorage.getItem("userId"),
          row.videoId
        );
        if (res.code === 200 || res.code === 20000) {
          this.$message.success("已撤回申请");
          this.getList();
        }
      } catch (e) {}
    },

    getStatusType(status) {
      const map = {
        DOING: "warning",
        PASS: "success",
        REJECT: "danger",
        CANCEL: "info",
      };
      return map[status] || "info";
    },
    getStatusText(status) {
      const map = {
        DOING: "审核中",
        PASS: "审核通过",
        REJECT: "已驳回",
        CANCEL: "已撤回",
      };
      return map[status] || "未知";
    },
  },
};
</script>

<style scoped>
.creator-container {
  padding: 20px;
  background-color: #f5f7fa;
  min-height: 100vh;
  /* 解决不居中：利用布局容器居中 */
  display: flex;
  justify-content: center;
  align-items: flex-start;
}

.creator-main-box {
  width: 100%;
  max-width: 1200px; /* 限制最大宽度，配合flex实现居中 */
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  min-height: 80vh;
}

.creator-sidebar {
  border-right: 1px solid #e6e6e6;
  background-color: #fff;
}

.sidebar-header {
  padding: 20px;
  font-size: 18px;
  font-weight: bold;
  color: #409eff;
  text-align: center;
  border-bottom: 1px solid #f0f0f0;
}

.creator-content {
  padding: 25px;
}

.content-title {
  margin-bottom: 20px;
  font-size: 20px;
  color: #303133;
}

.toolbar {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  align-items: center;
}

.toolbar-left {
  display: flex;
  align-items: center;
  gap: 10px;
}
</style>