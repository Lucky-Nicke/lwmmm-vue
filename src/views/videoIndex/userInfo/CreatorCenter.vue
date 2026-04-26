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
              :data="pagedTableData"
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
                  ></cached-image>
                </template>
              </el-table-column>
              <el-table-column
                label="影视名称"
                min-width="120"
                show-overflow-tooltip
              >
                <template slot-scope="scope">
                  <span style="font-weight: bold">{{
                    scope.row.videoName
                  }}</span>
                </template>
              </el-table-column>

              <!-- 新增字段：作者 -->
              <el-table-column
                prop="director"
                label="作者"
                width="100"
                show-overflow-tooltip
              ></el-table-column>
              <!-- 新增字段：所属栏目 -->
              <el-table-column
                prop="cid"
                label="所属栏目"
                width="90"
                align="center"
              ></el-table-column>
              <!-- 新增字段：描述 -->
              <el-table-column
                prop="description"
                label="影视描述"
                min-width="150"
                show-overflow-tooltip
              ></el-table-column>

              <el-table-column label="审核状态" width="100" align="center">
                <template slot-scope="scope">
                  <el-tag
                    :type="getStatusType(scope.row.approStatus)"
                    size="medium"
                  >
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
                label="审核意见"
                min-width="120"
                show-overflow-tooltip
              >
                <template slot-scope="scope">{{
                  scope.row.approDesc || "无"
                }}</template>
              </el-table-column>
              <el-table-column
                label="操作"
                width="130"
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
                  <span
                    v-if="scope.row.approStatus === 'PASS'"
                    style="color: #67c23a; font-size: 12px"
                    >审核通过</span
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
            <el-pagination
              background
              layout="total, sizes, prev, pager, next"
              :total="tableData.length"
              :page-sizes="[5, 10, 20]"
              :page-size="submissionPageSize"
              :current-page="submissionPage"
              @current-change="submissionPage = $event"
              @size-change="val => { submissionPageSize = val; submissionPage = 1 }"
              style="margin-top: 15px; text-align: right"
            ></el-pagination>
          </div>

          <!-- 2. 我上传的内容区 -->
          <div v-else-if="activeMenu === 'myVideos'" key="myVideos">
            <h2 class="content-title">我上传的影视作品</h2>
            <el-table
              :data="pagedMyVideosData"
              v-loading="loading"
              stripe
              border
              style="width: 100%"
              class="custom-table"
            >
              <el-table-column
                prop="id"
                label="ID"
                width="70"
                align="center"
              ></el-table-column>
              <el-table-column label="封面" width="110" align="center">
                <template slot-scope="scope">
                  <cached-image
                    style="width: 80px; height: 50px; border-radius: 4px"
                    :src="scope.row.image"
                    fit="cover"
                  ></cached-image>
                </template>
              </el-table-column>
              <el-table-column
                prop="name"
                label="影视名称"
                min-width="120"
                show-overflow-tooltip
              ></el-table-column>
              <!-- 新增字段：导演 -->
              <el-table-column
                prop="director"
                label="导演"
                width="100"
                show-overflow-tooltip
              ></el-table-column>
              <el-table-column
                prop="cid"
                label="所属栏目"
                width="100"
                align="center"
              ></el-table-column>
              <!-- 新增字段：描述 -->
              <el-table-column
                prop="description"
                label="影视描述"
                min-width="150"
                show-overflow-tooltip
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
              <el-table-column label="操作" width="80" align="center">
                <template slot-scope="scope">
                  <template v-if="scope.row.isApproval == 1">
                    <el-popover
                      placement="left"
                      trigger="hover"
                      popper-class="action-popover"
                    >
                      <div class="action-grid">
                        <el-button size="mini" type="primary" icon="el-icon-video-play" @click="goToDetail(scope.row)">详情</el-button>
                        <el-button size="mini" type="warning" icon="el-icon-edit" @click="openEditDialog(scope.row)">编辑</el-button>
                        <el-button size="mini" type="success" icon="el-icon-data-line" @click="goToVideoData(scope.row)">数据</el-button>
                        <el-button size="mini" type="danger" icon="el-icon-remove-outline" @click="handleOffShelf(scope.row)">下架</el-button>
                      </div>
                      <el-button slot="reference" size="mini" icon="el-icon-more" circle></el-button>
                    </el-popover>
                  </template>
                </template>
              </el-table-column>
            </el-table>
            <el-pagination
              background
              layout="total, sizes, prev, pager, next"
              :total="myVideosData.length"
              :page-sizes="[5, 10, 20]"
              :page-size="myVideosPageSize"
              :current-page="myVideosPage"
              @current-change="myVideosPage = $event"
              @size-change="val => { myVideosPageSize = val; myVideosPage = 1 }"
              style="margin-top: 15px; text-align: right"
            ></el-pagination>
          </div>
        </transition>
      </el-main>
    </el-container>

    <!-- 编辑视频弹窗 -->
    <el-dialog
      title="修改影视信息"
      :visible.sync="editDialogVisible"
      width="50%"
      :close-on-click-modal="false"
    >
      <el-form
        ref="editForm"
        :model="editMovie"
        :rules="editRules"
        label-width="100px"
        size="small"
        style="padding-right: 20px"
      >
        <el-form-item label="影视名称" prop="name">
          <el-input v-model="editMovie.name" placeholder="请输入标题" />
        </el-form-item>
        <el-form-item label="所属栏目" prop="cid">
          <el-select v-model="editMovie.cid" placeholder="请选择影视分类" style="width: 100%">
            <el-option
              v-for="item in categories"
              :key="item.id"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="作者/导演">
          <el-input v-model="editMovie.director" disabled />
        </el-form-item>
        <el-form-item label="封面图片" prop="image">
          <el-upload
            class="avatar-uploader"
            action="http://localhost:8085/admin/system/upload/uploadImage"
            name="uploadImage"
            :show-file-list="false"
            :on-success="handleEditImageSuccess"
            :before-upload="handleEditBeforeUpload"
          >
            <img v-if="editMovie.image" :src="editMovie.image" class="avatar" />
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            <div slot="tip" class="el-upload__tip">点击上传封面</div>
          </el-upload>
        </el-form-item>
        <el-form-item label="影视文件" prop="playId">
          <el-upload
            ref="editVideoUpload"
            action="http://localhost:8085/admin/system/upload/uploadVideo"
            name="uploadVideo"
            :on-success="handleEditVideoSuccess"
            :before-upload="handleEditBeforeUpload"
            :show-file-list="false"
          >
            <el-button size="small" type="primary" icon="el-icon-upload">上传视频文件</el-button>
          </el-upload>
          <div v-if="editMovie.playId" style="color: #67c23a; font-size: 12px; margin-top: 5px">
            <i class="el-icon-check-circle"></i> 视频已上传 (ID: {{ editMovie.playId }})
          </div>
        </el-form-item>
        <el-form-item label="影视描述" prop="description">
          <el-input type="textarea" :rows="3" v-model="editMovie.description"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="editDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleEditSave" :loading="editLoading">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 上传弹窗 -->
    <el-dialog
      title="🎬 上传新视频"
      :visible.sync="uploadDialogVisible"
      width="600px"
      :close-on-click-modal="false"
      @closed="resetUploadForm"
    >
      <div v-loading="imageUploading || videoUploading" style="min-height: 100px">
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
        <!-- 新增表单项：导演 -->
        <el-form-item label="作者" required>
          <el-input v-model="uploadForm.director" disabled></el-input>
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
      </div>
      <div slot="footer">
        <el-button @click="uploadDialogVisible = false">取 消</el-button>
        <el-button
          type="primary"
          :loading="submitLoading || imageUploading || videoUploading"
          :disabled="imageUploading || videoUploading"
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
      // 增加 director 字段
      uploadForm: {
        name: "",
        cid: "",
        description: "",
        image: "",
        playId: "",
        director: "",
      },
      submissionPage: 1,
      submissionPageSize: 10,
      myVideosPage: 1,
      myVideosPageSize: 10,
      // 编辑弹窗
      editDialogVisible: false,
      editLoading: false,
      editMovie: {},
      editRules: {
        name: [{ required: true, message: '请输入影视名称', trigger: 'blur' }],
        cid: [{ required: true, message: '请选择所属栏目', trigger: 'change' }],
      },
    };
  },
  computed: {
    pagedTableData() {
      const start = (this.submissionPage - 1) * this.submissionPageSize;
      return this.tableData.slice(start, start + this.submissionPageSize);
    },
    pagedMyVideosData() {
      const start = (this.myVideosPage - 1) * this.myVideosPageSize;
      return this.myVideosData.slice(start, start + this.myVideosPageSize);
    },
  },
  created() {
    // 1. 检查是否存在 token
    const token = this.getCookie("vue_admin_template_token");
    if (!token) {
      // 2. 如果没有 token，提示并跳转回首页
      // alert("请先登录"); // 根据需求决定是否提示
      this.$router.push("/index");
      this.$message.warning("请先登录");
      return; // 阻止后续逻辑执行
    }
    // 3. 已登录，执行原有逻辑
    this.getList();
    this.getCategories();
  },
  methods: {
    // 获取 Cookie 的简单辅助函数
    getCookie(name) {
      const value = `; ${document.cookie}`;
      const parts = value.split(`; ${name}=`);
      if (parts.length === 2) return parts.pop().split(";").shift();
    },
    formatTime(timeStr) {
      return timeStr ? timeStr.replace("T", " ").substring(0, 16) : "-";
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
        const username = sessionStorage.getItem("username");
        if (!username) {
          this.$message.error("用户信息已失效，请重新登录");
          return;
        }
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
        const userId = sessionStorage.getItem("userId");
        const res = await movieApi.showApproveRecord(userId);
        if (res.code === 200 || res.code === 20000) {
          this.allTableData = res.data || [];
          this.handleStatusFilter();
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
      this.submissionPage = 1;
    },

    handleReset() {
      this.searchQuery.status = "";
      this.handleStatusFilter();
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
      const { name, cid, image, playId, director } = this.uploadForm;
      // 校验增加 director
      if (!name || !cid || !image || !playId || !director)
        return this.$message.warning(
          "请完善必填项（名称、导演、栏目及文件）！"
        );

      this.submitLoading = true;
      try {
        const finalData = {
          movie: { ...this.uploadForm, isApproval: "0" },
          userId: sessionStorage.getItem("userId"),
          username: sessionStorage.getItem("username"),
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
      const isPassed =
        row.approStatus === "PASS" || Number(row.isApproval) === 1;
      if (isPassed) {
        const videoId = row.videoId || row.id;
        this.$router.push(`/index/video/${videoId}`);
      } else {
        this.$message.warning("该视频尚未审核通过，暂不可预览！");
      }
    },

    openUploadDialog() {
      this.uploadForm.director = sessionStorage.getItem("username") || "";
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
        director: "", // 重置导演字段
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
          sessionStorage.getItem("userId"),
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

    openEditDialog(row) {
      this.editDialogVisible = true;
      movieApi.getMovieById(row.id).then((res) => {
        this.editMovie = res.data;
        this.$nextTick(() => {
          this.$refs.editForm && this.$refs.editForm.clearValidate();
        });
      });
    },

    handleEditBeforeUpload() {
      this.editLoading = true;
    },

    handleEditImageSuccess(res) {
      this.editLoading = false;
      if (res && res.data) {
        this.editMovie.image = res.data;
        this.$message.success('封面上传成功');
      } else {
        this.$message.error('封面上传失败');
      }
    },

    handleEditVideoSuccess(res) {
      this.editLoading = false;
      if (res) {
        this.editMovie.playId = res;
        this.$message.success('视频上传成功');
        this.$refs.editVideoUpload && this.$refs.editVideoUpload.clearFiles();
      } else {
        this.$message.error('视频上传失败');
      }
    },

    handleEditSave() {
      this.$refs.editForm.validate((valid) => {
        if (!valid) return this.$message.error('请按要求填写表单！');
        this.editLoading = true;
        movieApi.updateMovie(this.editMovie).then(() => {
          this.$message.success('修改成功！');
          this.editDialogVisible = false;
          this.getMyUploadedVideos();
        }).catch(() => {
          this.$message.error('修改失败！');
        }).finally(() => {
          this.editLoading = false;
        });
      });
    },

    goToVideoData(row) {
      this.$router.push(`/index/creator/video-data/${row.id}`);
    },

    async handleOffShelf(row) {
      try {
        await this.$confirm(`确定要下架《${row.name}》吗？`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        });
        const res = await movieApi.offShelfMovie(row.id);
        if (res.code === 200 || res.code === 20000) {
          this.$message.success('下架成功');
          this.getMyUploadedVideos();
        } else {
          this.$message.error(res.message || '下架失败');
        }
      } catch (e) {
        // 用户取消
      }
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

.action-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 6px;
  padding: 4px;
}

.action-grid .el-button {
  margin: 0;
  width: 100%;
  justify-content: center;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 100px;
  line-height: 100px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 100px;
  display: block;
  object-fit: cover;
}
</style>