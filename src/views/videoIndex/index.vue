<template>
  <div class="portal-container">
    <!-- 顶部导航栏 (门户页的导航栏，将始终显示) -->
    <nav class="navbar">
      <div class="nav-left">
        <!-- 点击 Logo 返回门户主页 -->
        <a href="#" class="logo" @click="$router.push('/index')"
          >影视管理系统 📺</a
        >
        <div
          class="nav-categories"
          v-if="
            !['VideoDetail', 'UserCenter', 'CreatorCenter'].includes(
              $route.name
            )
          "
        >
          <span
            v-for="cat in mainCategories"
            :key="cat.id || cat.name"
            class="cat-item"
            :class="{ 'active-cat': activeCategory === cat.name }"
            @click="handleCategoryClick(cat)"
          >
            {{ cat.name }}
          </span>
          <el-dropdown
            v-if="hasOverflowCategories"
            @command="handleCategoryClick"
            trigger="hover"
            class="more-dropdown"
          >
            <span class="el-dropdown-link cat-item more-categories">
              更多 <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item
                v-for="cat in overflowCategories"
                :key="cat.id || cat.name"
                :command="cat"
                :class="{ 'active-cat-dropdown': activeCategory === cat.name }"
              >
                {{ cat.name }}
              </el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </div>

      <!-- 在 nav-left 结束标签后，nav-right 开始标签前插入 -->
      <div class="nav-center">
        <div class="search-bar">
          <input
            v-model="searchQuery"
            placeholder="搜索视频标题..."
            @input="handleSearch"
            @keyup.enter="handleSearch"
          />
          <i class="el-icon-search search-icon" @click="handleSearch"></i>
        </div>
      </div>

      <div class="nav-right">
        <template v-if="!isLogin">
          <button class="login-btn" @click="showAuthDialog('login')">
            登录
          </button>
        </template>
        <template v-else>
          <el-dropdown
            @command="handleUserCommand"
            trigger="hover"
            class="avatar-dropdown"
          >
            <div class="avatar-wrapper">
              <img
                :src="
                  userInfo.avatar ||
                  'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
                "
                class="user-avatar"
                alt="avatar"
              />
            </div>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="upload">创作中心</el-dropdown-item>
              <el-dropdown-item command="profile">个人介绍</el-dropdown-item>
              <el-dropdown-item command="history">观看记录</el-dropdown-item>
              <el-dropdown-item command="likes">点赞列表</el-dropdown-item>
              <el-dropdown-item divided command="logout"
                >退出登录</el-dropdown-item
              >
            </el-dropdown-menu>
          </el-dropdown>
        </template>
      </div>
    </nav>

    <!-- 主体内容区容器，包含门户主页或视频详情页 -->
    <router-view
      v-if="
        ['VideoDetail', 'UserCenter', 'CreatorCenter'].includes($route.name)
      "
    ></router-view>
    <template v-else>
      <div class="container">
        <main class="main-content">
          <div
            class="category-header"
            v-if="activeCategory !== '首页' || searchQuery"
          >
            <h2 v-if="searchQuery">
              搜索关键词为：<span style="color: var(--primary-color)">{{
                searchQuery
              }}</span>
            </h2>
            <h2 v-else>当前分类：{{ activeCategory }}</h2>
            <!-- 这里原有的 <p> 标签（这里是 XX 分类的视频列表）已被删除 -->
          </div>
          <!-- 修改轮播图：增加 !searchQuery 判断，当有搜索内容时隐藏 -->
          <div
            class="hot-videos-carousel-wrapper"
            v-if="activeCategory === '首页' && !searchQuery"
          >
            <el-carousel
              :interval="4000"
              height="280px"
              v-loading="hotVideoLoading"
            >
              <el-carousel-item v-for="video in hotVideoList" :key="video.id">
                <div
                  class="carousel-item-content"
                  :style="{ backgroundImage: 'url(' + video.cover + ')' }"
                  @click="goToVideoDetail(video.id)"
                >
                  <div class="carousel-text-overlay">
                    <div class="carousel-title">{{ video.title }}</div>
                    <div class="carousel-meta">
                      <span>{{ video.author }}</span>
                      <span>▶ {{ video.views }}</span>
                    </div>
                  </div>
                </div>
              </el-carousel-item>
            </el-carousel>
          </div>
          <transition name="fade-content" mode="out-in">
            <div
              v-if="displayedVideoList.length > 0"
              :key="activeCategory + '_content'"
            >
              <div class="video-grid" v-loading="videoLoading">
                <div
                  class="video-card"
                  v-for="video in displayedVideoList"
                  :key="video.id"
                  @click="goToVideoDetail(video.id)"
                >
                  <div
                    class="video-cover"
                    :style="{
                      backgroundImage: 'url(' + video.cover + ')',
                      backgroundSize: 'cover',
                      backgroundPosition: 'center',
                    }"
                  ></div>
                  <div class="video-info">
                    <div class="video-title">{{ video.title }}</div>
                    <div class="video-meta">
                      <span>作者: {{ video.author }}</span>
                      <span>▶ {{ video.views }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div
              v-else-if="!videoLoading"
              :key="activeCategory + '_empty'"
              class="empty-content-placeholder"
            >
              这里空空如也...
            </div>
          </transition>
        </main>
        <aside class="sidebar">
          <h3>📈 全站排行榜</h3>
          <div class="rank-list" v-loading="rankLoading">
            <div
              class="rank-item"
              v-for="(rank, index) in rankList"
              :key="rank.id || index"
              @click="goToVideoDetail(rank.id)"
            >
              <span class="rank-num">{{ index + 1 }}</span>
              <span class="rank-title">{{ rank.title }}</span>
            </div>
            <p
              v-if="rankList.length === 0 && !rankLoading"
              style="color: #999; text-align: center; margin-top: 15px"
            >
              暂无排行榜数据
            </p>
          </div>
        </aside>
      </div>
      <!-- 右下角悬浮按钮 (只在门户主页显示) -->
      <div class="floating-tools">
        <div class="tool-btn top-btn" title="返回顶部" @click="scrollToTop">
          ⬆️
        </div>
      </div>
    </template>

    <!-- ===== 综合鉴权弹窗 (登录/注册/忘记密码) ===== -->
    <el-dialog
      :visible.sync="authVisible"
      width="420px"
      custom-class="beautiful-auth-dialog"
      :show-close="false"
      center
      destroy-on-close
      @closed="resetAllForms"
    >
      <div class="auth-header">
        <div class="auth-logo">影视管理系统 📺</div>
        <div class="auth-title">{{ authTitle }}</div>
        <i class="el-icon-close close-icon" @click="authVisible = false"></i>
      </div>
      <div class="auth-body">
        <transition name="slide-fade" mode="out-in">
          <!-- 1. 登录视图 -->
          <div
            v-if="currentView === 'login'"
            key="login"
            class="auth-form-wrapper"
          >
            <el-form ref="loginForm" :model="loginForm" :rules="loginRules">
              <el-form-item prop="username">
                <el-input
                  v-model="loginForm.username"
                  placeholder="请输入账号"
                  prefix-icon="el-icon-user"
                ></el-input>
              </el-form-item>
              <el-form-item prop="password">
                <el-input
                  v-model="loginForm.password"
                  placeholder="请输入密码"
                  prefix-icon="el-icon-lock"
                  show-password
                  @keyup.enter.native="handleLoginSubmit"
                ></el-input>
              </el-form-item>
              <div class="auth-options">
                <el-link
                  type="primary"
                  :underline="false"
                  @click="switchView('register')"
                  >立即注册</el-link
                >
                <el-link
                  type="info"
                  :underline="false"
                  @click="switchView('forgot')"
                  >忘记密码？</el-link
                >
              </div>
              <el-form-item class="submit-item">
                <el-button
                  type="primary"
                  class="submit-btn login-btn-color"
                  :loading="loading"
                  @click="handleLoginSubmit"
                >
                  登 录
                </el-button>
              </el-form-item>
            </el-form>
          </div>
          <!-- 2. 注册视图 -->
          <div
            v-else-if="currentView === 'register'"
            key="register"
            class="auth-form-wrapper"
          >
            <el-form
              ref="registerForm"
              :model="registerForm"
              :rules="registerRules"
            >
              <el-form-item prop="username">
                <el-input
                  v-model="registerForm.username"
                  placeholder="设置账号名"
                  prefix-icon="el-icon-user"
                ></el-input>
              </el-form-item>
              <el-form-item prop="nickname">
                <el-input
                  v-model="registerForm.nickname"
                  placeholder="设置昵称"
                  prefix-icon="el-icon-postcard"
                ></el-input>
              </el-form-item>
              <el-form-item prop="phone">
                <el-input
                  v-model="registerForm.phone"
                  placeholder="输入11位手机号"
                  prefix-icon="el-icon-mobile-phone"
                ></el-input>
              </el-form-item>
              <el-form-item prop="password">
                <el-input
                  v-model="registerForm.password"
                  placeholder="设置密码 (至少6位)"
                  prefix-icon="el-icon-lock"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item prop="confirmPassword">
                <el-input
                  v-model="registerForm.confirmPassword"
                  placeholder="确认密码"
                  prefix-icon="el-icon-lock"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item class="submit-item register-actions">
                <el-button
                  type="primary"
                  class="submit-btn"
                  :loading="loading"
                  @click="handleRegisterSubmit"
                  >注 册</el-button
                >
                <div class="back-login">
                  已有账号？
                  <el-link
                    type="primary"
                    :underline="false"
                    @click="switchView('login')"
                    >返回登录</el-link
                  >
                </div>
              </el-form-item>
            </el-form>
          </div>
          <!-- 3. 忘记密码(修改密码)视图 -->
          <div
            v-else-if="currentView === 'forgot'"
            key="forgot"
            class="auth-form-wrapper"
          >
            <el-form ref="forgotForm" :model="forgotForm" :rules="forgotRules">
              <el-form-item prop="username">
                <el-input
                  v-model="forgotForm.username"
                  placeholder="请输入账号"
                  prefix-icon="el-icon-user"
                ></el-input>
              </el-form-item>
              <el-form-item prop="oldPassword">
                <el-input
                  v-model="forgotForm.oldPassword"
                  placeholder="请输入旧密码"
                  prefix-icon="el-icon-unlock"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item prop="newPassword">
                <el-input
                  v-model="forgotForm.newPassword"
                  placeholder="设置新密码 (至少6位)"
                  prefix-icon="el-icon-lock"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item prop="confirmNewPassword">
                <el-input
                  v-model="forgotForm.confirmNewPassword"
                  placeholder="确认新密码"
                  prefix-icon="el-icon-lock"
                  show-password
                ></el-input>
              </el-form-item>
              <el-form-item class="submit-item register-actions">
                <el-button
                  type="primary"
                  class="submit-btn"
                  :loading="loading"
                  @click="handleForgotSubmit"
                  >确认修改</el-button
                >
                <div class="back-login">
                  记起密码了？
                  <el-link
                    type="primary"
                    :underline="false"
                    @click="switchView('login')"
                    >返回登录</el-link
                  >
                </div>
              </el-form-item>
            </el-form>
          </div>
        </transition>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import categoryApi from "@/api/category/category";
import { setToken, removeToken, getToken } from "@/utils/auth";
import movieApi from "@/api/movie/movie";
import {
  login,
  logout,
  resetPassword,
  getInfo,
  registerUser,
} from "@/api/user";

export default {
  name: "PortalPage",
  data() {
    // --- 校验器定义 ---
    const validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.registerForm.password) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    const validateNewPass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入新密码"));
      } else if (value !== this.forgotForm.newPassword) {
        callback(new Error("两次输入新密码不一致!"));
      } else {
        callback();
      }
    };
    const validatePhone = (rule, value, callback) => {
      const phoneReg = /^1[3-9]\d{9}$/;
      if (!value) {
        callback(new Error("请输入手机号"));
      } else if (!phoneReg.test(value)) {
        callback(new Error("手机号格式不正确 (需11位)"));
      } else {
        callback();
      }
    };

    return {
      searchQuery: "", // 新增：搜索关键词

      isLogin: false,
      authVisible: false,
      userInfo: {
        avatar: "",
      },
      currentView: "login", // 'login' | 'register' | 'forgot'
      loading: false,
      videoLoading: true,

      // --- 表单数据 ---
      loginForm: { username: "", password: "" },
      registerForm: {
        username: "",
        nickname: "",
        phone: "",
        password: "",
        confirmPassword: "",
      },
      forgotForm: {
        username: "",
        oldPassword: "",
        newPassword: "",
        confirmNewPassword: "",
      },

      // --- 校验规则 ---
      loginRules: {
        username: [{ required: true, message: "请输入账号", trigger: "blur" }],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }],
      },
      registerRules: {
        username: [
          { required: true, message: "请输入账号名", trigger: "blur" },
        ],
        nickname: [{ required: true, message: "请输入昵称", trigger: "blur" }],
        phone: [{ required: true, validator: validatePhone, trigger: "blur" }],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { min: 6, message: "密码长度不能小于6位", trigger: "blur" },
        ],
        confirmPassword: [
          { required: true, validator: validatePass2, trigger: "blur" },
        ],
      },
      forgotRules: {
        username: [{ required: true, message: "请输入账号", trigger: "blur" }],
        oldPassword: [
          { required: true, message: "请输入旧密码", trigger: "blur" },
        ],
        newPassword: [
          { required: true, message: "请输入新密码", trigger: "blur" },
          { min: 6, message: "新密码长度不能小于6位", trigger: "blur" },
        ],
        confirmNewPassword: [
          { required: true, validator: validateNewPass2, trigger: "blur" },
        ],
      },

      // --- 页面静态数据 ---
      categories: [{ id: 0, name: "首页" }],
      activeCategory: "首页",
      videoList: [],
      displayedVideoList: [],
      hotVideoLoading: true,
      hotVideoList: [],
      initialCategoryDisplayLimit: 6, // 分类展示限制
      rankLoading: true,
      rankList: [],
    };
  },
  created() {
    this.checkLoginStatus();
    this.getCategoryList();
    this.fetchVideos();
    this.fetchHotVideos();
    this.fetchRankVideos();
  },
  computed: {
    authTitle() {
      if (this.currentView === "login") return "欢迎回来";
      if (this.currentView === "register") return "注册新账号";
      if (this.currentView === "forgot") return "找回/修改密码";
      return "";
    },
    mainCategories() {
      const homepage = [{ id: 0, name: "首页" }];
      const otherCategories = this.categories.filter(
        (cat) => cat.name !== "首页"
      );
      if (this.categories.length <= this.initialCategoryDisplayLimit) {
        return this.categories;
      }
      return homepage.concat(
        otherCategories.slice(0, this.initialCategoryDisplayLimit - 1)
      );
    },
    hasOverflowCategories() {
      return this.categories.length > this.initialCategoryDisplayLimit;
    },
    overflowCategories() {
      if (!this.hasOverflowCategories) return [];
      const otherCategories = this.categories.filter(
        (cat) => cat.name !== "首页"
      );
      return otherCategories.slice(this.initialCategoryDisplayLimit - 1);
    },
  },
  methods: {
    // 1. 页面加载时检查登录状态并同步本地存储
    checkLoginStatus() {
      const token = getToken();
      if (token) {
        getInfo(token)
          .then((res) => {
            if (res.code === 200 && res.data) {
              this.userInfo.avatar = res.data.avatar;
              this.isLogin = true;
              // --- 新增：存储到 localStorage ---
              localStorage.setItem("userId", res.data.userId);
              localStorage.setItem("username", res.data.username);
              // ------------------------------
            } else {
              this.clearLocalUserData(); // 清理
              this.isLogin = false;
            }
          })
          .catch(() => {
            this.clearLocalUserData(); // 清理
            this.isLogin = false;
          });
      }
    },
    // 辅助方法：统一清理本地用户数据
    clearLocalUserData() {
      removeToken();
      localStorage.removeItem("userId");
      localStorage.removeItem("username");
      this.userInfo.avatar = "";
    },
    goToVideoDetail(videoId) {
      if (videoId) {
        this.$router.push({ name: "VideoDetail", params: { id: videoId } });
      } else {
        this.$message.warning("视频ID缺失，无法跳转！");
      }
    },
    scrollToTop() {
      window.scrollTo({ top: 0, behavior: "smooth" });
    },
    fetchRankVideos() {
      this.rankLoading = true;
      movieApi
        .getHotWatchVideoInfo()
        .then((res) => {
          if (res.code === 200 && res.data) {
            this.rankList = res.data;
          } else {
            this.$message.error(res.message || "获取排行榜失败！");
            this.rankList = [];
          }
        })
        .catch((error) => {
          this.$message.error("加载排行榜失败，请稍后重试！");
          console.error("Error fetching rank videos:", error);
          this.rankList = [];
        })
        .finally(() => {
          this.rankLoading = false;
        });
    },
    fetchHotVideos() {
      this.hotVideoLoading = true;
      movieApi
        .getHotVideoInfo()
        .then((res) => {
          if (res.code === 200 && res.data) {
            this.hotVideoList = res.data.map((item) => ({
              title: item.videoTitle || item.title,
              author: item.uploaderName || item.author,
              views: item.playCount || item.views,
              id: item.videoId || item.id,
              cover: item.coverUrl || "",
              category: item.category,
            }));
          } else {
            this.$message.error(res.message || "获取热门视频失败！");
          }
        })
        .catch((error) => {
          this.$message.error("加载热门视频失败，请稍后重试！");
          console.error("Error fetching hot videos:", error);
        })
        .finally(() => {
          this.hotVideoLoading = false;
        });
    },
    // 找到 methods 中的 filterVideos 并替换为以下内容
    filterVideos() {
      let filtered = [...this.videoList];
      // 1. 处理分类逻辑
      if (this.activeCategory !== "首页") {
        filtered = filtered.filter(
          (video) => video.category === this.activeCategory
        );
      }
      // 2. 处理搜索逻辑 (前端过滤)
      if (this.searchQuery.trim()) {
        const query = this.searchQuery.trim().toLowerCase();
        filtered = filtered.filter((video) =>
          video.title.toLowerCase().includes(query)
        );
      }
      this.displayedVideoList = filtered;
    },
    // 新增 handleSearch 方法
    handleSearch() {
      // 如果当前在详情页，搜索时自动跳转回主页展示结果
      if (this.$route.name === "VideoDetail") {
        this.$router.push({ name: "VideoPortalIndex" }).then(() => {
          this.filterVideos();
        });
      } else {
        this.filterVideos();
      }
    },
    fetchVideos() {
      this.videoLoading = true;
      movieApi
        .getAllVideoInfo()
        .then((res) => {
          if (res.code === 200 && res.data) {
            this.videoList = res.data.map((item) => ({
              title: item.videoTitle || item.title,
              author: item.uploaderName || item.author,
              views: item.playCount || item.views,
              id: item.videoId || item.id,
              cover: item.coverUrl || "",
              category: item.category,
            }));
            this.filterVideos();
          } else {
            this.$message.error(res.message || "获取视频列表失败！");
          }
        })
        .catch((error) => {
          this.$message.error("加载视频失败，请稍后重试！");
        })
        .finally(() => {
          this.videoLoading = false;
        });
    },
    getCategoryList() {
      categoryApi
        .findAll()
        .then((res) => {
          if (res.code === 200) {
            const remoteList = res.data.map((item) => ({
              id: item.id,
              name: item.categoryName || item.name,
            }));
            this.categories = [{ id: 0, name: "首页" }, ...remoteList];
          }
        })
        .catch((err) => {
          console.error("调用失败", err);
        });
    },
    resetAllForms() {
      this.loginForm = { username: "", password: "" };
      this.registerForm = {
        username: "",
        nickname: "",
        phone: "",
        password: "",
        confirmPassword: "",
      };
      this.forgotForm = {
        username: "",
        oldPassword: "",
        newPassword: "",
        confirmNewPassword: "",
      };
    },
    showAuthDialog(view) {
      this.resetAllForms();
      this.currentView = view;
      this.authVisible = true;
    },
    switchView(view) {
      this.resetAllForms();
      this.currentView = view;
    },
    handleCategoryClick(cat) {
      if (this.$route.name === "VideoDetail") {
        this.$router.push({ name: "VideoPortalIndex" }).then(() => {
          this.activeCategory = cat.name;
          this.filterVideos();
        });
      } else {
        this.activeCategory = cat.name;
        this.filterVideos();
      }
    },
    // 2. 登录逻辑修改
    handleLoginSubmit() {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          login(this.loginForm)
            .then((res) => {
              const code = res.code || (res.data && res.data.code);
              if (code === 200) {
                const token = res.data.token || res.token || "";
                if (token) setToken(token);
                return getInfo(token);
              } else {
                this.$message.error(
                  res.message || "登录失败，请检查账号密码！"
                );
                return Promise.reject(res.message);
              }
            })
            .then((infoRes) => {
              if (infoRes.code === 200 && infoRes.data) {
                this.userInfo.avatar = infoRes.data.avatar;

                // --- 新增：登录成功存入 localStorage ---
                localStorage.setItem("userId", infoRes.data.userId);
                localStorage.setItem("username", infoRes.data.username);
                // ------------------------------------
                this.$message.success("登录成功！");
                this.isLogin = true;
                this.authVisible = false;
                this.$root.$emit("on-user-login-success");
              } else {
                this.$message.warning("登录成功但获取用户信息失败！");
                this.clearLocalUserData();
                this.isLogin = false;
                this.authVisible = false;
              }
            })
            .catch((error) => {
              if (!error || typeof error === "string") {
                this.$message.error(error || "登录请求异常，请稍后重试！");
              }
            })
            .finally(() => {
              this.loading = false;
            });
        }
      });
    },
    handleRegisterSubmit() {
      this.$refs.registerForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          const payload = {
            username: this.registerForm.username,
            nickname: this.registerForm.nickname,
            phone: this.registerForm.phone,
            password: this.registerForm.password,
          };
          registerUser(payload)
            .then((res) => {
              const code = res.code || (res.data && res.data.code);
              const message = res.message || (res.data && res.data.message);
              if (code === 200) {
                this.$message.success("注册成功，请登录！");
                const newUsername = this.registerForm.username;
                this.switchView("login");
                this.loginForm.username = newUsername;
              } else {
                this.$message.error(message || "注册失败，请稍后重试！");
              }
            })
            .catch((error) => {
              console.error("注册请求异常，请稍后重试！");
            })
            .finally(() => {
              this.loading = false;
            });
        }
      });
    },
    handleForgotSubmit() {
      this.$refs.forgotForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          const payload = {
            username: this.forgotForm.username,
            oldPwd: this.forgotForm.oldPassword,
            newPwd: this.forgotForm.newPassword,
          };
          resetPassword(payload)
            .then((res) => {
              const code = res.code || (res.data && res.data.code);
              if (code === 200) {
                this.$message.success("密码修改成功!");
                this.switchView("login");
              } else {
                this.$message.error(
                  res.message || "修改失败，请检查旧密码是否正确"
                );
              }
            })
            .finally(() => {
              this.loading = false;
            });
        }
      });
    },
    // 3. 退出登录逻辑修改
    handleUserCommand(command) {
      if (command === "logout") {
        logout()
          .then(() => {
            this.isLogin = false;

            // --- 新增：清除本地存储 ---
            this.clearLocalUserData();
            // -----------------------
            this.$message.success("已退出登录");
            if (this.$route.path !== "/" && this.$route.path !== "/index") {
              this.$router.push("/index");
            }
          })
          .catch(() => {
            // 即便接口报错，前端也强制清理状态
            this.isLogin = false;
            this.clearLocalUserData();
            this.$message.success("已退出登录");
            if (this.$route.path !== "/" && this.$route.path !== "/index") {
              this.$router.push("/index");
            }
          });
      }
      // ... 其他 command 处理保持不变
      else if (command === "upload") {
        this.$router.push({ name: "CreatorCenter" });
      } else if (["profile", "history", "likes"].includes(command)) {
        this.$router.push({ name: "UserCenter", query: { tab: command } });
      }
    },
  },
  watch: {
    $route(to, from) {
      if (from.name === "VideoDetail" && to.name === "VideoPortalIndex") {
        this.fetchVideos();
        this.fetchHotVideos();
        this.fetchRankVideos();
      }
    },
  },
};
</script>

<style scoped>
/* 找到对应的样式位置添加或覆盖 */
.nav-center {
  flex: 1;
  display: flex;
  justify-content: center;
  margin: 0 20px;
}
.nav-center .search-bar {
  display: flex;
  align-items: center; /* 新增：垂直居中 */
  background: #f1f2f3; /* 稍微深一点的颜色，更清晰 */
  border: 1px solid #e3e5e7;
  border-radius: 8px;
  padding: 0 12px;
  width: 100%;
  max-width: 400px; /* 限制最大宽度 */
  height: 36px;
  transition: background 0.3s;
}
.search-bar:hover {
  background: #fff;
  border-color: var(--primary-color);
}
.search-bar input {
  border: none;
  background: transparent;
  outline: none;
  width: 100%;
  font-size: 14px;
  color: var(--text-main);
}
.search-icon {
  cursor: pointer;
  color: #61666d;
  font-size: 18px;
  margin-left: 8px;
}
.search-icon:hover {
  color: var(--primary-color);
}
.nav-categories {
  display: flex;
  align-items: center;
  gap: 16px;
  font-size: 14px;
}
.more-dropdown {
  display: flex;
  align-items: center;
}
.cat-item.active-cat {
  color: var(--primary-color);
  font-weight: bold;
  border-bottom: 2px solid var(--primary-color);
}
.category-header {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 15px;
  border-left: 5px solid var(--primary-color);
}
.category-header h2 {
  margin: 0 0 10px 0;
  color: var(--text-main);
}
.category-header p {
  color: var(--text-muted);
  font-size: 14px;
}
.cat-item {
  padding: 5px 0;
  cursor: pointer;
  transition: all 0.3s;
  border-bottom: 2px solid transparent;
}
.portal-container {
  --primary-color: #fb7299;
  --bg-color: #f4f5f7;
  --text-main: #222;
  --text-muted: #999;
  --card-bg: #fff;
  background-color: var(--bg-color);
  color: var(--text-main);
  min-height: 100vh;
}
.navbar {
  background-color: var(--card-bg);
  height: 64px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 24px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.08);
  position: sticky;
  top: 0;
  z-index: 100;
}
.nav-left {
  display: flex;
  align-items: center;
  gap: 24px;
}
.nav-left .logo {
  font-size: 24px;
  font-weight: bold;
  color: var(--primary-color);
  text-decoration: none;
  cursor: pointer;
}
.cat-item:hover {
  color: var(--primary-color);
}
.nav-center .search-bar {
  display: flex;
  background: #e3e5e7;
  border-radius: 6px;
  padding: 6px 16px;
  width: 400px;
}
.search-bar input {
  border: none;
  background: transparent;
  outline: none;
  width: 100%;
  font-size: 14px;
}
.nav-right {
  display: flex;
  align-items: center;
  gap: 16px;
}
.nav-right button {
  background-color: var(--primary-color);
  color: white;
  border: none;
  padding: 8px 24px;
  border-radius: 6px;
  font-weight: bold;
  cursor: pointer;
  transition: background 0.3s;
}
.nav-right button:hover {
  background-color: #ff85a8;
}
.login-btn {
  background-color: #00a1d6 !important;
}
.login-btn:hover {
  background-color: #00b5e5 !important;
}
.avatar-dropdown {
  cursor: pointer;
  display: flex;
  align-items: center;
}
.user-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
  border: 1px solid #ddd;
  transition: transform 0.3s;
}
.user-avatar:hover {
  transform: scale(1.1);
}
.container {
  max-width: 1200px;
  margin: 20px auto;
  padding: 0 16px 40px;
  display: grid;
  grid-template-columns: 1fr 300px;
  gap: 20px;
}
.main-content {
  display: flex;
  flex-direction: column;
  gap: 20px;
}
.video-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 16px;
}
.video-card {
  background: var(--card-bg);
  border-radius: 8px;
  overflow: hidden;
  transition: transform 0.2s, box-shadow 0.2s;
  cursor: pointer;
}
.video-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
.video-cover {
  width: 100%;
  height: 120px;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  background-color: #e3e5e7;
  position: relative;
}
.video-info {
  padding: 10px;
}
.video-title {
  font-size: 14px;
  font-weight: 500;
  line-height: 1.4;
  height: 38px;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  margin-bottom: 8px;
}
.video-meta {
  font-size: 12px;
  color: var(--text-muted);
  display: flex;
  justify-content: space-between;
}
.sidebar {
  background-color: var(--card-bg);
  border-radius: 8px;
  padding: 16px;
  height: fit-content;
}
.sidebar h3 {
  font-size: 18px;
  margin-bottom: 16px;
}
.rank-item {
  display: flex;
  align-items: center;
  margin-bottom: 12px;
  font-size: 14px;
  cursor: pointer;
}
.rank-num {
  font-weight: bold;
  font-size: 16px;
  width: 24px;
  color: var(--text-muted);
}
.rank-item:nth-child(1) .rank-num {
  color: #f25d8e;
}
.rank-item:nth-child(2) .rank-num {
  color: #ff8a27;
}
.rank-item:nth-child(3) .rank-num {
  color: #f6a623;
}
.rank-title {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  width: 100%;
}
.floating-tools {
  position: fixed;
  right: 30px;
  bottom: 50px;
  display: flex;
  flex-direction: column;
  gap: 16px;
  z-index: 99;
}
.tool-btn {
  width: 48px;
  height: 48px;
  background-color: var(--card-bg);
  border-radius: 50%;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  cursor: pointer;
  transition: all 0.3s;
  border: 1px solid #e3e5e7;
}
.tool-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
}

::v-deep .beautiful-auth-dialog {
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}
::v-deep .beautiful-auth-dialog .el-dialog__header {
  display: none;
}
::v-deep .beautiful-auth-dialog .el-dialog__body {
  padding: 0;
}
.auth-header {
  background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 99%, #fecfef 100%);
  padding: 40px 20px 25px;
  text-align: center;
  position: relative;
}
.auth-logo {
  font-size: 28px;
  font-weight: bold;
  color: #fff;
  margin-bottom: 6px;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
.auth-title {
  font-size: 15px;
  color: rgba(255, 255, 255, 0.9);
  font-weight: 500;
  letter-spacing: 1px;
}
.close-icon {
  position: absolute;
  top: 15px;
  right: 15px;
  font-size: 20px;
  color: #fff;
  cursor: pointer;
  transition: transform 0.3s;
}
.close-icon:hover {
  transform: rotate(90deg);
}
.auth-body {
  position: relative;
  background: #fff;
  min-height: 250px;
  overflow: hidden;
}
.auth-form-wrapper {
  padding: 30px 40px 40px;
}
::v-deep .auth-form-wrapper .el-input__inner {
  height: 44px;
  border-radius: 6px;
  background-color: #f4f5f7;
  border: 1px solid transparent;
}
::v-deep .auth-form-wrapper .el-input__inner:focus {
  border-color: #fb7299;
  background-color: #fff;
}
::v-deep .auth-form-wrapper .el-input__prefix {
  font-size: 18px;
  left: 10px;
  color: #999;
}
.auth-options {
  display: flex;
  justify-content: space-between;
  margin-top: 15px;
  margin-bottom: 25px;
  font-size: 13px;
}
::v-deep .auth-options .el-link--primary,
::v-deep .back-login .el-link--primary {
  color: #fb7299;
}
::v-deep .auth-options .el-link--primary:hover,
::v-deep .back-login .el-link--primary:hover {
  color: #ff85a8;
}
.submit-item {
  margin-bottom: 0;
}
.submit-btn {
  width: 100%;
  height: 44px;
  font-size: 16px;
  font-weight: bold;
  letter-spacing: 2px;
  border-radius: 6px;
}
.login-btn-color {
  background-color: #00a1d6;
  border-color: #00a1d6;
}
.login-btn-color:hover {
  background-color: #00b5e5;
  border-color: #00b5e5;
}
.submit-btn:not(.login-btn-color) {
  background-color: #fb7299;
  border-color: #fb7299;
}
.submit-btn:not(.login-btn-color):hover {
  background-color: #ff85a8;
  border-color: #ff85a8;
}
.register-actions .back-login {
  text-align: center;
  margin-top: 15px;
  font-size: 13px;
  color: #666;
}
.slide-fade-enter-active,
.slide-fade-leave-active {
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
}
.slide-fade-enter {
  opacity: 0;
  transform: translateX(30px);
}
.slide-fade-leave-to {
  opacity: 0;
  transform: translateX(-30px);
}

.hot-videos-carousel-wrapper {
  background-color: var(--card-bg);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  margin-bottom: 20px;
}
.carousel-item-content {
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  position: relative;
  display: flex;
  align-items: flex-end;
  padding: 20px;
  box-sizing: border-box;
  transition: transform 0.5s ease;
  cursor: pointer;
}
.carousel-item-content:hover {
  transform: scale(1.02);
}
.carousel-text-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 20px;
  background: linear-gradient(
    to top,
    rgba(0, 0, 0, 0.75) 0%,
    rgba(0, 0, 0, 0) 100%
  );
  color: white;
  z-index: 1;
}
.carousel-title {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 8px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.carousel-meta {
  font-size: 14px;
  opacity: 0.9;
  display: flex;
  justify-content: space-between;
}
::v-deep .el-carousel__container {
  border-radius: 8px;
}
::v-deep .el-carousel__indicator button {
  background-color: rgba(255, 255, 255, 0.6);
  opacity: 1;
}
::v-deep .el-carousel__indicator.is-active button {
  background-color: var(--primary-color);
}
::v-deep .el-carousel__arrow {
  background-color: rgba(0, 0, 0, 0.4);
  color: white;
  font-size: 20px;
  border-radius: 50%;
}
::v-deep .el-carousel__arrow:hover {
  background-color: rgba(0, 0, 0, 0.6);
}
</style>