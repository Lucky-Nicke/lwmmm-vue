<template>
  <div class="portal-container">
    <!-- 顶部导航栏 (门户页的导航栏，将始终显示) -->
    <nav class="navbar">
      <div class="nav-left">
        <!-- 点击 Logo 返回门户主页 -->
        <a href="#" class="logo" @click="goHome">MyBili 📺</a>
        <div class="nav-categories">
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
      <div class="nav-center">
        <div class="search-bar">
          <input type="text" placeholder="搜索你感兴趣的视频、作者..." />
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
              <el-dropdown-item command="profile">个人介绍</el-dropdown-item>
              <el-dropdown-item command="history">观看记录</el-dropdown-item>
              <el-dropdown-item command="likes">点赞列表</el-dropdown-item>
              <el-dropdown-item divided command="logout"
                >退出登录</el-dropdown-item
              >
            </el-dropdown-menu>
          </el-dropdown>
        </template>
        <button class="post-btn">投稿</button>
      </div>
    </nav>
    <!-- 主体内容区容器，包含门户主页或视频详情页 -->
    <!-- 根据路由名称条件渲染，如果是视频详情页，则渲染 router-view -->
    <router-view v-if="$route.name === 'VideoDetail'"></router-view>
    <!-- 否则，渲染门户主页内容 -->
    <template v-else>
      <div class="container">
        <main class="main-content">
          <div class="category-header" v-if="activeCategory !== '首页'">
            <h2>当前分类：{{ activeCategory }}</h2>
            <p>这里是 {{ activeCategory }} 分类的视频列表</p>
            <p
              v-if="displayedVideoList.length === 0 && !videoLoading"
              style="color: #666; margin-top: 10px"
            ></p>
          </div>
          <div
            class="hot-videos-carousel-wrapper"
            v-if="activeCategory === '首页'"
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
        <div class="tool-btn ai-btn" title="AI 聊天助手" @click="openAI">
          🤖
        </div>
        <div class="tool-btn top-btn" title="返回顶部" @click="scrollToTop">
          ⬆️
        </div>
      </div>
    </template>
    <!-- /template v-else -->
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
        <div class="auth-logo">MyBili 📺</div>
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
                  >登 录</el-button
                >
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
import { setToken, removeToken } from "@/utils/auth";
import movieApi from "@/api/movie/movie";

// 导入 registerUser 接口
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
      if (!this.hasOverflowCategories) {
        return [];
      }
      const otherCategories = this.categories.filter(
        (cat) => cat.name !== "首页"
      );
      return otherCategories.slice(this.initialCategoryDisplayLimit - 1);
    },
  },
  methods: {
    // 视频详情页跳转方法
    goToVideoDetail(videoId) {
      if (videoId) {
        // 使用命名路由跳转到当前路由的子路由VideoDetail
        this.$router.push({ name: "VideoDetail", params: { id: videoId } });
      } else {
        this.$message.warning("视频ID缺失，无法跳转！");
      }
    },
    goHome() {
      // 如果当前不是门户首页，则导航到门户首页
      if (this.$route.name !== "VideoPortalIndex") {
        // 使用路由名称判断
        this.$router.push({ name: "VideoPortalIndex" });
      } else {
        // 如果已经在门户首页，可以滚动到顶部
        window.scrollTo({ top: 0, behavior: "smooth" });
      }
    },
    scrollToTop() {
      window.scrollTo({ top: 0, behavior: "smooth" });
    },
    openAI() {
      this.$message.success("AI 助手模块预留点击事件");
    },
    // 获取排行榜视频的方法
    fetchRankVideos() {
      this.rankLoading = true;
      movieApi
        .getHotWatchVideoInfo()
        .then((res) => {
          if (res.code === 200 && res.data) {
            // 将数据直接赋值给 rankList，包含 id, title, author, views, coverUrl, category
            this.rankList = res.data;
          } else {
            this.$message.error(res.message || "获取排行榜失败！");
            this.rankList = []; // 获取失败时清空列表
          }
        })
        .catch((error) => {
          this.$message.error("加载排行榜失败，请稍后重试！");
          console.error("Error fetching rank videos:", error);
          this.rankList = []; // 发生错误时清空列表
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
              category: item.category, // 如果需要，也可以包含分类信息
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
    // 【修复点】这里删除了下面重复定义的 filterVideos 方法，保留这一个即可
    filterVideos() {
      if (this.activeCategory === "首页") {
        this.displayedVideoList = [...this.videoList];
      } else {
        this.displayedVideoList = this.videoList.filter(
          (video) => video.category === this.activeCategory
        );
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
      // 确保在从详情页返回主页时，也能点击分类
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
                this.$message.success("登录成功！");
                this.isLogin = true;
                this.authVisible = false;
              } else {
                this.$message.warning(
                  "登录成功但获取用户信息失败，请手动刷新！"
                );
                this.isLogin = true;
                removeToken();
                this.userInfo.avatar = "";
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
              this.$message.error("注册请求异常，请稍后重试！");
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
                this.$message.success("密码修改成功，请重新登录！");
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

    handleUserCommand(command) {
      if (command === "logout") {
        logout()
          .then(() => {
            this.isLogin = false;
            removeToken();
            this.userInfo.avatar = "";
            this.$message.success("已退出登录");
          })
          .catch(() => {
            this.isLogin = false;
            removeToken();
            this.userInfo.avatar = "";
            this.$message.success("已退出登录");
          });
      } else {
        this.$message.info(`预留页面：点击了 [${command}]`);
      }
    },

    scrollToTop() {
      window.scrollTo({ top: 0, behavior: "smooth" });
    },
    openAI() {
      this.$message.success("AI 助手模块预留点击事件");
    },
  },
  watch: {
    $route(to, from) {
      // 如果是从 VideoDetail 路由返回到 VideoPortalIndex 路由
      if (from.name === "VideoDetail" && to.name === "VideoPortalIndex") {
        // 可以在这里重新加载主页列表数据，如果需要刷新最新状态
        this.fetchVideos();
        this.fetchHotVideos();
        this.fetchRankVideos();
      }
    },
  },
};
</script>

<style scoped>
.nav-categories {
  display: flex;
  align-items: center; /* 【修复点】增加居中对齐，修复"更多"与前排错位的问题 */
  gap: 16px;
  font-size: 14px;
}
/* 【修复点】让 el-dropdown 组件参与到弹性居中对齐中 */
.more-dropdown {
  display: flex;
  align-items: center;
}
.cat-item.active-cat {
  color: var(--primary-color);
  font-weight: bold;
  border-bottom: 2px solid var(--primary-color);
}
/* 分类页面头部预留样式 */
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
/* ====== 基础布局与主页样式保持不变 ====== */
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
  /* 现在这个 container 只会在门户主页时显示 */
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
.banner {
  background-color: var(--card-bg);
  border-radius: 8px;
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  background-image: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
  color: white;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
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
/* ====== 综合鉴权弹窗美化 ====== */
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
/* 新增和调整的样式 */
.carousel-item-content,
.video-card,
.rank-item,
.nav-left .logo {
  cursor: pointer;
}
/* 轮播图样式（已在之前提供，这里不再重复展示） */
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