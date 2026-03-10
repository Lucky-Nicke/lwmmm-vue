<template>
  <div class="app-container">
    <!-- === 顶部导航栏 === -->
    <div class="page-navigation">
      <el-page-header @back="goBack" content="视频详情页" title="返回列表">
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
    <el-card class="management-card" shadow="never">
      <el-tabs v-model="activeTab">
        <!-- Tab 1: 弹幕管理 -->
        <el-tab-pane label="弹幕管理" name="danmaku">
          <div class="filter-container">
            <el-input
              v-model="danmakuFilter"
              placeholder="搜索弹幕内容..."
              style="width: 250px"
              size="small"
              prefix-icon="el-icon-search"
            />
            <el-button
              type="danger"
              size="small"
              style="margin-left: 15px"
              @click="batchDeleteDanmaku"
              icon="el-icon-delete"
              >批量删除</el-button
            >
          </div>

          <el-table
            :data="paginatedDanmakuList"
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

        <!-- Tab 2: 评论管理 -->
        <el-tab-pane label="评论管理" name="comments">
          <div class="filter-container">
            <el-input
              v-model="commentSearch"
              placeholder="搜索评论内容或用户名..."
              style="width: 250px"
              size="small"
              prefix-icon="el-icon-search"
            />
          </div>

          <el-table
            :data="paginatedTopLevelComments"
            style="width: 100%; margin-top: 15px"
            border
          >
            <!-- 用户信息 -->
            <el-table-column label="用户信息" width="200">
              <template slot-scope="scope">
                <div class="user-info-cell">
                  <el-avatar
                    :size="40"
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

            <!-- 评论内容 -->
            <el-table-column label="评论内容" min-width="450">
              <template slot-scope="scope">
                <!-- 一级主评论 -->
                <div class="root-comment-text">{{ scope.row.content }}</div>

                <!-- 子评论区域 -->
                <div
                  v-if="scope.row.children && scope.row.children.length > 0"
                  class="sub-comment-box-recursive"
                >
                  <comment-item
                    v-for="subComment in scope.row.children"
                    :key="subComment.id"
                    :comment="subComment"
                    :depth="1"
                    @delete-sub="handleDelete($event, 'comment', scope.row.id)"
                  />
                </div>
              </template>
            </el-table-column>

            <!-- 数据与时间 -->
            <el-table-column
              prop="likes"
              label="点赞"
              width="90"
              align="center"
            >
              <template slot-scope="scope">
                <i class="el-icon-star-on" style="color: #909399"></i>
                {{ scope.row.likes }}
              </template>
            </el-table-column>
            <el-table-column
              prop="date"
              label="发布时间"
              width="160"
              align="center"
            />

            <!-- 一级评论操作 -->
            <el-table-column
              label="操作"
              width="100"
              align="center"
              fixed="right"
            >
              <template slot-scope="scope">
                <el-button
                  type="text"
                  size="small"
                  class="text-danger"
                  @click="handleDelete(scope.row, 'comment')"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>

          <div class="pagination-container">
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
import {
  getMovieDetail,
  removeDanmaku,
  removeComment,
} from "@/api/date/date.js";

const CommentItem = {
  name: "CommentItem",
  functional: true,
  props: ["comment", "depth"],
  render(h, ctx) {
    const { comment, depth } = ctx.props;
    const { listeners } = ctx;
    const maxDepth = 5;

    // 美化：动态深度样式设计（缩进 + 左侧引导线）
    const depthStyle = {
      marginLeft: depth > 1 ? `20px` : "0",
      paddingLeft: depth > 1 ? "12px" : "0",
      borderLeft: depth > 1 ? "2px solid #e4e7ed" : "none",
      marginTop: "10px",
    };

    // 渲染单个评论节点
    const renderItem = (item) => {
      return h("div", { staticClass: "sub-node", style: depthStyle }, [
        h("div", { staticClass: "sub-header" }, [
          h("span", { staticClass: "sub-user" }, item.username),
          item.replyToUser
            ? h(
                "span",
                { staticClass: "sub-target" },
                ` 回复 @${item.replyToUser}`
              )
            : null,
          h("span", { staticClass: "sub-colon" }, "："),
          h("span", { staticClass: "sub-content" }, item.content),
        ]),
        h("div", { staticClass: "sub-footer" }, [
          h("span", { staticClass: "time" }, item.date),
          h(
            "span",
            {
              staticClass: "sub-del-btn",
              // 修复：必须使用 listeners['delete-sub'] 才能正确响应带横线的事件
              on: {
                click: () =>
                  listeners["delete-sub"] && listeners["delete-sub"](item),
              },
            },
            "删除"
          ),
        ]),
      ]);
    };

    // 渲染递归子项
    const renderChildren = (children) => {
      if (!children || children.length === 0 || depth >= maxDepth) return null;
      return children.map((child) =>
        h(CommentItem, {
          key: child.id,
          props: { comment: child, depth: depth + 1 },
          on: listeners, // 继续透传事件
        })
      );
    };

    return h("div", [renderItem(comment), renderChildren(comment.children)]);
  },
};

export default {
  name: "VideoDetail",
  components: { CommentItem },
  data() {
    return {
      activeTab: "danmaku",
      currentId: null,
      videoInfo: {},

      danmakuPagination: { currentPage: 1, pageSize: 10, total: 0 },
      danmakuFilter: "",
      selectedDanmaku: [],
      danmakuList: [],

      commentPagination: { currentPage: 1, pageSize: 10, total: 0 },
      commentSearch: "",
      commentList: [],
    };
  },
  created() {
    const id = this.$route.params.id;
    this.currentId = id;
    this.fetchData(id);
  },
  computed: {
    topLevelComments() {
      return this.commentList.filter((comment) => !comment.parentId);
    },
    paginatedTopLevelComments() {
      const start =
        (this.commentPagination.currentPage - 1) *
        this.commentPagination.pageSize;
      const end = start + this.commentPagination.pageSize;
      return this.filteredTopLevelComments.slice(start, end);
    },
    filteredDanmakuList() {
      if (!this.danmakuFilter) return this.danmakuList;
      return this.danmakuList.filter((item) =>
        item.content.includes(this.danmakuFilter)
      );
    },
    filteredCommentList() {
      const searchQuery = this.commentSearch.trim();
      if (!searchQuery) return this.commentList;

      const filterRecursively = (comments) => {
        return comments.filter((comment) => {
          const isMatch =
            comment.username
              .toLowerCase()
              .includes(searchQuery.toLowerCase()) ||
            comment.content.toLowerCase().includes(searchQuery.toLowerCase());

          if (isMatch) {
            if (comment.children) {
              comment.children = filterRecursively(comment.children);
            }
            return true;
          }

          if (comment.children && comment.children.length > 0) {
            const filteredChildren = filterRecursively(comment.children);
            if (filteredChildren.length > 0) {
              comment.children = filteredChildren;
              return true;
            }
          }
          return false;
        });
      };
      return filterRecursively(this.commentList);
    },
    paginatedDanmakuList() {
      const start =
        (this.danmakuPagination.currentPage - 1) *
        this.danmakuPagination.pageSize;
      const end = start + this.danmakuPagination.pageSize;
      return this.filteredDanmakuList.slice(start, end);
    },
    filteredTopLevelComments() {
      return this.filteredCommentList.filter((comment) => !comment.parentId);
    },
  },
  watch: {
    // 监听过滤后的一级评论列表数量变化
    "filteredTopLevelComments.length"(newLength) {
      this.commentPagination.total = newLength;
      // 如果当前页没有数据了，重置到第一页
      if (
        this.commentPagination.total > 0 &&
        this.paginatedTopLevelComments.length === 0 &&
        this.commentPagination.currentPage > 1
      ) {
        this.commentPagination.currentPage = 1;
      }
    },
  },
  methods: {
    goBack() {
      if (window.history.length > 1) {
        this.$router.back();
      } else {
        this.$router.push("/dashboard");
      }
    },
    handleDanmakuPageChange(val) {
      this.danmakuPagination.currentPage = val;
    },
    handleCommentPageChange(val) {
      this.commentPagination.currentPage = val;
    },
    formatNumber(num) {
      return num >= 10000 ? (num / 10000).toFixed(1) + "w" : num;
    },
    formatPlayTime(seconds) {
      const mins = Math.floor(seconds / 60)
        .toString()
        .padStart(2, "0");
      const secs = Math.floor(seconds % 60)
        .toString()
        .padStart(2, "0");
      return `${mins}:${secs}`;
    },

    async fetchData(id) {
      try {
        const response = await getMovieDetail(id);
        const data = response.data;

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

        this.danmakuList = data.danmakuList.map((danmaku) => ({
          id: danmaku.id,
          timePoint: this.formatPlayTime(danmaku.playTime),
          content: danmaku.content,
          color: danmaku.color,
          sendTime: danmaku.createTime,
          sender: `用户:${danmaku.userId}`,
        }));

        // 定义一个辅助函数，用于递归处理评论并添加 parentId
        const processComments = (comments, parentId = null) => {
          return comments.map((comment) => {
            return {
              ...comment,
              id: comment.id,
              username: comment.userId,
              avatar: comment.avatar,
              content: comment.content,
              likes: comment.likeCount,
              date: comment.createTime,
              parentId, // 明确设置 parentId
              children: comment.children
                ? processComments(comment.children, comment.id)
                : [],
            };
          });
        };

        // 使用辅助函数处理评论列表
        this.commentList = processComments(data.commentList);

        // 设置一级评论的总数
        this.commentPagination.total = this.commentList.filter(
          (comment) => !comment.parentId
        ).length;
        this.danmakuPagination.total = data.danmakuCount;
      } catch (error) {
        console.error("获取视频详情失败:", error);
        this.$message.error("获取视频详情失败");
      }
    },

    handleDanmakuSelection(val) {
      this.selectedDanmaku = val;
    },

    async batchDeleteDanmaku() {
      if (this.selectedDanmaku.length === 0) {
        return this.$message.warning("请先选择要删除的弹幕");
      }
      this.$confirm(
        `确定要删除选中的 ${this.selectedDanmaku.length} 条弹幕吗?`,
        "提示",
        { type: "warning" }
      ).then(async () => {
        try {
          // 提取所有选中弹幕的ID
          const idsToDelete = this.selectedDanmaku.map((item) => item.id);

          // 创建一个Promise数组，对每个ID发起删除请求
          const deletePromises = idsToDelete.map((id) => removeDanmaku(id));

          // 等待所有删除请求完成
          const results = await Promise.allSettled(deletePromises);

          // 计算成功和失败的数量
          const succeeded = results.filter(
            (result) =>
              result.status === "fulfilled" && result.value.code === 200
          ).length;
          const failed = results.length - succeeded;

          if (failed === 0) {
            // 如果全部删除成功
            this.$message.success(`成功删除 ${succeeded} 条弹幕`);
          } else {
            // 如果有部分失败
            this.$message.warning(
              `批量操作完成，成功 ${succeeded} 条，失败 ${failed} 条`
            );
          }

          // 无论成功与否，都从本地列表中移除已选中的项目以更新UI
          this.danmakuList = this.danmakuList.filter(
            (item) => !idsToDelete.includes(item.id)
          );

          // 清空选中状态
          this.selectedDanmaku = [];
        } catch (error) {
          console.error("批量删除弹幕失败:", error);
          this.$message.error("批量删除请求失败，请稍后重试");
        }
      });
    },

    async handleDelete(row, type, parentId = null) {
      const text = parentId ? "子评论" : type === "danmaku" ? "弹幕" : "评论";
      this.$confirm(`确定删除这条${text}吗?`, "警告", { type: "warning" }).then(
        async () => {
          try {
            let success = false;
            if (type === "danmaku") {
              // 调用删除弹幕API
              const response = await removeDanmaku(row.id);
              success = response.code === 200; // 根据您的接口实际返回字段调整判断条件
            } else {
              // 调用删除评论API
              const response = await removeComment(row.id);
              success = response.code === 200; // 根据您的接口实际返回字段调整判断条件
            }

            if (success) {
              this.$message.success("删除成功");

              // 成功后再从本地列表中移除，保持UI同步
              if (parentId) {
                // 删除子评论的逻辑保持不变
                const parent = this.commentList.find((p) => p.id === parentId);
                if (parent) {
                  const deleteRecursive = (items) => {
                    for (let i = 0; i < items.length; i++) {
                      if (items[i].id === row.id) {
                        items.splice(i, 1);
                        return true;
                      }
                      if (items[i].children && items[i].children.length) {
                        if (deleteRecursive(items[i].children)) return true;
                      }
                    }
                    return false;
                  };
                  deleteRecursive(parent.children);
                }
              } else {
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
            } else {
              // 根据您的接口规范，此处可能需要调整错误提示方式
              this.$message.error("删除失败");
            }
          } catch (error) {
            console.error("删除失败:", error);
            this.$message.error("删除请求失败，请稍后重试");
          }
        }
      );
    },
  },
};
</script>
  
<style lang="scss" scoped>
/* ================= 全局 & 布局结构 ================= */
.app-container {
  padding: 20px;
  background-color: #f0f2f5;
  min-height: 100vh;
}

.page-navigation {
  background: #ffffff;
  padding: 16px 24px;
  margin-bottom: 20px;
  border-radius: 4px;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);

  ::v-deep .el-page-header__content {
    font-weight: 600;
    color: #303133;
  }
  ::v-deep .el-page-header__title {
    font-size: 14px;
    color: #606266;
  }
  ::v-deep .el-page-header__left:hover .el-page-header__title,
  ::v-deep .el-page-header__left:hover .el-icon-back {
    color: #409eff;
  }
}

.text-danger {
  color: #f56c6c;
  &:hover {
    color: #ff4949;
  }
}

/* ================= 视频信息卡片 ================= */
.video-header-card {
  margin-bottom: 20px;
  border: none;

  .video-thumb-wrapper {
    border-radius: 6px;
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
      font-size: 22px;
      color: #303133;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .video-tags {
      margin-top: 8px;
      .publish-time {
        font-size: 13px;
        color: #909399;
        margin-left: 10px;
      }
    }

    .data-row {
      margin-top: auto;
      text-align: center;
      .data-item {
        background: #f8f9fa;
        padding: 15px 0;
        border-radius: 6px;
        .label {
          font-size: 13px;
          color: #909399;
          margin-bottom: 8px;
        }
        .value {
          font-size: 22px;
          font-weight: bold;
          color: #409eff;
        }
      }
    }
  }
}

/* ================= 管理面板通用 ================= */
.management-card {
  border: none;
  .filter-container {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
  }
  .pagination-container {
    margin-top: 20px;
    text-align: right;
  }
}

/* ================= 评论表格区域美化 ================= */
/* 表格用户信息列 */
.user-info-cell {
  display: flex;
  align-items: center;
  .user-meta {
    margin-left: 12px;
    .username {
      font-weight: 600;
      font-size: 14px;
      color: #303133;
    }
    .id-text {
      font-size: 12px;
      color: #909399;
      margin-top: 4px;
    }
  }
}

/* 一级主评论 */
.root-comment-text {
  font-size: 14px;
  color: #303133;
  line-height: 1.6;
}

/* 递归子评论容器框 */
.sub-comment-box-recursive {
  background-color: #f8f9fa; /* 更柔和的护眼灰色 */
  border: 1px solid #ebeef5;
  border-radius: 6px;
  padding: 10px 15px;
  margin-top: 12px;
}

/* 递归组件(函数式组件)内部样式，需用 ::v-deep 穿透 */
::v-deep .sub-node {
  padding-bottom: 6px;
  &:last-child {
    padding-bottom: 0;
  }
}
::v-deep .sub-header {
  font-size: 13px;
  line-height: 1.6;
  .sub-user {
    color: #409eff;
    font-weight: bold;
    cursor: pointer;
  }
  .sub-target {
    color: #909399;
    font-size: 12px;
  }
  .sub-colon {
    color: #303133;
    font-weight: bold;
    margin: 0 4px;
  }
  .sub-content {
    color: #606266;
    word-break: break-all;
  }
}
::v-deep .sub-footer {
  margin-top: 4px;
  display: flex;
  align-items: center;
  gap: 15px; /* 时间与删除按钮间的间距 */
  .time {
    font-size: 12px;
    color: #b0b3b9;
  }
  .sub-del-btn {
    font-size: 12px;
    color: #f56c6c;
    cursor: pointer;
    transition: all 0.3s;
    &:hover {
      color: #ff4949;
      text-decoration: underline;
    }
  }
}
</style>