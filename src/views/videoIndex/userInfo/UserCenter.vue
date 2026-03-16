<template>
  <div class="user-center-container">
    <div class="uc-wrapper">
      <!-- 左侧侧边栏导航 -->
      <aside class="uc-sidebar">
        <div class="uc-user-info">
          <img
            :src="
              userInfo.avatar ||
              'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
            "
            class="uc-avatar"
          />
          <div class="uc-name">
            {{ userInfo.nickname || userInfo.username || "神秘用户" }}
          </div>
        </div>
        <ul class="uc-menu">
          <li
            :class="{ active: activeTab === 'profile' }"
            @click="switchTab('profile')"
          >
            <i class="el-icon-user"></i> 个人介绍
          </li>
          <li
            :class="{ active: activeTab === 'history' }"
            @click="switchTab('history')"
          >
            <i class="el-icon-time"></i> 观看记录
          </li>
          <li
            :class="{ active: activeTab === 'likes' }"
            @click="switchTab('likes')"
          >
            <i class="el-icon-star-off"></i> 点赞列表
          </li>
        </ul>
      </aside>

      <!-- 右侧主体内容 -->
      <main class="uc-content">
        <transition name="fade-slide" mode="out-in">
          <!-- 1. 个人介绍 & 修改密码面板 -->
          <div v-if="activeTab === 'profile'" key="profile" class="uc-panel">
            <h2 class="panel-title">个人介绍</h2>
            <div class="profile-card">
              <!-- 基本信息修改 -->
              <el-form label-width="80px" class="profile-form">
                <el-form-item label="用户名">
                  <el-input v-model="userInfo.username" disabled></el-input>
                </el-form-item>
                <el-form-item label="昵称">
                  <el-input v-model="userInfo.nickname"></el-input>
                </el-form-item>
                <el-form-item label="个性签名">
                  <el-input
                    type="textarea"
                    :rows="3"
                    v-model="userInfo.sign"
                    placeholder="写点什么介绍一下自己吧..."
                  ></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button
                    type="primary"
                    class="save-btn"
                    :loading="updatingUser"
                    @click="handleUpdateUser"
                    >保存修改</el-button
                  >
                </el-form-item>
              </el-form>

              <el-divider content-position="left">修改密码</el-divider>

              <!-- 密码修改 -->
              <el-form
                label-width="80px"
                class="profile-form"
                :model="pwdForm"
                :rules="pwdRules"
                ref="pwdFormRef"
              >
                <el-form-item label="旧密码" prop="oldPwd">
                  <el-input
                    v-model="pwdForm.oldPwd"
                    type="password"
                    show-password
                    placeholder="请输入旧密码"
                  ></el-input>
                </el-form-item>
                <el-form-item label="新密码" prop="newPwd">
                  <el-input
                    v-model="pwdForm.newPwd"
                    type="password"
                    show-password
                    placeholder="请输入新密码"
                  ></el-input>
                </el-form-item>
                <el-form-item label="确认密码" prop="confirmPwd">
                  <el-input
                    v-model="pwdForm.confirmPwd"
                    type="password"
                    show-password
                    placeholder="请再次输入新密码"
                  ></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button
                    type="warning"
                    class="save-btn"
                    :loading="updatingPwd"
                    @click="handleResetPwd"
                    >修改密码</el-button
                  >
                </el-form-item>
              </el-form>
            </div>
          </div>

          <!-- 2. 观看记录面板 -->
          <div v-if="activeTab === 'history'" key="history" class="uc-panel">
            <h2 class="panel-title">观看记录</h2>
            <div class="video-grid" v-if="historyList.length > 0">
              <div
                class="video-card clickable"
                v-for="video in historyList"
                :key="video.id"
                @click="goToVideoDetail(video)"
              >
                <div
                  class="video-cover"
                  :style="{ backgroundImage: 'url(' + video.cover + ')' }"
                ></div>
                <div class="video-info">
                  <div class="video-title">{{ video.title }}</div>
                  <div class="video-meta">
                    <span> {{ video.time }}</span>
                  </div>
                </div>
              </div>
            </div>
            <div v-else class="empty-state">暂无观看记录</div>
          </div>

          <!-- 3. 点赞列表面板 -->
          <div v-if="activeTab === 'likes'" key="likes" class="uc-panel">
            <h2 class="panel-title">点赞列表</h2>
            <div class="video-grid" v-if="likesList.length > 0">
              <div
                class="video-card clickable"
                v-for="video in likesList"
                :key="video.id"
                @click="goToVideoDetail(video)"
              >
                <div
                  class="video-cover"
                  :style="{ backgroundImage: 'url(' + video.cover + ')' }"
                ></div>
                <div class="video-info">
                  <div class="video-title">{{ video.title }}</div>
                  <div class="video-meta">
                    <span>点赞于: {{ video.time }}</span>
                  </div>
                </div>
              </div>
            </div>
            <div v-else class="empty-state">暂无点赞的视频</div>
          </div>
        </transition>
      </main>
    </div>
  </div>
</template>

<script>
// 请根据你的实际路径调整 import 路径！
import { resetPassword, getLessInfo } from "@/api/user"; // 假设修改密码接口在这个路径
import userApi from "@/api/user/user";

export default {
  name: "UserCenter",
  data() {
    // 校验两次密码是否一致
    const validateConfirmPwd = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.pwdForm.newPwd) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };

    return {
      activeTab: "profile",
      userInfo: {
        id: null,
        username: "",
        nickname: "",
        avatar: "",
        sign: "",
      },
      updatingUser: false, // 按钮加载状态

      // 修改密码相关
      pwdForm: {
        oldPwd: "",
        newPwd: "",
        confirmPwd: "",
      },
      updatingPwd: false, // 修改密码加载状态
      pwdRules: {
        oldPwd: [
          { required: true, message: "旧密码不能为空", trigger: "blur" },
        ],
        newPwd: [
          { required: true, message: "新密码不能为空", trigger: "blur" },
          { min: 6, message: "密码长度不能少于6位", trigger: "blur" },
        ],
        confirmPwd: [
          { required: true, validator: validateConfirmPwd, trigger: "blur" },
        ],
      },

      historyList: [],
      likesList: [],
    };
  },
  created() {
    if (this.$route.query.tab) {
      this.activeTab = this.$route.query.tab;
    }
    this.fetchUserInfo();
    this.fetchWatchLog();
    this.fetchLikeLog();
  },
  watch: {
    "$route.query.tab"(newVal) {
      if (newVal) {
        this.activeTab = newVal;
      }
    },
  },
  methods: {
    switchTab(tab) {
      this.activeTab = tab;
      this.$router.replace({ query: { tab: tab } }).catch((err) => err);
    },

    // 1. 获取用户信息
    async fetchUserInfo() {
      try {
        const token = this.$store.getters.token;
        const res = await getLessInfo(token);

        if (res.code === 200 && res.data) {
          const data = res.data;
          this.userInfo = {
            id: data.id,
            username: data.username,
            nickname: data.name,
            avatar: data.avatar,
            sign: data.description || "",
          };
        }
      } catch (error) {
        console.error("获取个人信息失败", error);
      }
    },

    // 【新增】2. 修改用户信息
    async handleUpdateUser() {
      this.updatingUser = true;
      try {
        // 构造传给后端的参数，将前端的字段名还原为后端需要的字段名
        const payload = {
          id: this.userInfo.id, // 确保有用户ID，后端通常需要这个来识别要更新哪个用户
          username: this.userInfo.username,
          name: this.userInfo.nickname, // 对应后端的 name
          description: this.userInfo.sign, // 对应后端的 description
          avatar: this.userInfo.avatar,
        };

        const res = await userApi.updateUser(payload);
        if (res.code === 200) {
          this.$message.success("个人信息保存成功！");
          // 若有需要，可以同步更新 vuex 中的用户信息
          // this.$store.dispatch('user/getInfo')
        }
      } catch (error) {
        console.error("保存个人信息失败", error);
      } finally {
        this.updatingUser = false;
      }
    },

    // 【新增】3. 修改密码
    handleResetPwd() {
      this.$refs.pwdFormRef.validate(async (valid) => {
        if (valid) {
          this.updatingPwd = true;
          try {
            const payload = {
              username: this.userInfo.username, // 从页面拿的用户名
              oldPwd: this.pwdForm.oldPwd,
              newPwd: this.pwdForm.newPwd,
            };

            const res = await resetPassword(payload);
            if (res.code === 200) {
              this.$message.success("密码修改成功!");
              this.$refs.pwdFormRef.resetFields(); // 清空表单

              // 修改密码后通常需要退出登录
              // setTimeout(() => {
              //   this.$store.dispatch('user/logout').then(() => {
              //     this.$router.push('/login');
              //   });
              // }, 1500);
            }
          } catch (error) {
            console.error("密码修改异常", error);
          } finally {
            this.updatingPwd = false;
          }
        } else {
          return false;
        }
      });
    },

    // 【新增】4. 跳转到视频详情页
    goToVideoDetail(video) {
      // 兼容判断：日志接口可能返回的是 videoId 或者是 id
      const targetId = video.videoId || video.id;

      if (!targetId) {
        this.$message.warning("视频ID获取失败，无法跳转");
        return;
      }

      this.$router.push({
        name: "VideoDetail", // 对应你路由配置中的 name: 'VideoDetail'
        params: { id: targetId },
      });
    },

    async fetchWatchLog() {
      try {
        const res = await userApi.userWatchLog();
        let dataList = res.data || res;
        if (Array.isArray(dataList)) {
          this.historyList = dataList;
        } else if (res.code === 200 && Array.isArray(res.data)) {
          this.historyList = res.data;
        }
      } catch (error) {
        console.error("获取观看记录失败", error);
      }
    },

    async fetchLikeLog() {
      try {
        const res = await userApi.userLikeLog();
        let dataList = res.data || res;
        if (Array.isArray(dataList)) {
          this.likesList = dataList;
        } else if (res.code === 200 && Array.isArray(res.data)) {
          this.likesList = res.data;
        }
      } catch (error) {
        console.error("获取点赞列表失败", error);
      }
    },
  },
};
</script>

<style scoped>
.video-card.clickable {
  cursor: pointer;
  transition: all 0.3s;
}

.video-card.clickable:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}
/* 继承主页的色彩变量 */
.user-center-container {
  --primary-color: #fb7299;
  --bg-color: #f4f5f7;
  --text-main: #222;
  --text-muted: #999;
  --card-bg: #fff;

  background-color: var(--bg-color);
  min-height: calc(100vh - 64px); /* 减去头部导航栏的高度 */
  padding: 24px 0;
}

.uc-wrapper {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  gap: 20px;
  padding: 0 16px;
}

/* 左侧导航栏 */
.uc-sidebar {
  width: 240px;
  background: var(--card-bg);
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  padding: 20px 0;
  height: fit-content;
}

.uc-user-info {
  text-align: center;
  padding-bottom: 20px;
  border-bottom: 1px solid #f0f0f0;
  margin-bottom: 10px;
}

.uc-avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  border: 2px solid #fff;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  margin-bottom: 10px;
}

.uc-name {
  font-size: 16px;
  font-weight: bold;
  color: var(--text-main);
}

.uc-menu {
  list-style: none;
  padding: 0;
  margin: 0;
}

.uc-menu li {
  padding: 15px 30px;
  font-size: 15px;
  color: #666;
  cursor: pointer;
  transition: all 0.3s;
  display: flex;
  align-items: center;
  gap: 10px;
}

.uc-menu li:hover {
  background-color: #fafafa;
  color: var(--primary-color);
}

.uc-menu li.active {
  background-color: #fff1f4;
  color: var(--primary-color);
  border-right: 4px solid var(--primary-color);
  font-weight: bold;
}

/* 右侧内容区 */
.uc-content {
  flex: 1;
  background: var(--card-bg);
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  padding: 30px;
  min-height: 500px;
}

.panel-title {
  font-size: 20px;
  color: var(--text-main);
  margin: 0 0 20px 0;
  padding-bottom: 15px;
  border-bottom: 1px solid #f0f0f0;
}

/* 个人介绍表单 */
.profile-card {
  max-width: 500px;
}
.save-btn {
  background-color: var(--primary-color);
  border-color: var(--primary-color);
}
.save-btn:hover {
  background-color: #ff85a8;
  border-color: #ff85a8;
}

/* 视频列表网格 (复用主页设计) */
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
  border: 1px solid #f0f0f0;
}

.video-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.video-cover {
  width: 100%;
  height: 120px;
  background-size: cover;
  background-position: center;
  background-color: #e3e5e7;
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
}

.empty-state {
  text-align: center;
  color: #999;
  padding: 50px 0;
}

/* 切换动画 */
.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: all 0.3s ease;
}
.fade-slide-enter {
  opacity: 0;
  transform: translateY(10px);
}
.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
</style>