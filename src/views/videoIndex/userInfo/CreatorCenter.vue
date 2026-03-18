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
          <!-- ================= 1. 投稿与审核管理区 ================= -->
          <div v-if="activeMenu === 'submission'" key="submission">
            <h2 class="content-title">投稿与审核管理</h2>

            <!-- 顶部操作栏 -->
            <div class="toolbar">
              <div class="toolbar-left">
                <el-input
                  v-model="searchQuery.keyword"
                  placeholder="搜索影视名称..."
                  prefix-icon="el-icon-search"
                  clearable
                  class="search-input"
                ></el-input>
                <el-button
                  type="primary"
                  icon="el-icon-search"
                  @click="handleSearch"
                  >搜索</el-button
                >
                <el-button icon="el-icon-refresh-right" @click="handleReset"
                  >重置</el-button
                >
              </div>
              <div class="toolbar-right">
                <el-button
                  type="success"
                  icon="el-icon-upload2"
                  @click="openUploadDialog"
                  >上传新视频</el-button
                >
              </div>
            </div>

            <!-- 审核列表表格 (已对接真实数据) -->
            <el-table
              :data="tableData"
              v-loading="loading"
              stripe
              border
              style="width: 100%"
              class="custom-table"
            >
              <el-table-column
                prop="id"
                label="影视序号"
                width="100"
                align="center"
              ></el-table-column>

              <el-table-column label="照片(封面)" width="120" align="center">
                <template slot-scope="scope">
                  <!-- 注意替换为了后端返回的 image 字段 -->
                  <div
                    class="cover-wrapper"
                    :class="{
                      'is-clickable': Number(scope.row.isApproval) === 1,
                    }"
                    @click="goToDetail(scope.row)"
                  >
                    <el-image
                      style="
                        width: 80px;
                        height: 50px;
                        border-radius: 4px;
                        display: block;
                      "
                      :src="scope.row.image"
                      fit="cover"
                    >
                      <div slot="error" class="image-slot">
                        <i class="el-icon-picture-outline"></i>
                      </div>
                    </el-image>
                    <!-- 审核通过时悬浮显示的播放小图标 -->
                    <div
                      class="play-overlay"
                      v-if="Number(scope.row.isApproval) === 1"
                    >
                      <i class="el-icon-video-play"></i>
                    </div>
                  </div>
                </template>
              </el-table-column>

              <el-table-column
                label="影视名称"
                min-width="150"
                show-overflow-tooltip
              >
                <!-- 注意替换为了后端返回的 name 字段 -->
                <template slot-scope="scope">
                  <el-link
                    v-if="Number(scope.row.isApproval) === 1"
                    type="primary"
                    @click="goToDetail(scope.row)"
                    style="font-weight: bold"
                  >
                    {{ scope.row.name }}
                  </el-link>
                  <span
                    v-else
                    class="unapproved-title"
                    @click="goToDetail(scope.row)"
                  >
                    {{ scope.row.name }}
                  </span>
                </template>
              </el-table-column>

              <el-table-column label="审核状态" width="120" align="center">
                <template slot-scope="scope">
                  <el-tag
                    :type="getStatusType(scope.row.isApproval)"
                    size="medium"
                  >
                    {{ getStatusText(scope.row.isApproval) }}
                  </el-tag>
                </template>
              </el-table-column>

              <!-- 这里兼容常见的后台时间字段名称，如果你的后台是 createTime 请修改 prop -->
              <el-table-column
                prop="uploadTime"
                label="上传时间"
                width="160"
                align="center"
              ></el-table-column>

              <el-table-column
                prop="reviewTime"
                label="审核时间"
                width="160"
                align="center"
              >
                <template slot-scope="scope">
                  {{ scope.row.reviewTime || "待审核" }}
                </template>
              </el-table-column>

              <el-table-column
                prop="comments"
                label="审核意见"
                min-width="150"
                show-overflow-tooltip
              >
                <template slot-scope="scope">
                  <span
                    :style="{
                      color:
                        Number(scope.row.isApproval) === 2
                          ? '#F56C6C'
                          : 'inherit',
                    }"
                  >
                    {{ scope.row.comments || "无" }}
                  </span>
                </template>
              </el-table-column>

              <el-table-column
                label="操作"
                width="180"
                align="center"
                fixed="right"
              >
                <template slot-scope="scope">
                  <el-button
                    v-if="Number(scope.row.isApproval) === 0"
                    size="mini"
                    type="warning"
                    plain
                    @click="handleCancelReview(scope.row)"
                  >
                    取消审核
                  </el-button>
                  <el-button
                    v-if="Number(scope.row.isApproval) === 2"
                    size="mini"
                    type="primary"
                    plain
                    @click="handleResubmit(scope.row)"
                  >
                    重新复审
                  </el-button>
                  <el-button
                    v-if="Number(scope.row.isApproval) === 1"
                    size="mini"
                    type="success"
                    plain
                    @click="goToDetail(scope.row)"
                  >
                    查看视频
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
          </div>

          <!-- ================= 2. 我上传的内容区 ================= -->
          <div v-else-if="activeMenu === 'myVideos'" key="myVideos">
            <h2 class="content-title">我上传的影视作品</h2>
            <el-table
              :data="myVideosData"
              stripe
              border
              style="width: 100%"
              class="custom-table"
            >
              <!-- 此部分由于你没有提供接口，已去除假数据，请后续自行补充同理接口逻辑 -->
              <el-table-column
                label="暂无数据"
                align="center"
              ></el-table-column>
            </el-table>
          </div>
        </transition>
      </el-main>
    </el-container>

    <!-- ====== 上传新视频弹窗 ====== -->
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
            <!-- 栏目的value需根据你数据库真实的栏目ID调整 -->
            <el-option label="电影" value="1"></el-option>
            <el-option label="电视剧" value="2"></el-option>
            <el-option label="动漫" value="3"></el-option>
            <el-option label="综艺" value="4"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="封面图片" required>
          <!-- 采用 http-request 自定义上传，一并处理后端无前端API写法的问题 -->
          <el-upload
            class="upload-demo"
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
              >点击选择上传图片</el-button
            >
            <div slot="tip" class="el-upload__tip">
              只能上传 jpg/png 文件，上传后自动存储，必填
            </div>
          </el-upload>
        </el-form-item>

        <el-form-item label="影视文件" required>
          <el-upload
            class="upload-demo"
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
              >点击选择上传视频</el-button
            >
            <div slot="tip" class="el-upload__tip">
              请上传 mp4/avi 格式的视频文件，上传后自动处理，必填
            </div>
          </el-upload>
        </el-form-item>

        <el-form-item label="影视描述">
          <el-input
            type="textarea"
            v-model="uploadForm.description"
            placeholder="请输入对影视内容的简要描述 (选填)"
            rows="4"
          >
          </el-input>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
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
// 引入写好的 movie api。 假设默认导出形式或者命名导出均可，这里使用别名 import
import movieApi from "@/api/movie/movie.js";
// 由于图片/视频上传没有 api.js 方法，需要使用项目自带的 request (axios封装) 进行直接请求
import request from "@/utils/request";
import axios from "axios"; 

export default {
  name: "CreatorCenter",
  data() {
    return {
      activeMenu: "submission", // 默认选中"投稿与审核管理"
      loading: false, // 表格加载状态
      submitLoading: false, // 提交按钮加载状态
      imageUploading: false,
      videoUploading: false,

      // UI组件需要的文件列表对象
      imageFileList: [],
      videoFileList: [],

      searchQuery: {
        keyword: "",
      },

      // 真实表格数据存放处
      tableData: [],

      // 我上传的视频数据
      myVideosData: [],

      // 上传弹窗相关
      uploadDialogVisible: false,
      // 完全贴合 SysMovie 结构的表单参数
      uploadForm: {
        name: "",
        cid: "",
        description: "",
        image: "", // 用于存储上传完返回的缩略图连接
        playId: "", // 用于存储上传完视频返回的播放ID
      },
    };
  },
  created() {
    // 页面加载完成时立刻拉取审批记录
    this.getList();
  },
  methods: {
    handleMenuSelect(index) {
      this.activeMenu = index;
    },

    // =========== 核心接口逻辑区 =========== //

    // 1. 获取显示审批记录
    async getList() {
      this.loading = true;
      try {
        const res = await movieApi.showApproveRecord();
        // 假设后台返回统一Result标准，res.code === 200 (根据你的项目实际进行判断兼容)
        if (res.code === 200 || res.code === 20000) {
          // res.data 即 List<VideoApproRsp>
          this.tableData = res.data;
        } else {
          this.$message.error(res.message || "获取审核记录失败");
        }
      } catch (error) {
        console.error("获取审批记录异常:", error);
      } finally {
        this.loading = false;
      }
    },

    // 2. 自定义上传图片
    async uploadImageAction(option) {
      this.imageUploading = true;
      let formData = new FormData();
      // 请求参数名必须和后台匹配：uploadImage
      formData.append("uploadImage", option.file);

      try {
        const res = await request({
          url: "/admin/system/upload/uploadImage",
          method: "post",
          data: formData,
          headers: {
            "Content-Type": "multipart/form-data",
          },
        });

        // 你的后台图片接口返回的是 Result.ok(upload)，所以 url 在 res.data 中
        if (res.code === 200 || res.code === 20000) {
          this.uploadForm.image = res.data; // 设置入表单
          this.$message.success("封面上传成功！");
          option.onSuccess(res);
        } else {
          option.onError(new Error(res.message));
          this.$message.error(res.message || "上传失败");
        }
      } catch (error) {
        option.onError(error);
        this.$message.error("图片上传请求异常");
      } finally {
        this.imageUploading = false;
      }
    },

    // 3. 自定义上传视频
    async uploadVideoAction(option) {
      this.videoUploading = true;
      let formData = new FormData();
      formData.append("uploadVideo", option.file);

      try {
        // 获取项目中 request 的基础路径 (比如 /api 或 /dev-api) 确保不报404
        const baseURL = request.defaults.baseURL || "";
        // 【核心修改】：使用未封装过的原生 axios 单独发这次请求，专门绕开项目的报错拦截器
        const res = await axios({
          url: baseURL + "/admin/system/upload/uploadVideo",
          method: "post",
          data: formData,
          headers: {
            "Content-Type": "multipart/form-data",
            // 如果你的系统后台需要身份验证 Token，请参考项目中其他地方取消下面这行的注释并携带
            // 'Authorization': 'Bearer ' + 你的Token变量,
            // 'token': 你的Token变量
          },
        });

        // 原生的 axios 返回结构真实数据都在 res.data 里，此时就能正确拿到那段纯字符串了
        const videoId = res.data;

        if (videoId) {
          this.uploadForm.playId = videoId; // ✅ 成功获取并 set 进你要提交的表单里
          console.log("当前已成功设入表单的播放ID:", this.uploadForm.playId);
          this.$message.success("视频上传处理成功！");
          option.onSuccess();
        } else {
          option.onError();
          this.$message.error("视频上传失败，未获取到播放ID");
        }
      } catch (error) {
        console.error("上传错误信息:", error);
        option.onError(error);
        this.$message.error("视频上传请求异常");
      } finally {
        this.videoUploading = false;
      }
    },

    // 4. 提交投稿视频
    async submitUploadForm() {
      // 触发表单前校验必填
      const { name, cid, image, playId } = this.uploadForm;
      if (!name || !cid || !image || !playId) {
        this.$message.warning(
          "请确保影视名称、所属栏目、视频文件与封面内容都已上传及填写完毕！"
        );
        return;
      }

      this.submitLoading = true;
      try {
        // 请求 API
        const res = await movieApi.userUploadVideo(this.uploadForm);
        if (res.code === 200 || res.code === 20000) {
          this.$message.success("🎬 投稿视频已提交成功，请等待管理员审核！");
          this.uploadDialogVisible = false;
          // 提交成功后立刻刷新列表数据
          this.getList();
        } else {
          this.$message.error(res.message || "投稿失败，请稍后再试");
        }
      } catch (error) {
        console.error(error);
        this.$message.error("系统异常，提交失败");
      } finally {
        this.submitLoading = false;
      }
    },

    // =========== 交互相关的工具及常规事件区 =========== //

    // 前往详情页 (保持原有逻辑)
    goToDetail(row) {
      // 只有审核通过才能跳转，判断后台 isApproval 状态（转数字确保统一）
      if (Number(row.isApproval) === 1) {
        this.$router.push({ name: "VideoDetail", params: { id: row.id } });
      } else {
        this.$message.warning("该视频尚未审核通过，暂不可预览！");
      }
    },

    // 打开上传弹窗
    openUploadDialog() {
      this.uploadDialogVisible = true;
    },

    // 清空表单与文件列表
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

    handleImageRemove() {
      this.uploadForm.image = "";
    },

    handleVideoRemove() {
      this.uploadForm.playId = "";
    },

    handleSearch() {
      // 由于接口并未提供带条件的搜索，这里你可以考虑使用前端过滤，或者通知后端添加过滤参数
      this.$message.info(`在此处对接你的搜索接口逻辑`);
    },

    handleReset() {
      this.searchQuery.keyword = "";
      this.getList(); // 重新拉取全部数据
    },

    handleCancelReview(row) {
      this.$confirm(`确定要取消《${row.name}》的审核流程吗？`, "提示", {
        type: "warning",
      })
        .then(() => {
          // 调用撤销的后端接口...
          this.$message.success("操作成功");
        })
        .catch(() => {});
    },

    handleResubmit(row) {
      this.$confirm(`是否确认将《${row.name}》重新提交审核？`, "提示", {
        type: "info",
      })
        .then(() => {
          // 调用重新触发审核的后端接口...
          this.$message.success("操作成功");
        })
        .catch(() => {});
    },

    // 状态样式枚举
    getStatusType(status) {
      const typeMap = {
        0: "warning", // 审核中
        1: "success", // 通过
        2: "danger", // 驳回
      };
      return typeMap[Number(status)] || "info";
    },

    // 状态文本枚举
    getStatusText(status) {
      const textMap = {
        0: "审核中",
        1: "审核通过",
        2: "审核被驳回",
      };
      return textMap[Number(status)] || "未知状态";
    },
  },
};
</script>

<style scoped>
.creator-container {
  padding: 20px;
  max-width: 1400px;
  margin: 0 auto;
}

.creator-main-box {
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  min-height: 75vh;
  overflow: hidden;
}

.creator-sidebar {
  background-color: #f8f9fa;
  border-right: 1px solid #ebeef5;
}

.sidebar-header {
  height: 60px;
  line-height: 60px;
  text-align: center;
  font-size: 18px;
  font-weight: bold;
  color: #333;
  border-bottom: 1px solid #ebeef5;
  background-color: #fff;
}

.creator-menu {
  border-right: none;
  background-color: transparent;
}

.creator-menu .el-menu-item.is-active {
  background-color: #e6f7ff;
  border-right: 3px solid #409eff;
}

.creator-content {
  padding: 20px 30px;
  background-color: #fff;
}

.content-title {
  margin-top: 0;
  margin-bottom: 20px;
  font-size: 20px;
  color: #303133;
  border-bottom: 2px solid #ebeef5;
  padding-bottom: 15px;
}

/* 顶部操作栏 */
.toolbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.toolbar-left {
  display: flex;
  gap: 10px;
}

.search-input {
  width: 250px;
}

/* 封面的包裹器，用于实现悬浮播放按钮和手型 */
.cover-wrapper {
  position: relative;
  display: inline-block;
  overflow: hidden;
  border-radius: 4px;
}

/* 只有审核通过的封面才有手型鼠标 */
.cover-wrapper.is-clickable {
  cursor: pointer;
}

.play-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.4);
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  font-size: 28px;
  opacity: 0;
  transition: opacity 0.3s;
}

.cover-wrapper.is-clickable:hover .play-overlay {
  opacity: 1;
}

/* 未审核通过时的文字样式 */
.unapproved-title {
  color: #606266;
  cursor: pointer; /* 保持手型是为了让用户点击后看到阻断提示 */
}
.unapproved-title:hover {
  color: #909399;
}

.image-slot {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  background: #f5f7fa;
  color: #909399;
  font-size: 20px;
}

/* 调整表格表头颜色 */
::v-deep .custom-table th {
  background-color: #f5f7fa !important;
  color: #606266;
}
</style>