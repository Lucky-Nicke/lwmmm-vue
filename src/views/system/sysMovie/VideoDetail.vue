<template>
  <div class="app-container">
    <!-- === 新增：顶部导航栏 === -->
    <div class="page-navigation">
      <el-page-header @back="goBack" content="视频详情页" title="返回列表">
        <!-- 可选：在右侧加个面包屑或者当前状态 -->
        <template slot="content">
          <span class="header-title"> 视频详情 </span>
        </template>
      </el-page-header>
    </div>

    <!-- 1. 顶部：视频信息与核心数据 -->
    <el-card class="video-header-card" shadow="never">
      <el-row :gutter="20">
        <!-- 左侧：视频封面/预览 -->
        <el-col :span="6">
          <div class="video-thumb-wrapper">
            <el-image
              :src="videoInfo.cover"
              fit="cover"
              class="video-cover"
            ></el-image>
          </div>
        </el-col>

        <!-- 右侧：数据概览 -->
        <el-col :span="18">
          <div class="video-meta">
            <h2 class="video-title">{{ videoInfo.title }}</h2>
            <div class="video-tags">
              <el-tag
                size="small"
                v-for="tag in videoInfo.tags"
                :key="tag"
                style="margin-right: 10px"
                >{{ tag }}</el-tag
              >
              <span class="publish-time"
                >发布于: {{ videoInfo.publishTime }}</span
              >
            </div>

            <!-- 数据统计卡片 -->
            <el-row :gutter="20" class="data-row">
              <el-col :span="6">
                <div class="data-item">
                  <div class="label"><i class="el-icon-view"></i> 播放量</div>
                  <div class="value">{{ formatNumber(videoInfo.views) }}</div>
                </div>
              </el-col>
              <el-col :span="6">
                <div class="data-item">
                  <div class="label">
                    <i class="el-icon-star-on"></i> 点赞数
                  </div>
                  <div class="value">{{ formatNumber(videoInfo.likes) }}</div>
                </div>
              </el-col>
              <el-col :span="6">
                <div class="data-item">
                  <div class="label">
                    <i class="el-icon-chat-dot-square"></i> 总弹幕
                  </div>
                  <div class="value">
                    {{ formatNumber(videoInfo.danmakuCount) }}
                  </div>
                </div>
              </el-col>
              <el-col :span="6">
                <div class="data-item">
                  <div class="label">
                    <i class="el-icon-s-comment"></i> 总评论
                  </div>
                  <div class="value">
                    {{ formatNumber(videoInfo.commentCount) }}
                  </div>
                </div>
              </el-col>
            </el-row>
          </div>
        </el-col>
      </el-row>
    </el-card>

    <!-- 2. 下部：管理面板 (弹幕 & 评论) -->
    <el-card class="management-card" shadow="never" style="margin-top: 20px">
      <el-tabs v-model="activeTab">
        <!-- Tab 1: 弹幕管理 -->
        <el-tab-pane label="弹幕管理" name="danmaku">
          <div class="filter-container">
            <el-input
              v-model="danmakuFilter"
              placeholder="搜索弹幕内容..."
              style="width: 200px"
              size="small"
              prefix-icon="el-icon-search"
            />
            <el-button
              type="danger"
              size="small"
              style="margin-left: 10px"
              @click="batchDeleteDanmaku"
              >批量删除</el-button
            >
          </div>

          <el-table
            :data="filteredDanmakuList"
            style="width: 100%"
            stripe
            @selection-change="handleDanmakuSelection"
          >
            <el-table-column type="selection" width="55" />
            <el-table-column
              prop="timePoint"
              label="视频时间点"
              width="120"
              sortable
            >
              <template slot-scope="scope">
                <el-tag type="info" size="mini">{{
                  scope.row.timePoint
                }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="content" label="弹幕内容">
              <template slot-scope="scope">
                <span :style="{ color: scope.row.color }">{{
                  scope.row.content
                }}</span>
              </template>
            </el-table-column>
            <el-table-column
              prop="sendTime"
              label="发送时间"
              width="180"
              sortable
            />
            <el-table-column prop="sender" label="发送者ID" width="150" />
            <el-table-column label="操作" width="100" align="center">
              <template slot-scope="scope">
                <el-button
                  type="text"
                  class="text-danger"
                  @click="handleDelete(scope.row, 'danmaku')"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>
          <!-- 分页 -->
          <div class="pagination-container">
            <el-pagination
              background
              layout="prev, pager, next"
              :total="danmakuPagination.total"
              :page-size="danmakuPagination.pageSize"
              :current-page.sync="danmakuPagination.currentPage"
              @current-change="handleDanmakuPageChange"
            />
          </div>
        </el-tab-pane>

        <!-- Tab 2: 评论管理 (这里是修改后的新版设计) -->
        <el-tab-pane label="评论管理" name="comments">
          <!-- 顶部筛选栏 -->
          <div class="filter-container">
            <el-input
              v-model="commentSearch"
              placeholder="搜索评论内容/用户..."
              style="width: 200px; margin-left: 10px"
              size="small"
              prefix-icon="el-icon-search"
            />
          </div>

          <!-- 评论表格 (无折叠箭头，直接内嵌展示) -->
          <el-table
            :data="filteredCommentList"
            style="width: 100%; margin-top: 15px"
            border
          >
            <!-- 列1：用户信息 -->
            <el-table-column label="用户信息" width="180">
              <template slot-scope="scope">
                <div class="user-info-cell">
                  <el-avatar
                    :size="32"
                    :src="scope.row.avatar"
                    shape="square"
                  ></el-avatar>
                  <div class="user-meta">
                    <div class="username">{{ scope.row.username }}</div>
                    <div class="id-text">ID: {{ scope.row.id }}</div>
                  </div>
                </div>
              </template>
            </el-table-column>

            <!-- 列2：评论内容 (包含一级和二级) -->
            <el-table-column label="评论内容" min-width="400">
              <template slot-scope="scope">
                <!-- 一级评论本体 -->
                <div class="root-comment-text">
                  {{ scope.row.content }}
                </div>

                <!-- 二级评论区域 (灰色背景框) -->
                <!-- 只有当 children 存在且长度大于0时才显示 -->
                <div
                  v-if="scope.row.children && scope.row.children.length > 0"
                  class="sub-comment-box"
                >
                  <div
                    v-for="sub in scope.row.children"
                    :key="sub.id"
                    class="sub-comment-item"
                  >
                    <div class="sub-header">
                      <span class="sub-user">{{ sub.username }}</span>
                      <span v-if="sub.replyToUser" class="sub-target">
                        回复 @{{ sub.replyToUser }}</span
                      >
                      <span class="sub-colon">：</span>
                      <span class="sub-content">{{ sub.content }}</span>
                    </div>
                    <div class="sub-footer">
                      <span class="time">{{ sub.date }}</span>
                      <!-- 点击这里删除子评论，传入父ID以便查找 -->
                      <el-button
                        type="text"
                        class="sub-del-btn"
                        size="mini"
                        @click="handleDelete(sub, 'comment', scope.row.id)"
                        >删除</el-button
                      >
                    </div>
                  </div>
                </div>
              </template>
            </el-table-column>

            <!-- 列3：数据 -->
            <el-table-column
              prop="likes"
              label="点赞"
              width="80"
              align="center"
            />
            <el-table-column
              prop="date"
              label="发布时间"
              width="160"
              align="center"
            />

            <!-- 列4：操作 (针对一级评论) -->
            <el-table-column
              label="操作"
              width="120"
              align="center"
              fixed="right"
            >
              <template slot-scope="scope">
                <el-button
                  type="text"
                  size="small"
                  style="color: #f56c6c"
                  @click="handleDelete(scope.row, 'comment')"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>

          <!-- 评论分页 -->
          <div
            class="pagination-container"
            style="text-align: right; margin-top: 20px"
          >
            <el-pagination
              background
              layout="prev, pager, next"
              :total="commentPagination.total"
              :page-size="commentPagination.pageSize"
              :current-page.sync="commentPagination.currentPage"
              @current-change="handleCommentPageChange"
            />
          </div>
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>
  
  <script>
import { getMovieDetail } from "@/api/date/date.js";

export default {
  name: "VideoDetail",
  data() {
    return {
      danmakuPagination: {
        currentPage: 1,
        pageSize: 10,
        total: 0,
      },
      commentPagination: {
        currentPage: 1,
        pageSize: 10,
        total: 0,
      },

      activeTab: "danmaku",
      currentId: null,
      videoInfo: {},

      // 2. 模拟弹幕数据
      danmakuFilter: "",
      selectedDanmaku: [],
      danmakuList: [],

      // 3. 模拟评论数据
      commentFilterType: "all",
      commentSearch: "",
      commentList: [],
      currentReplyRow: null,
    };
  },
  created() {
    // 1. 获取路由参数中的 id
    const id = this.$route.params.id;
    this.currentId = id;

    // 2. 根据ID调用后端接口获取数据 (此处模拟)
    this.fetchData(id);
  },
  computed: {
    // 简单的前端过滤逻辑，实际项目中由后端处理
    filteredDanmakuList() {
      if (!this.danmakuFilter) return this.danmakuList;
      return this.danmakuList.filter((item) =>
        item.content.includes(this.danmakuFilter)
      );
    },
    // 评论管理的过滤逻辑
    filteredCommentList() {
      const searchQuery = this.commentSearch.trim();
      if (!searchQuery) {
        // 如果没有搜索词，则返回原始列表
        return this.commentList;
      }

      // 过滤逻辑：遍历所有的一级评论
      return this.commentList.filter((comment) => {
        // 检查一级评论是否匹配
        const isRootMatch =
          comment.username.toLowerCase().includes(searchQuery.toLowerCase()) ||
          comment.content.toLowerCase().includes(searchQuery.toLowerCase());

        if (isRootMatch) {
          // 如果一级评论匹配，保留它，并同时过滤其子评论
          return true;
        }

        // 如果一级评论不匹配，检查它的子评论是否匹配
        if (comment.children && comment.children.length > 0) {
          const matchedChildren = comment.children.filter(
            (subComment) =>
              subComment.username
                .toLowerCase()
                .includes(searchQuery.toLowerCase()) ||
              subComment.content
                .toLowerCase()
                .includes(searchQuery.toLowerCase())
          );

          // 如果有匹配的子评论，也保留这个一级评论，并更新其children为过滤后的结果
          if (matchedChildren.length > 0) {
            // 注意：这里会修改原始数据的引用。为了不污染原始数据，可以创建一个副本
            comment.children = matchedChildren;
            return true;
          }
        }

        // 一级评论和子评论都不匹配
        return false;
      });
    },
  },
  methods: {
    handleDanmakuPageChange(currentPage) {
      this.danmakuPagination.currentPage = currentPage;
    },

    handleCommentPageChange(currentPage) {
      this.commentPagination.currentPage = currentPage;
    },
    goBack() {
      // 优先尝试返回上一级路由
      if (window.history.length > 1) {
        this.$router.back();
      } else {
        // 如果没有历史记录（比如直接输入网址进入的），跳转到首页或列表页
        this.$router.push("/dashboard"); // 这里的路径根据你的实际路由调整
      }
    },
    async fetchData(id) {
      try {
        const response = await getMovieDetail(id);
        const data = response.data;

        // 映射后端数据到前端结构
        this.videoInfo = {
          id: data.videoId,
          title: data.name,
          cover: data.image,
          publishTime: data.publishTime,
          tags: [data.category],
          views: data.playCount || 0,
          likes: data.likeCount || 0,
          danmakuCount: data.danmakuCount || 0,
          commentCount: data.commentCount || 0,
        };

        // 将后端返回的弹幕列表映射到前端结构
        this.danmakuList = data.danmakuList.map((danmaku) => ({
          id: danmaku.id, // 如果后端没有提供ID，可以使用索引或其他唯一标识
          timePoint: this.formatPlayTime(danmaku.playTime), // 将秒数转换为 MM:SS 格式
          content: danmaku.content,
          color: danmaku.color,
          sendTime: danmaku.createTime,
          sender: `用户:${danmaku.userId}`, // 或者根据需要格式化
        }));

        // 将后端返回的评论列表映射到前端结构
        this.commentList = data.commentList.map((comment) => ({
          ...comment,
          id: comment.id,
          username: comment.userId,
          avatar: comment.avatar,
          content: comment.content,
          likes: comment.likeCount,
          date: comment.createTime,
          // children 已经在后端组装好了，可以直接使用
          children: comment.children?.map((child) => ({
            ...child,
            username: child.userId,
            avatar: child.avatar,
            content: child.content,
            likes: child.likeCount,
            date: child.createTime,
            // 子评论的 replyToUser 已经有了，无需修改
          })),
        }));
        // 初始化分页信息
        this.danmakuPagination.total = data.danmakuCount;
        this.commentPagination.total = data.commentCount;
      } catch (error) {
        console.error("获取视频详情失败:", error);
        this.$message.error("获取视频详情失败");
      }
    },
    formatPlayTime(seconds) {
      const mins = Math.floor(seconds / 60);
      const secs = Math.floor(seconds % 60);
      const formattedMins = mins.toString().padStart(2, "0");
      const formattedSecs = secs.toString().padStart(2, "0");
      return `${formattedMins}:${formattedSecs}`;
    },
    // 动态给表格行添加类名
    getRowClass({ row, rowIndex }) {
      // 逻辑：如果这一行没有子评论 (children 不存在 或 长度为0)
      if (!row.children || row.children.length === 0) {
        return "no-expand-arrow"; // 返回这个类名，去 CSS 里控制隐藏
      }
      return ""; // 有子评论，不加类名，正常显示箭头
    },
    // 格式化数字 (例如 12000 -> 1.2w)
    formatNumber(num) {
      return num >= 10000 ? (num / 10000).toFixed(1) + "w" : num;
    },

    // 弹幕多选
    handleDanmakuSelection(val) {
      this.selectedDanmaku = val;
    },

    // 批量删除弹幕
    batchDeleteDanmaku() {
      if (this.selectedDanmaku.length === 0) {
        this.$message.warning("请先选择要删除的弹幕");
        return;
      }
      this.$confirm(
        `确定要删除选中的 ${this.selectedDanmaku.length} 条弹幕吗?`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        }
      ).then(() => {
        // TODO: 调用后端API
        this.$message.success("删除成功");
        // 模拟前端删除
        const ids = this.selectedDanmaku.map((item) => item.id);
        this.danmakuList = this.danmakuList.filter(
          (item) => !ids.includes(item.id)
        );
      });
    },

    // 单个删除 (通用)
    handleDelete(row, type, parentId = null) {
      const text = parentId ? "子评论" : type === "danmaku" ? "弹幕" : "评论";

      this.$confirm(`确定删除这条${text}吗?`, "警告", { type: "warning" }).then(
        () => {
          if (parentId) {
            // 删除子评论逻辑（前端模拟）
            const parent = this.commentList.find((p) => p.id === parentId);
            if (parent) {
              parent.children = parent.children.filter(
                (child) => child.id !== row.id
              );
            }
          } else {
            // 删除主评论逻辑
            if (type === "danmaku") {
              this.danmakuList = this.danmakuList.filter(
                (item) => item.id !== row.id
              );
            } else {
              this.commentList = this.commentList.filter(
                (item) => item.id !== row.id
              );
            }
          }
          this.$message.success("删除成功");
        }
      );
    },

    // 打开回复框
    handleReply(row) {
      this.currentReplyRow = row;
      this.replyContent = "";
      this.replyDialogVisible = true;
    },

    // 提交回复
    submitReply() {
      if (!this.replyContent.trim()) return;
      this.$message.success(`已回复用户 ${this.currentReplyRow.username}`);
      this.replyDialogVisible = false;
      // TODO: 调用后端API发送回复
    },
  },
};
</script>
  
  <style lang="scss" scoped>
.page-navigation {
  background: #ffffff;
  padding: 16px 24px;
  margin-bottom: 20px;
  border-radius: 4px;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08); /* 轻微的阴影提升质感 */
  display: flex;
  align-items: center;
  border-bottom: 1px solid #ebeef5; /* 可选：底部分割线 */
}

/* 调整标题文字样式，使其更突出 */
.page-navigation ::v-deep .el-page-header__content {
  font-weight: 600;
  color: #303133;
}

.page-navigation ::v-deep .el-page-header__title {
  font-size: 14px;
  color: #606266;
}

/* 鼠标悬停在返回文字上时的颜色 */
.page-navigation ::v-deep .el-page-header__left:hover .el-page-header__title,
.page-navigation ::v-deep .el-page-header__left:hover .el-icon-back {
  color: #409eff; /* Element UI 主题蓝 */
}

/* 原有的容器样式（建议加上背景色以突显卡片） */
.app-container {
  padding: 20px;
  background-color: #f0f2f5; /* 浅灰背景，让白色卡片更明显 */
  min-height: 100vh;
}
.app-container {
  padding: 20px;
  background-color: #f0f2f5;
  min-height: 100vh;
}

/* 筛选栏通用样式 */
.filter-container {
  display: flex;
  align-items: center;
  padding-bottom: 0;
}

/* 表格内用户信息 */
.user-info-cell {
  display: flex;
  align-items: center;
  .user-meta {
    margin-left: 10px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    line-height: 1.3;
    .username {
      font-weight: bold;
      font-size: 13px;
      color: #333;
    }
    .id-text {
      font-size: 12px;
      color: #999;
    }
  }
}

/* 一级评论文本 */
.root-comment-text {
  font-size: 14px;
  color: #333;
  margin-bottom: 8px;
  line-height: 1.5;
}

/* 二级评论容器（灰色盒子） */
.sub-comment-box {
  background-color: #f4f4f5; /* 浅灰色背景 */
  border-radius: 4px;
  padding: 8px 12px;
  margin-top: 8px;

  .sub-comment-item {
    padding: 6px 0;
    border-bottom: 1px dashed #dcdfe6; /* 虚线分隔 */

    &:last-child {
      border-bottom: none;
      padding-bottom: 0;
    }

    .sub-header {
      font-size: 13px;
      line-height: 1.4;
      .sub-user {
        color: #409eff;
        font-weight: 500;
        cursor: pointer;
      }
      .sub-target {
        color: #909399;
        font-size: 12px;
      }
      .sub-colon {
        margin: 0 2px;
      }
      .sub-content {
        color: #606266;
      }
    }

    .sub-footer {
      display: flex;
      justify-content: space-between; /* 时间靠左，删除靠右 */
      align-items: center;
      margin-top: 4px;

      .time {
        font-size: 12px;
        color: #999;
      }
      .sub-del-btn {
        padding: 0;
        font-size: 12px;
        color: #f56c6c;
        /* 鼠标悬停变色 */
        &:hover {
          color: #ff0000;
          text-decoration: underline;
        }
      }
    }
  }
}

.text-danger {
  color: #f56c6c;
}

/* 顶部视频卡片样式 */
.video-header-card {
  margin-bottom: 20px;

  .video-thumb-wrapper {
    position: relative;
    border-radius: 4px;
    overflow: hidden;
    height: 160px;
    background: #000;

    .video-cover {
      width: 100%;
      height: 100%;
    }
  }

  .video-meta {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 160px;

    .video-title {
      margin: 0;
      font-size: 20px;
      color: #303133;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    .video-tags {
      margin-top: 10px;
      .publish-time {
        font-size: 13px;
        color: #909399;
        margin-left: 10px;
      }
    }

    .data-row {
      margin-top: 20px;
      text-align: center;

      .data-item {
        .label {
          font-size: 14px;
          color: #909399;
          margin-bottom: 5px;
          i {
            margin-right: 5px;
          }
        }
        .value {
          font-size: 20px;
          font-weight: bold;
          color: #409eff;
        }
      }
    }

    .action-bar {
      margin-top: auto;
      text-align: right;
    }
  }
}

/* 管理面板样式 */
.management-card {
  .filter-container {
    margin-bottom: 15px;
    display: flex;
    align-items: center;
  }

  .text-danger {
    color: #f56c6c;
    &:hover {
      color: #ff4949;
    }
  }

  .user-info-cell {
    display: flex;
    align-items: center;
    .username {
      margin-left: 10px;
      font-weight: 500;
      color: #606266;
    }
  }

  .reply-quote {
    background: #f4f4f5;
    padding: 5px;
    font-size: 12px;
    color: #909399;
    border-radius: 4px;
    margin-top: 5px;
  }

  .pagination-container {
    margin-top: 20px;
    text-align: right;
  }
}
</style>