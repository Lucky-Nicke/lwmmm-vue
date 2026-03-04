<template>
  <div v-loading="loading" element-loading-text="文件上传中......">
    <!--查询表单-->
    <div class="search-div">
      <el-form label-width="70px" size="small">
        <el-row>
          <el-col :span="24">
            <el-form-item label="影视名称">
              <el-input
                style="width: 100%"
                v-model="searchObj.name"
                placeholder="影视名称"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row style="display: flex">
          <el-button
            type="primary"
            icon="el-icon-search"
            size="mini"
            @click="fetchPageList()"
            >搜索</el-button
          >
          <el-button icon="el-icon-refresh" size="mini" @click="resetData"
            >重置</el-button
          >
        </el-row>
      </el-form>
    </div>

    <!-- 工具条 -->
    <div class="tools-div">
      <el-button type="success" icon="el-icon-plus" size="mini" @click="add"
        >添 加</el-button
      >
    </div>

    <!-- 在 el-dialog 内部的 el-form 上添加 rules 属性 -->
    <el-dialog title="添加/修改" :visible.sync="dialogVisible" width="40%">
      <el-form
        ref="dataForm"
        :model="sysMovie"
        :rules="movieRules"
        label-width="150px"
        size="small"
        style="padding-right: 40px"
      >
        <el-form-item label="影视名称" prop="name">
          <!-- 为需要校验的字段添加 prop -->
          <el-input v-model="sysMovie.name" />
        </el-form-item>

        <el-form-item label="所属栏目" prop="cid">
          <!-- 为需要校验的字段添加 prop -->
          <el-select v-model="sysMovie.cid" placeholder="请选择影视分类">
            <el-option
              v-for="item in categoryList"
              :key="item.id"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="作者" prop="director">
          <el-input v-model="sysMovie.director"></el-input>
        </el-form-item>

        <el-form-item label="影视图片" prop="image">
          <el-upload
            class="upload-demo"
            name="uploadImage"
            action="http://localhost:8085/admin/system/upload/uploadImage"
            :limit="1"
            :on-success="handleImageSuccess"
            :before-upload="handleBeforeUpload"
            :show-file-list="false"
          >
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>

        <el-form-item label="影视文件" prop="playId">
          <!-- 注意：后端接收的字段是 playId -->
          <el-upload
            class="upload-demo"
            name="uploadVideo"
            action="http://localhost:8085/admin/system/upload/uploadVideo"
            :limit="1"
            :on-success="handleVideoSuccess"
            :before-upload="handleBeforeUpload"
            :show-file-list="false"
          >
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>

        <el-form-item label="影视描述" prop="description">
          <el-input v-model="sysMovie.description"></el-input>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button
          @click="dialogVisible = false"
          size="small"
          icon="el-icon-refresh-right"
          >取 消</el-button
        >
        <!-- 将确定按钮的点击事件改为 handleSave -->
        <el-button
          type="primary"
          icon="el-icon-check"
          @click="handleSave"
          size="small"
          >确 定</el-button
        >
      </span>
    </el-dialog>

    <!-- 表格 -->
    <el-table
      v-loading="listLoading"
      :data="list"
      stripe
      border
      style="width: 100%; margin-top: 10px"
    >
      <el-table-column label="序号" width="70" align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>

      <el-table-column prop="name" label="影视名称" />
      <el-table-column prop="cid" label="影视类型" :formatter="cidformatter" />
      <el-table-column prop="director" label="作者" width="160" />

      <el-table-column prop="image" label="剧照">
        <template slot-scope="scope">
          <viewer v-if="scope.row.image" :images="scope.row.image">
            <img alt="剧照" :src="scope.row.image" style="height: 80px" />
          </viewer>
          <span v-else style="color: #999; font-size: 12px">暂无图片</span>
        </template>
      </el-table-column>

      <el-table-column label="操作" width="200" align="center">
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
            @click="showPlayPage(scope.row)"
            title="播放视频"
          />
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页组件 -->
    <el-pagination
      :current-page="page"
      :total="total"
      :page-sizes="[5, 10, 20]"
      :page-size="limit"
      style="padding: 30px 0; text-align: center"
      layout="total, sizes, prev,pager, next, jumper"
      @current-change="fetchPageList"
      @size-change="handleSizeChange"
    />

    <el-dialog
      title="播放视频"
      :visible.sync="dialogVideoVisible"
      width="60%"
      top="5vh"
      :destroy-on-close="true"
      append-to-body
    >
      <div id="J_prismPlayer" style="width: 100%; height: 500px"></div>
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
  data() {
    // 定义校验规则
    const movieRules = {
      name: [{ required: true, message: "请输入影视名称", trigger: "blur" }],
      cid: [{ required: true, message: "请选择所属栏目", trigger: "change" }],
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
      limit: 5,
      total: 0,
      searchObj: {},
      listLoading: false,
      dialogVisible: false,
      sysMovie: {},
      categoryList: [],
      fileurl: "",
      loading: false,
      VideodialogVisible: false,
      movieRules, // 将规则对象添加到 data 中
      editRules, // 保存引用

      dialogVideoVisible: false, // 控制弹窗显示
      currentPlayer: null, // 存储当前播放器实例
    };
  },
  mounted() {},
  created() {
    this.fetchPageList();
    this.findAll();
  },
  methods: {
    // 处理每页显示条数变化
    handleSizeChange(val) {
      this.limit = val; // 更新每页显示条数
      this.fetchPageList(1); // 重置页码为1并重新获取数据
    },
    cidformatter(row, column) {
      // 直接返回数字ID
      return row.cid;
    },
    findAll() {
      categoryapi.findAll().then((response) => {
        this.categoryList = response.data;
      });
    },
    edit(id) {
      // 切换到编辑模式的规则
      this.movieRules = this.editRules;
      this.dialogVisible = true;
      api.getMovieById(id).then((response) => {
        this.sysMovie = response.data;
        // 清除校验提示，防止旧的必填提示残留
        this.$nextTick(() => {
          this.$refs.dataForm?.clearValidate();
        });
      });
    },
    handleBeforeUpload() {
      this.loading = true;
    },
    handleImageSuccess(res, file) {
      console.log(res);

      this.loading = false;
      if (res) {
        // 校验 res 是否存在
        this.sysMovie.image = res.data; // 直接使用 res，而不是 file.response

        this.$message({
          type: "info",
          message: "图片上传成功",
          duration: 6000,
        });
      } else {
        this.$message({
          type: "info",
          message: "图片上传失败",
          duration: 6000,
        });
      }
    },
    handleVideoSuccess(res, file) {
      this.loading = false;
      if (res) {
        // 校验 res 是否存在
        console.log(file);
        this.sysMovie.playId = res; // 直接使用 res
        this.$message({
          type: "info",
          message: "视频上传成功",
          duration: 6000,
        });
      } else {
        this.$message({
          type: "info",
          message: "视频上传失败",
          duration: 6000,
        });
      }
    },
    // 新增一个方法，在提交前进行校验
    handleSave() {
      this.$refs.dataForm.validate((valid) => {
        if (valid) {
          // 如果校验通过，则执行保存或更新操作
          this.saveOrUpdate();
        } else {
          // 如果校验不通过，给出提示（Element UI 会自动高亮显示错误项）
          console.log("表单校验失败!");
          this.$message({
            type: "error",
            message: "请按要求填写表单！",
          });
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
        .then((response) => {
          this.$message({
            type: "success",
            message: "添加成功!",
          });
          this.dialogVisible = false;
          this.fetchPageList();
        })
        .catch((error) => {
          console.error("添加失败:", error);
          this.$message({
            type: "error",
            message: "添加失败!",
          });
        });
    },
    updateMovie() {
      api
        .updateMovie(this.sysMovie)
        .then((response) => {
          this.$message({
            type: "success",
            message: "修改成功!",
          });
          this.dialogVisible = false;
          this.fetchPageList();
        })
        .catch((error) => {
          console.error("修改失败:", error);
          this.$message({
            type: "error",
            message: "修改失败!",
          });
        });
    },
    add() {
      this.movieRules = this.movieRules;

      this.sysMovie = {};
      this.dialogVisible = true;
      // 清除上一次的校验结果
      this.$nextTick(() => {
        if (this.$refs.dataForm) {
          this.$refs.dataForm.clearValidate();
        }
      });
    },
    removeDataById(id) {
      this.$confirm("此操作将永久删除该影视, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        api.removeMovieById(id).then((response) => {
          this.$message({
            type: "success",
            message: "删除成功!",
          });
          this.fetchPageList();
        });
      });
    },
    resetData() {
      this.searchObj = {};
      this.fetchPageList();
    },
    fetchPageList(page = 1) {
      this.page = page;
      api
        .getMoviePageInfo(this.page, this.limit, this.searchObj)
        .then((response) => {
          this.list = response.data.records;
          this.total = response.data.total;
        });
    },
    showPlayPage(row) {
      // 这里可以根据row的某个属性来判断是否有视频可播
      // 假设row中有playId等信息，或者先打开弹窗再根据ID请求
      // 为了演示，我们直接打开弹窗，并传入row数据
      this.dialogVideoVisible = true;
      // 确保DOM更新后再初始化播放器
      this.$nextTick(() => {
        this.initPlayer(row.id);
      });
    },

    initPlayer(movieId) {
      // 销毁旧的播放器实例（如果存在）
      if (this.currentPlayer) {
        this.currentPlayer.dispose();
        this.currentPlayer = null;
      }

      // 调用API获取播放凭证
      import("@/api/movie/movie.js").then((apiModule) => {
        const api = apiModule.default;
        api
          .getPlayAuthById(movieId)
          .then((response) => {
            console.log(response);
            const playInfo = response.data;

            // 初始化阿里云播放器
            this.currentPlayer = new window.Aliplayer(
              {
                id: "J_prismPlayer",
                width: "100%",
                height: "500px",
                autoplay: false,
                controlBarVisibility: "hover",
                isLive: false,
                cover: playInfo.image,
                vid: playInfo.playId,
                playauth: playInfo.playAuth,
                encryptType: 1,
                license: {
                  domain: "lucky-nicke-movie.oss-cn-shenzhen.aliyuncs.com",
                  key: "xPfu7NfoGscF2Fycvf1255184446947d1afdf46e27fef31bc",
                },
              },
              (player) => {
                console.log("播放器创建好了。");
              }
            );
          })
          .catch((err) => {
            console.error("获取播放信息失败:", err);
            this.$message.error("获取视频播放信息失败！");
          });
      });
    },

    closeDialog() {
      this.dialogVideoVisible = false;
      // 关闭弹窗时销毁播放器，释放资源
      if (this.currentPlayer) {
        this.currentPlayer.dispose();
        this.currentPlayer = null;
      }
    },
  },
  beforeDestroy() {
    // 组件销毁前，确保播放器也被销毁
    if (this.currentPlayer) {
      this.currentPlayer.dispose();
    }
  },
};
</script>

<style lang="less" scoped>
</style>