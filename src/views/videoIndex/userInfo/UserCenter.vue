<template>
  <div class="user-center-container">
    <div class="uc-wrapper">
      <!-- 左侧侧边栏导航 -->
      <aside class="uc-sidebar">
        <div class="uc-user-info">
          <!-- 新增：el-upload 包裹头像 -->
          <el-upload
            class="avatar-uploader"
            action=""
            :http-request="uploadAvatarAction"
            :show-file-list="false"
            :before-upload="beforeAvatarUpload"
          >
            <img
              :src="
                userInfo.avatar ||
                'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
              "
              class="uc-avatar"
              title="点击更换头像"
            />
            <div class="avatar-edit-mask">更换头像</div>
          </el-upload>

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
                    <span>观看于: {{ video.time }}</span>
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
// 1. 引入 request 工具类
import request from "@/utils/request";
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
      uploadHeaders: {
        token: this.$store.getters.token,
      },
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
    // 1. 检查是否存在 token
    const token = this.getCookie("vue_admin_template_token");
    if (!token) {
      // 2. 如果没有 token，提示并跳转回首页
      // alert("请先登录"); // 根据需求决定是否提示
      this.$router.push("/index");
      this.$message.warning("请先登录");
      return; // 阻止后续逻辑执行
    }
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
    // 获取 Cookie 的简单辅助函数
    getCookie(name) {
      const value = `; ${document.cookie}`;
      const parts = value.split(`; ${name}=`);
      if (parts.length === 2) return parts.pop().split(";").shift();
    },
    beforeAvatarUpload(file) {
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isLt2M;
    },
    async uploadAvatarAction(option) {
      this.updatingUser = true; // 复用个人信息的 loading 状态
      let formData = new FormData();
      formData.append("uploadImage", option.file); // 对应后端参数名

      try {
        const res = await request({
          url: "/admin/system/upload/uploadImage",
          method: "post",
          data: formData,
        });
        // 兼容不同的 code 返回（有的项目是 200，有的是 20000）
        if (res.code === 200 || res.code === 20000) {
          this.userInfo.avatar = res.data; // 更新本地头像预览地址

          // 关键：上传后立即调用保存接口，将头像 URL 存入数据库
          await this.handleUpdateUser();

          option.onSuccess();
        } else {
          this.$message.error(res.message || "上传失败");
        }
      } catch (error) {
        console.error("头像上传异常", error);
        this.$message.error("服务器响应异常");
      } finally {
        this.updatingUser = false;
      }
    },
    // 新增：上传成功的回调
    async handleAvatarSuccess(res, file) {
      // 根据你提供的接口 Result 结构，假设返回的 URL 在 res.data 中
      if (res.code === 200) {
        this.userInfo.avatar = res.data; // 更新本地显示的头像地址
        this.$message.success("头像上传成功，正在保存...");
        // 调用你现有的保存接口，将新头像 URL 存入数据库
        await this.handleUpdateUser();
      } else {
        this.$message.error(res.message || "上传失败");
      }
    },
    switchTab(tab) {
      this.activeTab = tab;
      this.$router.replace({ query: { tab: tab } }).catch((err) => err);
    },

    // 1. 获取用户信息
    async fetchUserInfo() {
      try {
        const userId = localStorage.getItem("userId");
        const res = await getLessInfo(userId);
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

    // 2. 修改用户信息
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

    // 3. 修改密码
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

    // 4. 跳转到视频详情页
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
        // 从 localStorage 获取用户ID
        const userId = localStorage.getItem("userId");
        const res = await userApi.userWatchLog(userId);
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
        // 从 localStorage 获取用户ID
        const userId = localStorage.getItem("userId");
        const res = await userApi.userLikeLog(userId);
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
/* 添加到 <style scoped> 中 */
/* 新增头像上传预览容器样式 */
.avatar-uploader {
  position: relative;
  display: inline-block;
  cursor: pointer;
  border-radius: 50%;
}
.avatar-edit-mask {
  position: absolute;
  top: 0;
  left: 0;
  width: 80px;
  height: 80px;
  border-radius: 50%;
  background: rgba(0, 0, 0, 0.5);
  color: #fff;
  font-size: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.3s;
}
.avatar-uploader:hover .avatar-edit-mask {
  opacity: 1;
}
/* 确保头像容器是圆形的，不影响布局 */
.uc-avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  border: 2px solid #fff;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  display: block;
  object-fit: cover;
}
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