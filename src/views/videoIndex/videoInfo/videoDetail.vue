<template>
  <div class="video-detail-root" v-loading="loading">
    <div class="layout-container" v-if="video">
      <!-- ================= 左侧：视频播放、信息、评论 ================= -->
      <div class="left-content">
        <!-- 1. 视频播放区域 (接入阿里云 Aliplayer) -->
        <div class="player-wrapper">
          <!-- 弹幕层：加入 v-show 控制开关 -->
          <div
            class="danmaku-layer"
            ref="danmakuLayer"
            :class="{ 'is-hidden': !showDanmaku, 'is-paused': !isPlaying }"
          ></div>
          <!-- 阿里云播放器容器 -->
          <div class="prism-player" id="J_prismPlayer"></div>
        </div>

        <div class="danmaku-send-bar">
          <div class="danmaku-switch">
            <el-switch
              v-model="showDanmaku"
              active-color="#00a1d6"
              inactive-text="弹幕"
            ></el-switch>
          </div>
          <el-input
            v-model="danmakuInput"
            placeholder="发个友善的弹幕见证当下"
            class="danmaku-input-el"
            @keyup.enter.native="sendDanmaku"
            :disabled="!showDanmaku"
          >
            <el-button
              slot="append"
              type="primary"
              class="send-danmaku-btn"
              @click="sendDanmaku"
              :disabled="!showDanmaku"
              >发送</el-button
            >
          </el-input>
        </div>

        <!-- 2. 视频基础信息 -->
        <div class="video-info">
          <h1 class="video-title">{{ video.name }}</h1>
          <div class="video-meta">
            <span class="meta-item"
              ><i class="el-icon-video-play"></i>
              {{ video.playCount || 0 }} 播放</span
            >
            <span class="meta-item"
              ><i class="el-icon-chat-dot-round"></i>
              {{ video.danmakuCount || 0 }} 弹幕</span
            >
            <span class="meta-item"
              ><i class="el-icon-time"></i> {{ video.publishTime }}</span
            >
            <!-- 点击分类返回主页 -->
            <span
              class="meta-item tag"
              @click="goToCategory(video.category)"
              title="点击查看该分类更多视频"
            >
              {{ video.category || "默认分类" }}
            </span>
          </div>
          <div class="video-actions">
            <el-button
              size="medium"
              icon="el-icon-thumb"
              round
              @click="likeVideo"
              >点赞 {{ video ? video.likeCount || 0 : 0 }}</el-button
            >
            <!-- 绑定 shareVideo -->
            <el-button
              size="medium"
              icon="el-icon-share"
              round
              @click="shareVideo"
              >分享</el-button
            >
          </div>
        </div>

        <el-divider></el-divider>

        <!-- 3. 评论区 -->
        <div class="comment-section">
          <div class="comment-header">
            <h3>
              评论 <span class="count">{{ video.commentCount || 0 }}</span>
            </h3>
          </div>

          <!-- 发布评论框 -->
          <div class="comment-publish">
            <!-- 未登录显示默认头像，登录显示用户头像 -->
            <el-avatar
              :src="currentUserAvatar"
              icon="el-icon-user-solid"
              class="my-avatar"
            ></el-avatar>
            <el-input
              type="textarea"
              :rows="2"
              placeholder="发条友善的评论吧"
              v-model="commentInput"
              class="comment-input"
            ></el-input>
            <el-button type="primary" class="publish-btn" @click="sendComment"
              >发布</el-button
            >
          </div>

          <!-- 评论列表 -->
          <div class="comment-list">
            <div
              class="comment-item"
              v-for="rootComment in processedComments"
              :key="rootComment.id"
            >
              <!-- 根评论头像 -->
              <el-avatar
                :src="rootComment.avatar"
                class="comment-avatar"
              ></el-avatar>

              <div class="comment-content-wrap">
                <!-- 根评论内容 -->
                <div class="comment-user">
                  {{ (rootComment.userId || "").replace("用户:", "用户") }}
                </div>
                <div class="comment-text">{{ rootComment.content }}</div>
                <div class="comment-info">
                  <span class="time">{{ rootComment.createTime }}</span>
                  <!-- 绑定点赞和回复事件 -->
                  <span class="action" @click="likeComment(rootComment)"
                    ><i class="el-icon-thumb"></i>
                    {{ rootComment.likeCount || 0 }}</span
                  >
                  <span
                    class="action reply-btn"
                    @click="showReplyBox(rootComment)"
                    >回复</span
                  >
                </div>

                <!-- 根评论的回复框 -->
                <div
                  class="reply-box-container"
                  v-if="activeReplyId === rootComment.id"
                >
                  <el-input
                    type="textarea"
                    autosize
                    v-model="replyContent"
                    :placeholder="'回复 @' + replyTargetName + ' :'"
                  ></el-input>
                  <div class="reply-actions">
                    <el-button size="mini" @click="cancelReply">取消</el-button>
                    <el-button
                      type="primary"
                      size="mini"
                      @click="submitReply(rootComment.id)"
                      >发送</el-button
                    >
                  </div>
                </div>

                <!-- 子评论列表 (支持多层级缩进) -->
                <div
                  class="sub-comment-list"
                  v-if="
                    rootComment.flatChildren &&
                    rootComment.flatChildren.length > 0
                  "
                >
                  <div
                    class="sub-comment-item"
                    v-for="child in rootComment.flatChildren"
                    :key="child.id"
                    :style="{ 'margin-left': child.indent + 'px' }"
                  >
                    <el-avatar
                      :src="child.avatar"
                      size="small"
                      class="sub-avatar"
                    ></el-avatar>
                    <div class="sub-content">
                      <span class="sub-user">{{
                        (child.userId || "").replace("用户:", "用户")
                      }}</span>
                      <span
                        class="reply-target"
                        v-if="
                          child.replyToUser &&
                          child.replyToUser !== rootComment.userId
                        "
                      >
                        回复 @{{ child.replyToUser.replace("用户:", "") }} :
                      </span>
                      <span class="sub-text">{{ child.content }}</span>
                      <div class="sub-info">
                        <span class="time">{{ child.createTime }}</span>
                        <!-- 绑定点赞和回复事件 -->
                        <span class="action" @click="likeComment(child)"
                          ><i class="el-icon-thumb"></i>
                          {{ child.likeCount || 0 }}</span
                        >
                        <span
                          class="action reply-btn"
                          @click="showReplyBox(child, rootComment.id)"
                          >回复</span
                        >
                      </div>

                      <!-- 子评论的回复框 -->
                      <div
                        class="reply-box-container"
                        v-if="activeReplyId === child.id"
                      >
                        <el-input
                          type="textarea"
                          autosize
                          v-model="replyContent"
                          :placeholder="'回复 @' + replyTargetName + ' :'"
                        ></el-input>
                        <div class="reply-actions">
                          <el-button size="mini" @click="cancelReply"
                            >取消</el-button
                          >
                          <el-button
                            type="primary"
                            size="mini"
                            @click="submitReply(rootComment.id, child.id)"
                            >发送</el-button
                          >
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- ================= 右侧：推荐视频 ================= -->
      <div class="right-sidebar">
        <!-- 预留的UP主卡片（极简版） -->
        <div class="up-info-card">
          <el-avatar :src="video.creatorAvatar" :size="45"></el-avatar>
          <div class="up-detail">
            <!-- 后期如果有数据，可以替换为 video.authorName -->
            <div class="up-name">
              {{ video.creator }}
            </div>
          </div>
        </div>

        <div class="recommend-section">
          <h3 class="recommend-title">相关推荐</h3>
          <div class="recommend-list">
            <div
              class="recommend-item"
              v-for="item in hotVideos"
              :key="item.id"
              @click="goToVideoDetail(item.id)"
            >
              <div class="rec-cover">
                <!-- 修改为使用接口新字段 coverUrl -->
                <img :src="item.coverUrl" alt="cover" />
                <!-- <span class="duration">03:24</span> 如果没有时长字段，可以暂时隐掉 -->
              </div>
              <div class="rec-info">
                <!-- 修改为使用接口新字段 title -->
                <div class="rec-title" :title="item.title">
                  {{ item.title }}
                </div>
                <!-- 修改为使用接口新字段 author -->
                <div class="rec-up">{{ item.author || "未知UP主" }}</div>
                <div class="rec-stats">
                  <span
                    ><i class="el-icon-video-play"></i>
                    {{ item.views || 0 }}</span
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 视频加载失败时的空状态 -->
    <el-empty
      v-else-if="!loading"
      description="视频不见了或加载失败"
    ></el-empty>

    <el-backtop target="document.body"></el-backtop>

    <el-dialog
      title="分享视频"
      :visible.sync="shareDialogVisible"
      width="300px"
      center
    >
      <div style="text-align: center">
        <p style="margin-bottom: 15px; color: #666">扫描二维码分享给好友</p>
        <!-- 这里用一个 div 占位，后续可引入 qrcode 库生成真实二维码 -->
        <div
          style="
            width: 150px;
            height: 150px;
            background: #f4f5f7;
            border: 1px solid #ddd;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #999;
          "
        >
          二维码加载中...
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getMovieDetail } from "@/api/date/date.js";
import movieApi from "@/api/movie/movie.js";

export default {
  name: "VideoDetail",
  data() {
    return {
      videoId: null,
      shareDialogVisible: false, // 增加分享弹窗控制
      loading: true,
      video: null,
      processedComments: [],
      hotVideos: [],
      commentInput: "",
      player: null, // 阿里云播放器实例
      isPlaying: false, // 当前是否正在播放
      sortedDanmakuList: [], // 按时间排序后的弹幕列表
      danmakuIndex: 0, // 当前播放到的弹幕索引
      // 弹幕控制
      showDanmaku: true,
      danmakuInput: "",

      // 评论回复控制
      activeReplyId: null, // 当前正在回复的评论ID
      replyTargetName: "", // 正在回复的用户名字
      replyContent: "", // 回复框的内容
    };
  },
  computed: {
    // 动态获取当前登录用户的头像
    currentUserAvatar() {
      // 假设你的登录信息存在 localStorage 中，你可以根据实际情况修改从 Vuex 获取
      const userInfoStr = localStorage.getItem("userInfo");
      if (userInfoStr) {
        try {
          const userInfo = JSON.parse(userInfoStr);
          if (userInfo && userInfo.avatar) {
            return userInfo.avatar;
          }
        } catch (e) {}
      }
      // 如果未登录或没有头像，返回默认的灰色占位图
      return "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png";
    },
  },
  created() {
    this.videoId = this.$route.params.id;
    this.initData();
  },
  beforeDestroy() {
    // 离开页面时销毁播放器，防止内存泄漏
    if (this.player) {
      if (this.playerClickHandler) {
        const playerContainer = document.getElementById("J_prismPlayer");
        if (playerContainer) {
          playerContainer.removeEventListener("click", this.playerClickHandler);
        }
        this.playerClickHandler = null;
      }

      this.player.dispose();
      this.player = null;
    }
  },
  watch: {
    "$route.params.id"(newId) {
      if (newId && newId !== this.videoId) {
        this.videoId = newId;
        this.initData();
        window.scrollTo(0, 0);
      }
    },
  },
  methods: {
    // 发送弹幕
    sendDanmaku() {
      if (!this.danmakuInput.trim()) return;
      if (!this.player) {
        this.$message.warning("视频未加载，无法发送弹幕");
        return;
      }

      const currentTime = this.player.getCurrentTime();
      const newDanmaku = {
        content: this.danmakuInput,
        playTime: currentTime,
        color: "#00a1d6", // 自己发的弹幕默认给个专属色
      };

      // 1. 立即在屏幕上发射出来
      this.shootDanmaku(newDanmaku);
      // 2. 存入弹幕列表以便拖动进度条时还能看到
      this.sortedDanmakuList.push(newDanmaku);
      this.sortedDanmakuList.sort((a, b) => a.playTime - b.playTime);

      // TODO: 在这里调用后端接口把弹幕存入数据库
      // movieApi.addDanmaku({ videoId: this.videoId, ...newDanmaku }).then(...)

      this.$message.success("弹幕发送成功");
      this.danmakuInput = "";
    },

    // 点赞视频预留接口
    likeVideo() {
      if (!this.video) return;
      this.video.likeCount = (this.video.likeCount || 0) + 1;
      this.$message.success("视频点赞成功 (演示)");
    },

    // 视频分享 (调出二维码弹窗)
    shareVideo() {
      this.shareDialogVisible = true;
      this.$message.success("扫码分享给好友吧！");
    },

    // ================== 评论区操作 ==================
    // 发表根评论
    sendComment() {
      if (!this.commentInput.trim()) {
        this.$message.warning("评论内容不能为空");
        return;
      }
      // TODO: 调用后端发表根评论接口
      console.log("模拟发送根评论:", this.commentInput);
      this.$message.success("评论发表成功 (测试版)");
      this.commentInput = "";
    },

    // 点赞某条评论
    likeComment(comment) {
      // TODO: 调用后端评论点赞接口
      comment.likeCount = (comment.likeCount || 0) + 1;
      this.$message.success("评论点赞成功");
    },

    // 展开回复框
    showReplyBox(comment, parentRootId = null) {
      if (this.activeReplyId === comment.id) {
        this.cancelReply();
        return;
      }
      this.activeReplyId = comment.id;
      this.replyTargetName = (comment.userId || "").replace("用户:", "用户");
      this.replyContent = "";
    },

    // 取消回复
    cancelReply() {
      this.activeReplyId = null;
      this.replyTargetName = "";
      this.replyContent = "";
      this.$message.info("已取消回复"); // 增加取消提示
    },
    // 5. 提交回复 (楼中楼)
    submitReply(rootId, targetCommentId = null) {
      if (!this.replyContent.trim()) {
        this.$message.warning("回复内容不能为空");
        return;
      }
      // TODO: 调用后端回复接口
      console.log("准备发送回复:", {
        rootId,
        targetCommentId,
        content: this.replyContent,
      });
      this.$message.success("回复成功 (测试版)");
    },
    initData() {
      this.loading = true;

      Promise.all([getMovieDetail(this.videoId), movieApi.getHotVideoInfo()])
        .then(([detailRes, hotRes]) => {
          const vData = detailRes.data ? detailRes.data : detailRes;
          const hData = hotRes.data ? hotRes.data : hotRes;

          if (
            (detailRes.code === 200 && detailRes.data) ||
            vData.videoId ||
            vData.name
          ) {
            this.video = vData;

            // 新增：初始化弹幕并按 playTime (秒) 从小到大排序
            if (this.video.danmakuList && this.video.danmakuList.length > 0) {
              this.sortedDanmakuList = [...this.video.danmakuList].sort(
                (a, b) => a.playTime - b.playTime
              );
            } else {
              this.sortedDanmakuList = [];
            }
            this.danmakuIndex = 0;

            this.processedComments = this.formatComments(
              this.video.commentList || []
            );
            this.$nextTick(() => {
              this.initAliPlayer();
            });
          } else {
            this.$message.error("获取视频详情失败");
          }

          if ((hotRes.code === 200 && hotRes.data) || Array.isArray(hData)) {
            this.hotVideos = hData;
          }

          this.loading = false;
        })
        .catch((err) => {
          console.error("加载异常:", err);
          this.$message.error("加载异常");
          this.loading = false;
        });
    },

    // 阿里云播放器初始化
    initAliPlayer() {
      if (this.player) {
        this.player.dispose();
        this.player = null;
      }
      if (!window.Aliplayer) return;

      const playInfo = this.video.playId || {};

      this.player = new window.Aliplayer(
        {
          id: "J_prismPlayer",
          vid: playInfo.playId,
          playauth: playInfo.playAuth,
          cover: playInfo.image || this.video.image,
          width: "100%",
          height: "100%",
          autoplay: false,
          playsinline: true,
          preload: true,
          controlBarVisibility: "hover",
          useH5Prism: true,
          license: {
            domain: "lucky-nicke-movie.oss-cn-shenzhen.aliyuncs.com",
            key: "xPfu7NfoGscF2Fycvf1255184446947d1afdf46e27fef31bc",
          },
        },
        (player) => {
          console.log("阿里云播放器初始化成功!");

          player.on("ready", () => {
            const playerContainer = document.getElementById("J_prismPlayer");
            const togglePlay = (e) => {
              // 使用 closest 方法判断点击的元素是否在控制栏 (.prism-controlbar) 内部
              // 如果是控制栏里的按钮（音量、进度条等），就直接 return，不触发暂停/播放
              if (e.target.closest(".prism-controlbar")) {
                return;
              }
              // 否则执行播放或暂停
              if (player.getStatus() === "playing") {
                player.pause();
              } else {
                player.play();
              }
            };
            if (playerContainer) {
              playerContainer.style.cursor = "pointer";
              playerContainer.addEventListener("click", togglePlay);
              // 记住移除事件监听器以防止内存泄漏
              this.playerClickHandler = togglePlay;
            }
          });
        }
      );

      // 绑定播放器事件来控制弹幕
      this.player.on("play", () => {
        this.isPlaying = true;
      });
      this.player.on("pause", () => {
        this.isPlaying = false;
      });

      // 时间更新时，发射弹幕
      this.player.on("timeupdate", () => {
        const currentTime = this.player.getCurrentTime();
        // 如果当前时间大于等于下一条弹幕的 playTime，则发射该弹幕，索引+1
        while (
          this.danmakuIndex < this.sortedDanmakuList.length &&
          this.sortedDanmakuList[this.danmakuIndex].playTime <= currentTime
        ) {
          this.shootDanmaku(this.sortedDanmakuList[this.danmakuIndex]);
          this.danmakuIndex++;
        }
      });

      // 用户拖动进度条时，重新计算弹幕索引，并清空当前屏幕弹幕
      this.player.on("seeked", () => {
        const currentTime = this.player.getCurrentTime();
        if (this.$refs.danmakuLayer) this.$refs.danmakuLayer.innerHTML = ""; // 清屏

        // 找到第一个大于当前时间的弹幕索引
        this.danmakuIndex = this.sortedDanmakuList.findIndex(
          (d) => d.playTime >= currentTime
        );
        if (this.danmakuIndex === -1) {
          this.danmakuIndex = this.sortedDanmakuList.length;
        }
      });
    },

    sendComment() {
      if (!this.commentInput.trim()) {
        this.$message.warning("评论内容不能为空");
        return;
      }

      const payload = {
        videoId: this.videoId,
        content: this.commentInput,
        // 如果后端需要，可以传 parentId: null 或者 0
      };

      // TODO: 调用后端发表根评论接口
      // movieApi.addComment(payload).then(res => {
      //   this.$message.success("评论发表成功");
      //   this.commentInput = "";
      //   this.initData(); // 重新拉取一次数据刷新评论列表
      // })

      console.log("模拟发送根评论:", payload);
      this.$message.success("评论发表成功(模拟)");
      this.commentInput = "";
    },

    // 点赞某条评论
    likeComment(comment) {
      // TODO: 调用后端评论点赞接口
      // movieApi.likeComment(comment.id).then(...)

      // 前端表现层先+1，让用户感觉反应很快
      comment.likeCount = (comment.likeCount || 0) + 1;
      this.$message.success("点赞成功");
    },

    // 动态发射弹幕到页面
    shootDanmaku(item) {
      const layer = this.$refs.danmakuLayer;
      if (!layer) return;
      const span = document.createElement("span");
      span.innerText = item.content;
      span.style.color = item.color || "#ffffff";
      span.className = "danmaku-item";
      // 随机分配一个高度轨道 (距离顶部 10% 到 85% 之间)，防止全部挤在一条线上
      const top = Math.floor(Math.random() * 75) + 10;
      span.style.top = top + "%";
      layer.appendChild(span);
      // --- 修改为精确的动画帧计时器 ---
      let remainingTime = 7500; // 弹幕总存活时长 (毫秒)
      let lastTime = performance.now(); // 记录上一次的时间截
      const checkAndRemove = (currentTime) => {
        // 如果元素已经被别的地方（比如拖动进度条清屏）移除了，直接退出清理逻辑
        if (!layer.contains(span)) return;
        // 计算距离上一帧经过了多少毫秒
        const deltaTime = currentTime - lastTime;
        lastTime = currentTime;
        // 只有在视频正在播放时，才扣减生存时间
        if (this.isPlaying) {
          remainingTime -= deltaTime;
        }
        // 如果生存时间耗尽，则销毁元素
        if (remainingTime <= 0) {
          layer.removeChild(span);
        } else {
          // 如果还没耗尽，下一帧继续计算
          requestAnimationFrame(checkAndRemove);
        }
      };
      // 启动计时器
      requestAnimationFrame(checkAndRemove);
    },

    /**
     * 将嵌套的树形评论结构，转换为带有缩进深度的两层结构
     */
    formatComments(commentList) {
      if (!commentList || !Array.isArray(commentList)) return [];

      return commentList.map((root) => {
        const flatChildren = [];
        // depth: 层级深度。 1表示第一层子评论，2表示第二层子评论...
        const extractChildren = (childrenArray, depth = 1) => {
          if (!childrenArray || childrenArray.length === 0) return;
          childrenArray.forEach((child) => {
            // 第1层不缩进，从第2层(即整体的第3层)开始缩进30px，最大缩进120px防破版
            const indent = depth > 1 ? Math.min((depth - 1) * 30, 120) : 0;
            flatChildren.push({ ...child, depth, indent });

            if (child.children && child.children.length > 0) {
              extractChildren(child.children, depth + 1);
            }
          });
        };

        extractChildren(root.children);
        flatChildren.sort(
          (a, b) => new Date(a.createTime) - new Date(b.createTime)
        );

        return {
          ...root,
          flatChildren: flatChildren,
        };
      });
    },

    // 跳转分类到主页
    goToCategory(category) {
      if (!category) return;
      // 将分类名称作为查询参数传递
      this.$router.push({
        path: "/category", // 修改为目标页面的路由path，例如 /category
        query: { category: category }, // 将分类信息放在query中
      });
    },

    goToVideoDetail(id) {
      if (!id) return;
      this.$router.push({ name: "VideoDetail", params: { id: id } });
    },
  },
};
</script>

<style lang="scss" scoped>
.danmaku-layer.is-hidden {
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.3s;
}
/* ================= 弹幕发送栏样式 ================= */
.danmaku-send-bar {
  display: flex;
  align-items: center;
  margin-top: 15px;
  background-color: #f4f5f7;
  padding: 10px 15px;
  border-radius: 6px;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);

  .danmaku-switch {
    margin-right: 15px;
  }

  .danmaku-input-el {
    flex: 1;
    ::v-deep .el-input-group__append {
      background-color: #00a1d6;
      color: #fff;
      border: 1px solid #00a1d6;
      cursor: pointer;
      &:hover {
        background-color: #00b5e5;
      }
    }
  }
}

/* ================= 评论回复框样式 ================= */
.reply-box-container {
  margin-top: 12px;
  padding: 12px;
  background-color: #fff;
  border: 1px solid #e3e5e7;
  border-radius: 4px;
  animation: slideDown 0.2s ease;

  .reply-actions {
    margin-top: 10px;
    display: flex;
    justify-content: flex-end;
    gap: 10px;
  }
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-5px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
/* ================= 动态弹幕系统样式 ================= */
.danmaku-layer {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 50px; /* bottom 留出控制条位置 */
  pointer-events: none; /* 让点击事件穿透到下方的视频播放器 */
  overflow: hidden;
  z-index: 10;
}

/* 视频暂停时，暂停所有弹幕的 CSS 动画 */
.danmaku-layer.is-paused ::v-deep .danmaku-item {
  animation-play-state: paused !important;
}

/* 动态插入的弹幕样式 (使用 ::v-deep 穿透 scoped) */
::v-deep .danmaku-item {
  position: absolute;
  right: 0;
  white-space: nowrap;
  font-size: 20px;
  font-weight: 500;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8); /* 增加黑边，防止白色背景看不清 */
  transform: translateX(100%); /* 初始在屏幕右侧外部 */
  /* 飞行时间 7秒，匀速 */
  animation: danmakuMove 15s linear forwards;
}

/* 弹幕从右往左飞的动画 */
@keyframes danmakuMove {
  0% {
    transform: translateX(100%);
  }
  100% {
    transform: translateX(-150vw);
  } /* 飞出左侧屏幕 */
}
.video-detail-root {
  max-width: 1300px;
  margin: 0 auto;
  padding: 20px;
  min-height: calc(100vh - 80px);
}

.layout-container {
  display: flex;
  gap: 30px;
  align-items: flex-start;
}

/* ================= 左侧主体 ================= */
.left-content {
  flex: 1;
  min-width: 0;
}

/* 播放器区域 */
.player-wrapper {
  width: 100%;
  aspect-ratio: 16 / 9;
  background-color: #000;
  border-radius: 6px;
  overflow: hidden;
  position: relative;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);

  /* 保证阿里云播放器铺满 */
  .prism-player {
    width: 100%;
    height: 100%;
  }

  .danmaku-layer {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 40px;
    pointer-events: none;
    overflow: hidden;
    z-index: 10; /* 盖在播放器上层 */
  }
}

/* 视频信息 */
.video-info {
  margin-top: 20px;

  .video-title {
    font-size: 22px;
    font-weight: 500;
    color: #18191c;
    line-height: 1.4;
    margin: 0 0 12px 0;
  }

  .video-meta {
    font-size: 13px;
    color: #9499a0;
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 15px;

    .meta-item i {
      margin-right: 4px;
    }
    .tag {
      background-color: #f1f2f3;
      padding: 4px 10px;
      border-radius: 12px;
      color: #61666d;
      cursor: pointer;
      transition: all 0.2s;

      &:hover {
        background-color: #e3e5e7;
        color: #00a1d6;
      }
    }
  }

  .video-actions {
    display: flex;
    gap: 15px;
    border-bottom: 1px solid #e3e5e7;
    padding-bottom: 15px;
  }
}

/* 评论区 */
.comment-section {
  .comment-header {
    margin-bottom: 20px;
    h3 {
      font-size: 18px;
      color: #18191c;
      .count {
        margin-left: 5px;
        font-size: 14px;
        color: #9499a0;
      }
    }
  }

  .comment-publish {
    display: flex;
    gap: 15px;
    margin-bottom: 30px;

    .comment-input {
      flex: 1;
      ::v-deep .el-textarea__inner {
        background-color: #f1f2f3;
        border: none;
        &:focus {
          background-color: #fff;
          border: 1px solid #00a1d6;
        }
      }
    }
    .publish-btn {
      width: 80px;
      background-color: #00a1d6;
      border-color: #00a1d6;
    }
  }

  .comment-item {
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
    border-bottom: 1px solid #e3e5e7;
    padding-bottom: 15px;

    .comment-content-wrap {
      flex: 1;

      .comment-user {
        font-size: 13px;
        color: #fb7299;
        font-weight: 500;
        margin-bottom: 5px;
      }
      .comment-text {
        font-size: 15px;
        color: #18191c;
        line-height: 1.6;
        margin-bottom: 8px;
        white-space: pre-wrap;
      }
      .comment-info {
        font-size: 13px;
        color: #9499a0;
        display: flex;
        gap: 15px;
        align-items: center;

        .action {
          cursor: pointer;
          &:hover {
            color: #00a1d6;
          }
        }
      }

      /* 二级子评论区域 */
      .sub-comment-list {
        margin-top: 10px;
        background-color: #f8f9fa;
        border-radius: 4px;
        padding: 10px 15px;

        .sub-comment-item {
          display: flex;
          gap: 10px;
          margin-bottom: 10px;
          /* 过渡动画使缩进效果更平滑 */
          transition: margin-left 0.3s ease;

          &:last-child {
            margin-bottom: 0;
          }

          .sub-content {
            flex: 1;
            font-size: 14px;
            line-height: 1.5;

            .sub-user {
              color: #61666d;
              font-weight: 500;
              margin-right: 5px;
            }
            .reply-target {
              color: #00a1d6;
              margin-right: 5px;
            }
            .sub-text {
              color: #18191c;
            }

            .sub-info {
              margin-top: 4px;
              font-size: 12px;
              color: #9499a0;
              display: flex;
              gap: 15px;
              .action {
                cursor: pointer;
                &:hover {
                  color: #00a1d6;
                }
              }
            }
          }
        }
      }
    }
  }
}

/* ================= 右侧主体 ================= */
.right-sidebar {
  width: 350px;
  flex-shrink: 0;
}

/* 极简 UP主信息卡片 */
.up-info-card {
  display: flex;
  align-items: center;
  gap: 15px;
  background: #fff;
  padding: 15px;
  border-radius: 6px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
  margin-bottom: 20px;

  .up-detail {
    flex: 1;
    .up-name {
      font-size: 16px;
      font-weight: bold;
      color: #fb7299;
    }
  }
}

/* 推荐视频列表 */
.recommend-section {
  .recommend-title {
    font-size: 16px;
    font-weight: 500;
    margin-bottom: 15px;
    color: #18191c;
  }

  .recommend-list {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .recommend-item {
    display: flex;
    gap: 10px;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.2s;

    &:hover {
      background-color: #f1f2f3;
      .rec-title {
        color: #00a1d6;
      }
    }

    .rec-cover {
      width: 140px;
      height: 80px;
      border-radius: 6px;
      overflow: hidden;
      flex-shrink: 0;

      img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }

    .rec-info {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      overflow: hidden;

      .rec-title {
        font-size: 14px;
        color: #18191c;
        line-height: 1.4;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
      }
      .rec-up,
      .rec-stats {
        font-size: 12px;
        color: #9499a0;
      }
    }
  }
}

@media screen and (max-width: 1000px) {
  .layout-container {
    flex-direction: column;
  }
  .right-sidebar {
    width: 100%;
  }
}
</style>