<template>
  <div class="video-detail-root" v-loading="loading">
    <div class="layout-container" v-if="video">
      <!-- ================= 左侧：视频播放、信息、评论 ================= -->
      <div class="left-content">
        <!-- 1. 视频播放区域 (接入阿里云 Aliplayer) -->
        <div class="player-wrapper">
          <div
            class="danmaku-layer"
            ref="danmakuLayer"
            :class="{ 'is-hidden': !showDanmaku, 'is-paused': !isPlaying }"
          ></div>
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
              {{ video.danmakuCount || 0 }} 条弹幕</span
            >
            <span class="meta-item"
              ><i class="el-icon-time"></i> {{ video.publishTime }}</span
            >
            <span class="meta-item tag" title="点击查看该分类更多视频">{{
              video.category || "默认分类"
            }}</span>
          </div>
          <div class="video-actions">
            <el-button
              size="medium"
              :type="video && video.liked === true ? 'primary' : ''"
              icon="el-icon-thumb"
              round
              @click="likeVideo"
            >
              {{ video && video.liked ? "已点赞" : "点赞" }}
              {{ video ? video.likeCount || 0 : 0 }}
            </el-button>
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

          <div class="comment-publish">
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

          <div class="comment-list">
            <div
              class="comment-item"
              v-for="rootComment in processedComments"
              :key="rootComment.id"
            >
              <el-avatar
                :src="rootComment.avatar"
                class="comment-avatar"
              ></el-avatar>

              <div class="comment-content-wrap">
                <div class="comment-user">
                  {{ (rootComment.userId || "").replace("用户:", "User--") }}
                </div>
                <div class="comment-text">{{ rootComment.content }}</div>
                <div class="comment-info">
                  <span class="time">{{ rootComment.createTime }}</span>
                  <span
                    class="action"
                    :class="{ 'is-active': rootComment.liked }"
                    @click="likeComment(rootComment)"
                  >
                    <i class="el-icon-thumb"></i>
                    {{ rootComment.likeCount || 0 }}
                  </span>
                  <span
                    class="action reply-btn"
                    @click="showReplyBox(rootComment)"
                    >回复</span
                  >
                  <!-- 删除按钮 (仅自己的评论可见) -->
                  <span
                    class="action delete-btn"
                    v-if="isMyComment(rootComment.userId)"
                    @click="handleDeleteComment(rootComment.id)"
                    style="color: #f56c6c; margin-left: 10px"
                  >
                    删除
                  </span>
                </div>

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
                        (child.userId || "").replace("用户:", "User--")
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
                        <span
                          class="action"
                          :class="{ 'is-active': child.liked }"
                          @click="likeComment(child)"
                        >
                          <i class="el-icon-thumb"></i>
                          {{ child.likeCount || 0 }}
                        </span>
                        <span
                          class="action reply-btn"
                          @click="showReplyBox(child, rootComment.id)"
                          >回复</span
                        >
                        <!-- 删除按钮 (仅自己的评论可见) -->
                        <span
                          class="action delete-btn"
                          v-if="isMyComment(child.userId)"
                          @click="handleDeleteComment(child.id)"
                          style="color: #f56c6c; margin-left: 10px"
                        >
                          删除
                        </span>
                      </div>

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
        <div class="up-info-card">
          <el-avatar :src="video.creatorAvatar" :size="45"></el-avatar>
          <div class="up-detail">
            <div class="up-name">{{ video.creator }}</div>
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
                <img :src="item.coverUrl" alt="cover" />
              </div>
              <div class="rec-info">
                <div class="rec-title" :title="item.title">
                  {{ item.title }}
                </div>
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

    <el-empty
      v-else-if="!loading"
      description="视频不见了或加载失败"
    ></el-empty>
    <!-- 替换原有的 el-backtop，使用自定义返回顶部按钮 -->
    <div class="floating-tools">
      <div class="tool-btn top-btn" title="返回顶部" @click="scrollToTop">
        ⬆️
      </div>
    </div>

    <el-dialog
      title="分享视频"
      :visible.sync="shareDialogVisible"
      width="300px"
      center
    >
      <div style="text-align: center">
        <p style="margin-bottom: 15px; color: #666">扫描二维码分享给好友</p>
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
import { getMovieDetail, removeComment } from "@/api/date/date.js";
import movieApi from "@/api/movie/movie.js";
// 【新增】导入删除评论接口（请确认路径是否正确）
import { getToken } from "@/utils/auth";

export default {
  name: "VideoDetail",
  data() {
    return {
      remoteUserId: null,
      videoId: null,
      shareDialogVisible: false,
      loading: true,
      video: null,
      processedComments: [],
      hotVideos: [],
      commentInput: "",
      player: null,
      isPlaying: false,
      sortedDanmakuList: [],
      danmakuIndex: 0,
      showDanmaku: true,
      danmakuInput: "",
      activeReplyId: null,
      replyTargetName: "",
      replyContent: "",
      replyTargetUserId: null,
      hasRecordedPV: false,
    };
  },
  computed: {
    currentUserId() {
      return this.$store.getters.id || this.remoteUserId || null;
    },
  },
  created() {
    this.fetchUserInfo();
    this.videoId = this.$route.params.id;
    this.initData();
    this.$root.$on("on-user-login-success", this.fetchUserInfo);
  },
  beforeDestroy() {
    this.$root.$off("on-user-login-success", this.fetchUserInfo);

    if (this.player) {
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
    // 1. 根据 localStorage 的 userid 判断是否是自己的评论
    isMyComment(commentUserId) {
      if (!commentUserId) return false;

      // 使用你 computed 里的 currentUserId (它结合了 Vuex 和 localStorage)
      const localUserId = this.currentUserId;
      if (!localUserId) return false;

      // 处理后端返回的数据，兼容数字或 "用户:123" 这种格式
      let cId = String(commentUserId);
      if (cId.includes(":")) {
        cId = cId.split(":")[1]; // 把 "用户:123" 截取成 "123"
      }

      // 【关键】打印出来看看，到底哪里对不上！
      console.log(
        "该条评论的用户ID:",
        cId,
        " | 当前登录的用户ID:",
        localUserId
      );

      // 将两边都转为字符串比较，防止 1 !== "1"
      return String(cId) === String(localUserId);
    },

    // 2. 删除评论逻辑（带二次确认与刷新）
    handleDeleteComment(commentId) {
      this.$confirm("确定要删除这条评论吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 调用你提供的删除接口
          removeComment(commentId)
            .then((res) => {
              if (res.code === 200) {
                this.$message.success("删除成功");
                this.initData(); // 刷新当前页面评论数据
              } else {
                this.$message.error(res.msg || "删除失败");
              }
            })
            .catch(() => {
              this.$message.error("删除请求异常");
            });
        })
        .catch(() => {
          // 用户点击取消
        });
    },

    checkIsLogin() {
      const hasToken = this.$store.getters.token || getToken();
      return !!hasToken;
    },
    scrollToTop() {
      window.scrollTo({ top: 0, behavior: "smooth" });
    },

    goToVideoDetail(id) {
      if (!id) return;
      this.$router.push({ name: "VideoDetail", params: { id } });
    },
    fetchUserInfo() {
      // 兼容获取 localStorage 中的 userid 或 userId
      const userId =
        localStorage.getItem("userid") || localStorage.getItem("userId");
      if (userId) {
        this.remoteUserId = userId;
      }
    },
    sendDanmaku() {
      if (!this.danmakuInput.trim()) return;
      if (!this.player) {
        this.$message.warning("视频未加载，无法发送弹幕");
        return;
      }
      if (!this.checkIsLogin() || this.currentUserId === null) {
        this.$message.warning("请先登录");
        return;
      }

      this.fetchUserInfo(); // 尝试重新获取一次
      const currentTime = this.player.getCurrentTime();
      const content = this.danmakuInput;

      const danmuPayload = {
        videoId: this.videoId,
        userId: this.currentUserId,
        content: content,
        time: currentTime,
      };

      movieApi
        .sendDanMu(danmuPayload)
        .then((res) => {
          if (res.code === 200) {
            const newDanmaku = {
              content: content,
              playTime: currentTime,
              color: "#00a1d6",
            };

            // 1. 立即发射自己发的弹幕（不依赖轮询，保证秒发体验）
            this.shootDanmaku(newDanmaku);

            // 2. 将弹幕加入队列并重新排序
            this.sortedDanmakuList.push(newDanmaku);
            this.sortedDanmakuList.sort((a, b) => a.playTime - b.playTime);

            // 3. 【关键修复】更新弹幕指针 danmakuIndex
            // 找到下一个播放时间严格"大于"当前时间的弹幕索引，跳过刚才发的那条
            this.danmakuIndex = this.sortedDanmakuList.findIndex(
              (d) => d.playTime > currentTime
            );
            // 如果没找到，说明在最后面，指针指到数组末尾
            if (this.danmakuIndex === -1) {
              this.danmakuIndex = this.sortedDanmakuList.length;
            }

            this.$message.success("弹幕发送成功");
            this.danmakuInput = "";
          }
        })
        .catch((err) => console.error(err));
    },

    likeVideo() {
      if (!this.video) return;
      if (!this.checkIsLogin() || this.currentUserId === null) {
        this.$message.warning("请先登录");
        return;
      }

      this.fetchUserInfo();
      const isCurrentlyLiked = !!this.video.liked;
      const targetAction = !isCurrentlyLiked;
      const likePayload = {
        videoId: this.videoId,
        userId: this.currentUserId,
        likeType: "video",
        like: targetAction,
      };
      movieApi.sendLike(likePayload).then((res) => {
        if (res.code === 200) {
          const message = res.data || res.msg;
          if (message === "点赞成功") {
            if (!isCurrentlyLiked)
              this.video.likeCount = (this.video.likeCount || 0) + 1;
            this.$set(this.video, "liked", true);
            this.$message.success(message);
          } else if (message === "已经点过赞了") {
            this.$set(this.video, "liked", true);
            this.$message.info(message);
          } else if (message === "取消点赞成功") {
            if (isCurrentlyLiked)
              this.video.likeCount = Math.max(
                0,
                (this.video.likeCount || 0) - 1
              );
            this.$set(this.video, "liked", false);
            this.$message.success(message);
          }
        } else {
          this.$message.error(res.msg || "操作失败");
        }
      });
    },

    shareVideo() {
      this.shareDialogVisible = true;
    },

    sendComment() {
      if (!this.commentInput.trim()) {
        this.$message.warning("评论内容不能为空");
        return;
      }
      if (!this.checkIsLogin() || this.currentUserId === null) {
        this.$message.warning("请先登录");
        return;
      }

      this.fetchUserInfo(); // 尝试重新获取一次
      const commentPayload = {
        videoId: this.videoId,
        userId: this.currentUserId,
        toUserId: null,
        commentRootId: null,
        parentId: null,
        toSendCommentId: null,
        content: this.commentInput,
      };

      movieApi.sendComment(commentPayload).then((res) => {
        if (res.code === 200) {
          this.$message.success("评论发表成功");
          this.commentInput = "";
          this.initData();
        } else {
          this.$message.error(res.msg || "发表失败");
        }
      });
    },

    likeComment(comment) {
      if (!this.checkIsLogin() || this.currentUserId === null) {
        this.$message.warning("请先登录");
        return;
      }

      this.fetchUserInfo();
      const isCurrentlyLiked = !!comment.liked;
      const targetAction = !isCurrentlyLiked;
      const likePayload = {
        videoId: this.videoId,
        userId: this.currentUserId,
        commentId: comment.id,
        likeType: "comment",
        like: targetAction,
      };
      movieApi.sendLike(likePayload).then((res) => {
        if (res.code === 200) {
          const message = res.data || res.msg;
          if (message === "点赞成功") {
            if (!isCurrentlyLiked)
              comment.likeCount = (comment.likeCount || 0) + 1;
            this.$set(comment, "liked", true);
            this.$message.success(message);
          } else if (message === "已经点过赞了") {
            this.$set(comment, "liked", true);
            this.$message.info(message);
          } else if (message === "取消点赞成功") {
            if (isCurrentlyLiked)
              comment.likeCount = Math.max(0, (comment.likeCount || 0) - 1);
            this.$set(comment, "liked", false);
            this.$message.success(message);
          }
        } else {
          this.$message.error(res.msg || "操作失败");
        }
      });
    },

    showReplyBox(comment) {
      if (this.activeReplyId === comment.id) {
        this.cancelReply();
        return;
      }
      this.activeReplyId = comment.id;
      const rawId = comment.userId || "";
      this.replyTargetName = rawId.replace("用户:", ""); // 赋值给 placeholder 显示
      this.replyTargetUserId = rawId.includes(":")
        ? rawId.split(":")[1]
        : rawId;
      this.replyContent = "";
    },

    cancelReply() {
      this.activeReplyId = null;
      this.replyTargetName = "";
      this.replyTargetUserId = null;
      this.replyContent = "";
    },

    submitReply(rootId, targetCommentId = null) {
      if (!this.replyContent.trim()) {
        this.$message.warning("回复内容不能为空");
        return;
      }
      if (!this.checkIsLogin() || this.currentUserId === null) {
        this.$message.warning("请先登录");
        return;
      }

      const parentId = targetCommentId ? targetCommentId : rootId;

      const commentPayload = {
        videoId: this.videoId,
        rootId: rootId,
        parentId: parentId,
        userId: this.currentUserId,
        toUserId: this.replyTargetUserId,
        commentRootId: rootId,
        toSendCommentId: targetCommentId,
        content: this.replyContent,
      };

      movieApi.sendComment(commentPayload).then((res) => {
        if (res.code === 200) {
          this.$message.success("回复成功");
          this.cancelReply();
          this.initData();
        } else {
          this.$message.error(res.msg || "回复失败");
        }
      });
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
            this.sortedDanmakuList =
              this.video.danmakuList?.length > 0
                ? [...this.video.danmakuList].sort(
                    (a, b) => a.playTime - b.playTime
                  )
                : [];
            this.danmakuIndex = 0;
            this.processedComments = this.formatComments(
              this.video.commentList || []
            );
            this.$nextTick(() => this.initAliPlayer());
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
          this.loading = false;
        });
    },

    initAliPlayer() {
      if (this.player) {
        this.player.dispose();
        this.player = null;
      }
      if (!window.Aliplayer) return;

      const playInfo = this.video.playId || {};

      this.player = new window.Aliplayer({
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
      });

      this.player.on("play", () => (this.isPlaying = true));
      this.player.on("pause", () => (this.isPlaying = false));
      this.player.on("timeupdate", () => {
        const currentTime = this.player.getCurrentTime();
        // --- 新增：在timeupdate事件中判断是否首次播放超过5秒 ---
        if (
          !this.hasRecordedPV &&
          currentTime >= 5 &&
          this.videoId &&
          this.currentUserId
        ) {
          this.hasRecordedPV = true; // 设置标志位，防止重复记录
          const pvPayload = {
            videoId: this.videoId,
            userId: this.currentUserId,
          };
          movieApi.recordVideoPV(pvPayload).catch((err) => {
            // 如果记录失败，可以重置标志位，允许再次尝试
            console.warn("Failed to record PV:", err);
            this.hasRecordedPV = false;
          });
        }
        // ---
        while (
          this.danmakuIndex < this.sortedDanmakuList.length &&
          this.sortedDanmakuList[this.danmakuIndex].playTime <= currentTime
        ) {
          this.shootDanmaku(this.sortedDanmakuList[this.danmakuIndex]);
          this.danmakuIndex++;
        }
      });

      this.player.on("seeked", () => {
        const currentTime = this.player.getCurrentTime();
        if (this.$refs.danmakuLayer) this.$refs.danmakuLayer.innerHTML = "";
        this.danmakuIndex = this.sortedDanmakuList.findIndex(
          (d) => d.playTime >= currentTime
        );
        if (this.danmakuIndex === -1)
          this.danmakuIndex = this.sortedDanmakuList.length;
      });
    },

    shootDanmaku(item) {
      const layer = this.$refs.danmakuLayer;
      if (!layer) return;
      const span = document.createElement("span");
      span.innerText = item.content;
      span.style.color = item.color || "#ffffff";
      span.className = "danmaku-item";
      span.style.top = Math.floor(Math.random() * 75) + 10 + "%";
      layer.appendChild(span);

      let remainingTime = 7500;
      let lastTime = performance.now();
      const checkAndRemove = (currentTime) => {
        if (!layer.contains(span)) return;
        const deltaTime = currentTime - lastTime;
        lastTime = currentTime;
        if (this.isPlaying) remainingTime -= deltaTime;
        if (remainingTime <= 0) {
          layer.removeChild(span);
        } else {
          requestAnimationFrame(checkAndRemove);
        }
      };
      requestAnimationFrame(checkAndRemove);
    },

    formatComments(commentList) {
      if (!commentList || !Array.isArray(commentList)) return [];
      return commentList.map((root) => {
        const flatChildren = [];
        const extractChildren = (childrenArray, depth = 1) => {
          if (!childrenArray || childrenArray.length === 0) return;
          childrenArray.forEach((child) => {
            const indent = depth > 1 ? Math.min((depth - 1) * 30, 120) : 0;
            flatChildren.push({ ...child, depth, indent });
            if (child.children?.length > 0)
              extractChildren(child.children, depth + 1);
          });
        };
        extractChildren(root.children);
        return { ...root, flatChildren };
      });
    },
  },
};
</script>

<style lang="scss" scoped>
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
  background-color: #fff;
  border-radius: 50%;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  cursor: pointer;
  transition: all 0.3s;
  border: 1px solid #e3e5e7;

  &:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
  }
}
.action.is-active {
  color: #00a1d6 !important;
  font-weight: bold;
}
.action.is-active i {
  color: #00a1d6;
}

.danmaku-layer {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 40px;
  pointer-events: none;
  overflow: hidden;
  z-index: 10;
  transition: opacity 0.3s;

  &.is-hidden {
    opacity: 0;
    visibility: hidden;
  }
  &.is-paused ::v-deep .danmaku-item {
    animation-play-state: paused !important;
  }
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

::v-deep .danmaku-item {
  position: absolute;
  right: 0;
  pointer-events: none;
  white-space: nowrap;
  font-size: 20px;
  font-weight: 500;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
  transform: translateX(100%);
  animation: danmakuMove 15s linear forwards;
}

@keyframes danmakuMove {
  0% {
    transform: translateX(100%);
  }
  100% {
    transform: translateX(-150vw);
  }
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

.left-content {
  flex: 1;
  min-width: 0;
}

.player-wrapper {
  width: 100%;
  aspect-ratio: 16 / 9;
  background-color: #000;
  border-radius: 6px;
  overflow: hidden;
  position: relative;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);

  .prism-player {
    width: 100%;
    height: 100%;
  }
}

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

      .sub-comment-list {
        margin-top: 10px;
        background-color: #f8f9fa;
        border-radius: 4px;
        padding: 10px 15px;

        .sub-comment-item {
          display: flex;
          gap: 10px;
          margin-bottom: 10px;
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

.right-sidebar {
  width: 350px;
  flex-shrink: 0;
}

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