<template>
  <div
    class="app-container"
    v-loading="loading"
    element-loading-text="数据加载/文件上传中..."
  >
    <!-- 1. 顶部搜索与工具栏 -->
    <div class="filter-container">
      <el-form :inline="true" size="small" class="search-form">
        <el-form-item label="影视名称">
          <el-input
            v-model="searchObj.name"
            placeholder="请输入名称"
            clearable
            @keyup.enter.native="fetchPageList(1)"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            icon="el-icon-search"
            @click="fetchPageList(1)"
            >搜索</el-button
          >
          <el-button icon="el-icon-refresh" @click="resetData">重置</el-button>
          <el-button type="success" icon="el-icon-plus" @click="add"
            >发布新影视</el-button
          >
        </el-form-item>
      </el-form>
    </div>

    <!-- 2. 视频列表表格 (富媒体风格) -->
    <el-table
      v-loading="listLoading"
      :data="list"
      stripe
      border
      fit
      highlight-current-row
      style="width: 100%; margin-top: 10px"
    >
      <!-- ID 列 -->
      <el-table-column label="序号" width="70" align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>

      <!-- 核心信息列：封面 + 标题 + 作者 -->
      <el-table-column label="影视信息" min-width="350">
        <template slot-scope="scope">
          <div class="video-info-cell">
            <!-- 封面图 (点击播放) -->
            <div class="cover-wrapper" @click="showPlayPage(scope.row)">
              <el-image class="video-cover" :src="scope.row.image" fit="cover">
                <div slot="error" class="image-slot">
                  <i class="el-icon-picture-outline"></i>
                </div>
              </el-image>
              <!-- 播放蒙层 -->
              <div class="play-mask"><i class="el-icon-caret-right"></i></div>
            </div>

            <!-- 文本信息 -->
            <div class="info-text">
              <!-- 点击标题跳转详情 -->
              <div class="video-title" @click="goToDetail(scope.row)">
                {{ scope.row.name }}
              </div>

              <div class="video-meta">
                <!-- 显示分类名称 -->
                <el-tag size="mini" type="info" style="margin-right: 8px">
                  {{ getCategoryName(scope.row.cid) }}
                </el-tag>
                <span class="director-name">
                  <i class="el-icon-user"></i>
                  {{ scope.row.director || "未知作者" }}
                </span>
              </div>

              <div class="video-desc" :title="scope.row.description">
                {{ scope.row.description || "暂无描述" }}
              </div>
            </div>
          </div>
        </template>
      </el-table-column>

      <!-- 操作列 -->
      <el-table-column label="操作" width="280" align="center" fixed="right">
        <template slot-scope="scope">
          <!-- 跳转详情页按钮 -->
          <el-button
            type="primary"
            size="mini"
            plain
            @click="goToDetail(scope.row)"
            >详情管理</el-button
          >

          <el-button
            type="primary"
            icon="el-icon-edit"
            circle
            size="mini"
            @click="edit(scope.row.id)"
            title="修改信息"
          ></el-button>

          <el-button
            type="success"
            icon="el-icon-video-play"
            circle
            size="mini"
            @click="showPlayPage(scope.row)"
            title="播放预览"
          ></el-button>

          <el-button
            type="danger"
            icon="el-icon-delete"
            circle
            size="mini"
            @click="removeDataById(scope.row.id)"
            title="删除"
          ></el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 3. 分页组件 -->
    <el-pagination
      :current-page="page"
      :total="total"
      :page-sizes="[5, 10, 20]"
      :page-size="limit"
      style="padding: 20px 0; text-align: right"
      layout="total, sizes, prev, pager, next, jumper"
      @current-change="fetchPageList"
      @size-change="handleSizeChange"
    />

    <!-- 4. 添加/修改 弹窗 -->
    <el-dialog
      :title="sysMovie.id ? '修改影视信息' : '发布新影视'"
      :visible.sync="dialogVisible"
      width="50%"
      :close-on-click-modal="false"
    >
      <el-form
        ref="dataForm"
        :model="sysMovie"
        :rules="movieRules"
        label-width="100px"
        size="small"
        style="padding-right: 20px"
      >
        <el-form-item label="影视名称" prop="name">
          <el-input v-model="sysMovie.name" placeholder="请输入标题" />
        </el-form-item>

        <el-form-item label="所属栏目" prop="cid">
          <el-select
            v-model="sysMovie.cid"
            placeholder="请选择影视分类"
            style="width: 100%"
          >
            <el-option
              v-for="item in categoryList"
              :key="item.id"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="作者/导演" prop="username">
          <el-input
            v-model="sysMovie.username"
            placeholder="当前操作人"
            disabled
          />
        </el-form-item>

        <el-form-item label="封面图片" prop="image">
          <el-upload
            class="avatar-uploader"
            action="http://localhost:8085/admin/system/upload/uploadImage"
            name="uploadImage"
            :show-file-list="false"
            :on-success="handleImageSuccess"
            :before-upload="handleBeforeUpload"
          >
            <img v-if="sysMovie.image" :src="sysMovie.image" class="avatar" />
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            <div slot="tip" class="el-upload__tip">点击上传封面</div>
          </el-upload>
        </el-form-item>

        <el-form-item label="影视文件" prop="playId">
          <el-upload
            ref="videoUpload"
            class="upload-demo"
            action="http://localhost:8085/admin/system/upload/uploadVideo"
            name="uploadVideo"
            :on-success="handleVideoSuccess"
            :before-upload="handleBeforeUpload"
            :show-file-list="false"
          >
            <el-button size="small" type="primary" icon="el-icon-upload"
              >上传视频文件</el-button
            >
          </el-upload>
          <!-- 显示已关联的 playId 状态 -->
          <div
            v-if="sysMovie.playId"
            style="color: #67c23a; font-size: 12px; margin-top: 5px"
          >
            <i class="el-icon-check-circle"></i> 视频已上传 (ID:
            {{ sysMovie.playId }})
          </div>
        </el-form-item>

        <el-form-item label="影视描述" prop="description">
          <el-input
            type="textarea"
            :rows="3"
            v-model="sysMovie.description"
          ></el-input>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleSave" :loading="loading"
          >确 定</el-button
        >
      </span>
    </el-dialog>

    <!-- 5. 播放器弹窗 -->
    <el-dialog
      title="视频预览"
      :visible.sync="dialogVideoVisible"
      width="800px"
      top="5vh"
      :destroy-on-close="true"
      append-to-body
      @close="closeDialog"
    >
      <div
        id="J_prismPlayer"
        style="width: 100%; height: 500px; background-color: #000"
      ></div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="closeDialog">关 闭</el-button>
      </span>
    </el-dialog>
  </div>
</template>
  
  <script>
// 导入
import api from "@/api/movie/movie.js";
// 导入分类
import categoryapi from "@/api/category/category.js";

export default {
  name: "VideoList",
  data() {
    // 定义校验规则
    const movieRules = {
      name: [{ required: true, message: "请输入影视名称", trigger: "blur" }],
      cid: [{ required: true, message: "请选择所属栏目", trigger: "change" }],
      username: [
        { required: true, message: "作者名不能为空", trigger: "change" },
      ], // 修改这里

      image: [{ required: true, message: "请上传影视图片", trigger: "change" }],
      playId: [
        { required: true, message: "请上传影视文件", trigger: "change" },
      ],
    };

    const editRules = {
      name: [{ required: true, message: "请输入影视名称", trigger: "blur" }],
      cid: [{ required: true, message: "请选择所属栏目", trigger: "change" }],
      image: [], // 编辑时不需要必填
      playId: [], // 编辑时不需要必填
    };

    return {
      list: [],
      page: 1,
      limit: 5, // 默认为5，可根据你的 handleSizeChange 动态调整
      total: 0,

      searchObj: {
        name: "",
      },

      listLoading: false,
      loading: false, // 全局加载状态（用于上传）

      dialogVisible: false,
      dialogVideoVisible: false,

      sysMovie: {}, // 表单对象
      categoryList: [], // 分类列表

      movieRules,
      editRules,

      currentPlayer: null, // 存储当前播放器实例
    };
  },
  created() {
    this.fetchPageList();
    this.findAll();
  },
  beforeDestroy() {
    // 组件销毁前，确保播放器也被销毁
    if (this.currentPlayer) {
      this.currentPlayer.dispose();
    }
  },
  methods: {
    // --- ：跳转详情页 ---
    goToDetail(row) {
      // 这里的路径要和你 router/index.js 中配置的一致
      this.$router.push(`/video/sysMovie/${row.id}`);
    },

    // --- 辅助：根据ID获取分类名称 ---
    getCategoryName(cid) {
      if (!this.categoryList || this.categoryList.length === 0) return cid;
      const category = this.categoryList.find((item) => item.id === cid);
      return category ? category.name : cid;
    },

    // --- 分页与列表逻辑 ---
    handleSizeChange(val) {
      this.limit = val;
      this.fetchPageList(1);
    },

    fetchPageList(page = 1) {
      this.page = page;
      this.listLoading = true;
      api
        .getMoviePageInfo(this.page, this.limit, this.searchObj)
        .then((response) => {
          this.list = response.data.records;
          this.total = response.data.total;
          this.listLoading = false;
        })
        .catch(() => {
          this.listLoading = false;
        });
    },

    resetData() {
      this.searchObj = {};
      this.fetchPageList(1);
    },

    // --- 分类逻辑 ---
    findAll() {
      categoryapi.findAll().then((response) => {
        this.categoryList = response.data;
      });
    },

    // --- 增删改逻辑 ---
    add() {
      // 1. 切换校验规则
      this.movieRules = this.movieRules;

      // 2. 获取缓存中的用户名
      // 提示：如果你的 username 是存在 JSON 对象里的，记得 JSON.parse()
      const currentUsername = localStorage.getItem("username") || "未知用户";
      // 3. 重置并赋初始值
      this.sysMovie = {
        username: currentUsername, // 默认锁定当前登录人
        name: "",
        cid: "",
        image: "",
        playId: "",
        description: "",
      };
      this.dialogVisible = true;
      this.$nextTick(() => {
        if (this.$refs.dataForm) {
          this.$refs.dataForm.clearValidate();
        }
      });
    },

    edit(id) {
      this.movieRules = this.editRules; // 使用编辑规则（部分非必填）
      this.dialogVisible = true;
      api.getMovieById(id).then((response) => {
        this.sysMovie = response.data;
        this.$nextTick(() => {
          this.$refs.dataForm?.clearValidate();
        });
      });
    },

    handleSave() {
      this.$refs.dataForm.validate((valid) => {
        if (valid) {
          this.saveOrUpdate();
        } else {
          this.$message.error("请按要求填写表单！");
          return false;
        }
      });
    },

    saveOrUpdate() {
      if (this.sysMovie.id != null) {
        this.updateMovie();
      } else {
        this.addMovie();
      }
    },

    addMovie() {
      api
        .addMovie(this.sysMovie)
        .then(() => {
          this.$message.success("添加成功!");
          this.dialogVisible = false;
          this.fetchPageList(1);
        })
        .catch((error) => {
          console.error("添加失败:", error);
          this.$message.error("添加失败!");
        });
    },

    updateMovie() {
      api
        .updateMovie(this.sysMovie)
        .then(() => {
          this.$message.success("修改成功!");
          this.dialogVisible = false;
          this.fetchPageList(this.page);
        })
        .catch((error) => {
          console.error("修改失败:", error);
          this.$message.error("修改失败!");
        });
    },

    removeDataById(id) {
      this.$confirm("此操作将永久删除该影视, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        api.removeMovieById(id).then(() => {
          this.$message.success("删除成功!");
          this.fetchPageList(this.page);
        });
      });
    },

    // --- 上传逻辑 ---
    handleBeforeUpload() {
      this.loading = true;
    },

    handleImageSuccess(res, file) {
      this.loading = false;
      if (res) {
        // 根据你的逻辑，res.data 是图片路径
        this.sysMovie.image = res.data;
        this.$message.success("图片上传成功");
      } else {
        this.$message.error("图片上传失败");
      }
    },

    handleVideoSuccess(res, file) {
      this.loading = false;
      if (res) {
        this.sysMovie.playId = res;
        this.$message.success("视频上传成功");
        this.$refs.videoUpload.clearFiles();
      } else {
        this.$message.error("视频上传失败");
      }
    },

    // --- 播放器逻辑 ---
    showPlayPage(row) {
      this.dialogVideoVisible = true;
      // 传递 row.id 去获取 playAuth
      this.$nextTick(() => {
        this.initPlayer(row.id);
      });
    },

    initPlayer(movieId) {
      // 销毁旧实例
      if (this.currentPlayer) {
        this.currentPlayer.dispose();
        this.currentPlayer = null;
      }

      // 获取播放凭证
      api
        .getPlayAuthById(movieId)
        .then((response) => {
          const playInfo = response.data;
          // 初始化阿里云播放器
          /* eslint-disable no-undef */
          this.currentPlayer = new Aliplayer(
            {
              id: "J_prismPlayer",
              width: "100%",
              height: "500px",
              autoplay: false, // 打开弹窗自动播放
              controlBarVisibility: "hover",
              isLive: false,
              cover: playInfo.image,
              vid: playInfo.playId,
              playauth: playInfo.playAuth,
              encryptType: 1,
              // 你的 License 配置
              license: {
                domain: "lucky-nicke-movie.oss-cn-shenzhen.aliyuncs.com",
                key: "xPfu7NfoGscF2Fycvf1255184446947d1afdf46e27fef31bc",
              },
            },
            (player) => {
              console.log("播放器创建成功");
            }
          );
        })
        .catch((err) => {
          console.error("获取播放信息失败:", err);
          this.$message.error("获取视频播放信息失败！");
        });
    },

    closeDialog() {
      this.dialogVideoVisible = false;
      if (this.currentPlayer) {
        this.currentPlayer.dispose();
        this.currentPlayer = null;
      }
    },
  },
};
</script>
  
  <style lang="scss" scoped>
.app-container {
  padding: 20px;
}

/* 视频信息单元格样式 */
.video-info-cell {
  display: flex;
  align-items: flex-start;
  padding: 5px 0;

  .cover-wrapper {
    position: relative;
    width: 120px;
    height: 68px;
    flex-shrink: 0;
    margin-right: 15px;
    cursor: pointer;
    border-radius: 4px;
    overflow: hidden;
    background-color: #f5f5f5;

    .video-cover {
      width: 100%;
      height: 100%;
    }

    .play-mask {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0, 0, 0, 0.3);
      display: flex;
      justify-content: center;
      align-items: center;
      opacity: 0;
      transition: opacity 0.3s;
      i {
        color: #fff;
        font-size: 24px;
      }
    }

    &:hover .play-mask {
      opacity: 1;
    }
  }

  .info-text {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    height: 75px;

    .video-title {
      font-size: 14px;
      font-weight: 600;
      color: #303133;
      cursor: pointer;
      line-height: 1.4;
      margin-bottom: 6px;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;

      &:hover {
        color: #409eff;
      }
    }

    .video-meta {
      font-size: 12px;
      color: #909399;
      display: flex;
      align-items: center;
      margin-bottom: 4px;
    }

    .video-desc {
      font-size: 12px;
      color: #999;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      max-width: 220px;
    }
  }
}

/* 封面上传样式 */
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
  height: 100px; /* 16:9 */
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