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
          <!-- 1. 个人介绍面板 -->
          <div v-if="activeTab === 'profile'" key="profile" class="uc-panel">
            <h2 class="panel-title">个人介绍</h2>
            <div class="profile-card">
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
                    @click="$message.success('保存成功！')"
                    >保存修改</el-button
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
                class="video-card"
                v-for="video in historyList"
                :key="video.id"
              >
                <div
                  class="video-cover"
                  :style="{ backgroundImage: 'url(' + video.cover + ')' }"
                ></div>
                <div class="video-info">
                  <div class="video-title">{{ video.title }}</div>
                  <div class="video-meta">
                    <span>看完于 {{ video.time }}</span>
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
                class="video-card"
                v-for="video in likesList"
                :key="video.id"
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
// 直接通过函数名引入个人信息接口
import { getLessInfo } from "@/api/user";
// 通过设置的名字引入用户相关日志接口 (假设导出的对象叫 userApi)
import userApi from "@/api/user/user";

export default {
  name: "UserCenter",
  data() {
    return {
      activeTab: "profile",
      userInfo: {
        username: "",
        nickname: "",
        avatar: "",
        sign: "",
      },
      historyList: [],
      likesList: [],
    };
  },
  created() {
    // 初始化时从路由参数读取要选中的 tab
    if (this.$route.query.tab) {
      this.activeTab = this.$route.query.tab;
    }

    // 初始化加载全部数据
    this.fetchUserInfo();
    this.fetchWatchLog();
    this.fetchLikeLog();
  },
  watch: {
    // 监听路由变化，保证用户在页面内点击顶部下拉菜单也能切换
    "$route.query.tab"(newVal) {
      if (newVal) {
        this.activeTab = newVal;
      }
    },
  },
  methods: {
    switchTab(tab) {
      this.activeTab = tab;
      // 改变 url 参数但不刷新页面
      this.$router.replace({ query: { tab: tab } }).catch((err) => err);
    },

    // 1. 获取用户信息
    async fetchUserInfo() {
      try {
        // vue-admin-template 通常在 store 里存有 token，或者通过 '@/utils/auth' 的 getToken()
        const token = this.$store.getters.token;
        const res = await getLessInfo(token);

        if (res.code === 200 && res.data) {
          const data = res.data;
          this.userInfo = {
            username: data.username,
            nickname: data.name, // 接口的 name 映射为 nickname
            avatar: data.avatar,
            sign: data.desc || '', // 接口的 desc 映射为 sign
          };
        }
      } catch (error) {
        console.error("获取个人信息失败", error);
      }
    },

    // 2. 获取观看记录
    async fetchWatchLog() {
      try {
        const res = await userApi.userWatchLog();
        // 兼容处理：依据 vue-admin-template 的 axios 拦截器可能直接返回了 data 或者原封的 res
        let dataList = res.data || res;

        // 如果后端有外层包装 {code: 200, data: [...]}，取 res.data 即可
        // 这里做个健壮性判断，确保赋值的是数组
        if (Array.isArray(dataList)) {
          this.historyList = dataList;
        } else if (res.code === 200 && Array.isArray(res.data)) {
          this.historyList = res.data;
        }
      } catch (error) {
        console.error("获取观看记录失败", error);
      }
    },

    // 3. 获取点赞列表
    async fetchLikeLog() {
      try {
        const res = await userApi.userLikeLog();
        // 处理逻辑与观看记录一致
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