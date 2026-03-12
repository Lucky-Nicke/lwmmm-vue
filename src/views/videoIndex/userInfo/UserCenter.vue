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
                    <span>作者: {{ video.author }}</span>
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
// 这里可以引入获取用户详情的API，目前使用假数据占位演示
export default {
  name: "UserCenter",
  data() {
    return {
      activeTab: "profile",
      userInfo: {
        username: "admin123",
        nickname: "影视达人",
        avatar: "",
        sign: "这是一个超级喜欢看电影的人~",
      },
      // 模拟视频数据
      historyList: [
        {
          id: 1,
          title: "Vue3从入门到实战",
          cover:
            "https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png",
          time: "今天 14:00",
        },
        {
          id: 2,
          title: "SpringBoot底层原理剖析",
          cover:
            "https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png",
          time: "昨天 09:30",
        },
      ],
      likesList: [
        {
          id: 3,
          title: "2024最火的科幻大片混剪",
          cover:
            "https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png",
          author: "剪辑大师",
        },
      ],
    };
  },
  created() {
    // 初始化时从路由参数读取要选中的 tab
    if (this.$route.query.tab) {
      this.activeTab = this.$route.query.tab;
    }
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