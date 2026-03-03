<template>
  <div class="dashboard-container">
    <div class="datav-header">
      <div class="header-title">全域数据监控指挥中心</div>
      <div class="header-decoration"></div>
      <div class="header-time">{{ currentTime }}</div>
    </div>

    <el-row :gutter="20" class="panel-group">
      <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
        <div class="card-panel" @click="handleSetLineChartData('users')">
          <div class="card-panel-icon-wrapper icon-people">
            <i class="el-icon-user-solid card-panel-icon" />
          </div>
          <div class="card-panel-description">
            <div class="card-panel-text">总用户数</div>
            <span v-if="loadingTotalUserCount">--</span>
            <count-to
              :start-val="0"
              :end-val="totalUserCount"
              :duration="5000"
              class="card-panel-num"
            />
          </div>
          <div class="card-corner corner-tl"></div>
          <div class="card-corner corner-tr"></div>
          <div class="card-corner corner-bl"></div>
          <div class="card-corner corner-br"></div>
        </div>
      </el-col>

      <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
        <div class="card-panel" @click="handleSetLineChartData('movies')">
          <div class="card-panel-icon-wrapper icon-message">
            <i class="el-icon-video-camera-solid card-panel-icon" />
          </div>
          <div class="card-panel-description">
            <div class="card-panel-text">影视库存</div>
            <count-to
              :start-val="0"
              :end-val="8121"
              :duration="3000"
              class="card-panel-num"
            />
          </div>
          <div class="card-corner corner-tl"></div>
          <div class="card-corner corner-br"></div>
        </div>
      </el-col>

      <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
        <div class="card-panel" @click="handleSetLineChartData('plays')">
          <div class="card-panel-icon-wrapper icon-money">
            <i class="el-icon-data-line card-panel-icon" />
          </div>
          <div class="card-panel-description">
            <div class="card-panel-text">今日播放</div>
            <count-to
              :start-val="0"
              :end-val="9280"
              :duration="3200"
              class="card-panel-num"
            />
          </div>
          <div class="card-corner corner-tl"></div>
          <div class="card-corner corner-br"></div>
        </div>
      </el-col>

      <el-col :xs="12" :sm="12" :lg="6" class="card-panel-col">
        <div class="card-panel" @click="handleSetLineChartData('danmaku')">
          <div class="card-panel-icon-wrapper icon-danmaku">
            <i class="el-icon-chat-dot-square card-panel-icon" />
          </div>
          <div class="card-panel-description">
            <div class="card-panel-text">总弹幕数</div>
            <count-to
              :start-val="0"
              :end-val="13600"
              :duration="3600"
              class="card-panel-num"
            />
          </div>
          <div class="card-corner corner-tl"></div>
          <div class="card-corner corner-br"></div>
        </div>
      </el-col>
    </el-row>

    <el-row class="chart-wrapper">
      <div id="mainChart" style="width: 100%; height: 350px"></div>
    </el-row>

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="12">
        <el-card class="box-card tech-card">
          <div slot="header" class="clearfix">
            <span class="tech-header-text">🔥 热门影视热度监控</span>
          </div>
          <el-table :data="hotMovies" style="width: 100%" class="tech-table">
            <el-table-column type="index" width="50">
              <template slot-scope="scope"
                ><span class="tech-index">{{
                  scope.$index + 1
                }}</span></template
              >
            </el-table-column>
            <el-table-column prop="name" label="片名"></el-table-column>
            <el-table-column prop="category" label="分类" width="100">
              <template slot-scope="scope">
                <span class="tech-tag">{{ scope.row.category }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="views" label="实时热度" width="120">
              <template slot-scope="scope">
                <span class="tech-num">{{ scope.row.views }}</span>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>

      <el-col :xs="24" :sm="24" :lg="12">
        <el-card class="box-card tech-card">
          <div slot="header" class="clearfix">
            <span class="tech-header-text">💬 弹幕实时流</span>
          </div>
          <div class="comment-list">
            <div
              v-for="(item, index) in comments"
              :key="index"
              class="comment-item"
            >
              <div class="avatar-tech">{{ item.user[0] }}</div>
              <div class="content">
                <div class="user-info">
                  <span class="username">{{ item.user }}</span>
                  <span class="time">{{ item.time }}</span>
                </div>
                <div class="text">
                  Watching
                  <span class="highlight-movie">《{{ item.movie }}》</span> :
                  {{ item.content }}
                </div>
              </div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import * as echarts from "echarts";
import CountTo from "vue-count-to";
import date from "@/api/date/date.js";
// 模拟4种不同类型的图表数据
const lineChartData = {
  users: {
    actualData: [120, 82, 91, 154, 162, 140, 145],
    title: "用户人数趋势 (User Trend)",
  },
  movies: {
    actualData: [180, 160, 151, 106, 145, 150, 130],
    title: "影视数量趋势 (Movie Stock)",
  },
  plays: {
    actualData: [120, 90, 100, 138, 142, 130, 130],
    title: "实时播放趋势 (Real-time Plays)",
  },
  danmaku: {
    actualData: [120, 82, 91, 154, 162, 140, 130],
    title: "弹幕互动趋势 (Danmaku Activity)",
  },
};

export default {
  name: "DashboardTech",
  components: {
    CountTo,
  },
  data() {
    return {
      chart: null,
      currentTime: "",
      loadingTotalUserCount: true,
      timer: null,
      // 默认显示 'users' 的数据
      // currentChartData: lineChartData.users,
      hotMovies: [
        { name: "流浪地球2", category: "科幻", views: "98,201" },
        { name: "狂飙", category: "剧情", views: "87,110" },
        { name: "奥本海默", category: "传记", views: "65,400" },
        { name: "铃芽之旅", category: "动画", views: "54,221" },
        { name: "黑客帝国", category: "科幻", views: "41,000" },
      ],
      comments: [
        {
          user: "Admin",
          color: "#409EFF",
          time: "刚刚",
          movie: "123流浪地球2",
          content: "特效炸裂，强烈推荐！",
        },
        {
          user: "User007",
          color: "#67C23A",
          time: "1s ago",
          movie: "狂飙",
          content: "高启强演技太好了吧。",
        },
        {
          user: "MovieFan",
          color: "#E6A23C",
          time: "5s ago",
          movie: "奥本海默",
          content: "诺兰出品，必属精品。",
        },
        {
          user: "Guest",
          color: "#F56C6C",
          time: "10s ago",
          movie: "泰坦尼克号",
          content: "经典永不过时。",
        },
      ],
    };
  },
  computed: {
    ...mapGetters(["name"]),
  },
  mounted() {
    this.loadInitialChartData();
    this.startClock();
    window.addEventListener("resize", this.resizeChart);
  },
  beforeDestroy() {
    window.removeEventListener("resize", this.resizeChart);
    if (this.chart) this.chart.dispose();
    if (this.timer) clearInterval(this.timer);
  },
  methods: {
    async loadInitialChartData() {
      try {
        this.loadingTotalUserCount = true;

        // 1. 先获取初始数据
        const response = await date.getUserTrendData();
        const initialData = response.data.actualData;
        const initialTotalCount = response.data.totalUserCount;

        // 设置初始总用户数
        this.totalUserCount = initialTotalCount;

        // 2. 然后再初始化图表，使用真实数据
        this.initChart(initialData);
      } catch (error) {
        console.error("获取初始用户趋势数据失败:", error);
        // 如果请求失败，可以初始化一个空图表或显示错误信息
        this.initChart([]); // 传入空数组初始化一个空图
        this.$message.error("获取用户数据失败");
      } finally {
        // 请求结束后，无论成功与否，都取消加载状态
        this.loadingTotalUserCount = false;
      }
    },

    startClock() {
      this.timer = setInterval(() => {
        const date = new Date();
        this.currentTime = date.toLocaleString();
      }, 1000);
    },
    resizeChart() {
      if (this.chart) this.chart.resize();
    },
    // 核心交互逻辑：接收类型，切换数据
    async handleSetLineChartData(type) {
      // 如果点击的是 'users'，则发起网络请求获取真实数据
      if (type === "users") {
        try {
          // 请求真实数据
          const response = await date.getUserTrendData();
          const realData = response.data.actualData; // 假设 response 结构为 { code: 200, data: [...] }

          if (response.code === 200) {
            const realData = response.data.actualData;
            const realTotalCount = response.data.totalUserCount;

            // 1. 更新总用户数
            this.totalUserCount = realTotalCount;

            // 2. 更新图表数据
            this.chart.setOption({
              title: {
                text: lineChartData.users.title,
              },
              series: [{ data: realData }],
            });
          } else {
            console.error("获取用户趋势数据失败:", response.message);
          }
        } catch (error) {
          console.error("获取用户趋势数据失败:", error);
          // 此处可以添加用户友好的错误提示
          this.$message.error("获取用户数据失败");
        }
      } else {
        // 其他类型（movies, plays, danmaku）仍使用模拟数据
        this.currentChartData = lineChartData[type];
        this.chart.setOption({
          title: {
            text: this.currentChartData.title,
          },
          series: [{ data: this.currentChartData.actualData }],
        });
      }
    },
    initChart(chartDataArray) {
      this.chart = echarts.init(document.getElementById("mainChart"));
      // 将数据传给 setChartOption
      this.setChartOption({
        ...lineChartData.users,
        actualData: chartDataArray,
      });
    },
    // 将配置项提取出来，方便初始化
    setChartOption(chartData) {
      // 生成最新的日期标签
      const dateLabels = generateLastSevenDaysLabels();

      const option = {
        backgroundColor: "transparent",
        title: {
          text: chartData.title,
          left: "center",
          textStyle: {
            color: "#00f2fe",
            fontSize: 18,
            fontFamily: "monospace",
          },
        },
        tooltip: {
          trigger: "axis",
          backgroundColor: "rgba(0,0,0,0.7)",
          borderColor: "#00f2fe",
          textStyle: { color: "#fff" },
          axisPointer: { type: "cross", label: { backgroundColor: "#6a7985" } },
        },
        legend: {
          data: ["实际"],
          bottom: 0,
          textStyle: { color: "#ccc" },
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "10%",
          top: "15%",
          containLabel: true,
          borderColor: "#1f2d4d",
        },
        xAxis: [
          {
            type: "category",
            boundaryGap: false,
            data: dateLabels,
            axisLine: { lineStyle: { color: "#00f2fe" } },
            axisLabel: { color: "#8eb8ff" },
          },
        ],
        yAxis: [
          {
            type: "value",
            splitLine: { lineStyle: { color: "rgba(255,255,255,0.1)" } },
            axisLabel: { color: "#8eb8ff" },
          },
        ],
        series: [
          {
            name: "实际",
            type: "line",
            smooth: true,
            symbol: "circle",
            symbolSize: 8,
            itemStyle: {
              color: "#4facfe",
              shadowBlur: 10,
              shadowColor: "#4facfe",
            },
            lineStyle: { width: 2, shadowBlur: 10, shadowColor: "#4facfe" },
            areaStyle: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                { offset: 0, color: "rgba(79, 172, 254, 0.4)" },
                { offset: 1, color: "rgba(79, 172, 254, 0.01)" },
              ]),
            },
            data: chartData.actualData,
          },
        ],
      };
      this.chart.setOption(option);
    },
  },
};

function generateLastSevenDaysLabels() {
  const labels = [];
  for (let i = 6; i >= 0; i--) {
    const date = new Date();
    date.setDate(date.getDate() - i);
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    labels.push(`${month}-${day}`);
  }
  return labels;
}
</script>

<style lang="scss" scoped>
/* 定义变量 - 赛博朋克色系 */
$bg-color: #0b0f19;
$panel-bg: rgba(20, 30, 60, 0.6);
$primary-color: #00f2fe; // 青色
$secondary-color: #4facfe; // 蓝色
$purple-color: #b527ff; // 新增紫色，用于弹幕
$text-color: #e0e0e0;
$border-color: rgba(79, 172, 254, 0.3);

.dashboard-container {
  padding: 20px 32px;
  // 深空背景图，这里用渐变模拟，你可以换成星空图片
  background: radial-gradient(ellipse at center, #1b2735 0%, #090a0f 100%);
  min-height: 100vh;
  color: $text-color;
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB",
    "Microsoft YaHei", Arial, sans-serif;
}

/* 顶部标题栏 */
.datav-header {
  text-align: center;
  margin-bottom: 30px;
  position: relative;
  height: 60px;

  .header-title {
    font-size: 32px;
    font-weight: bold;
    color: $primary-color;
    letter-spacing: 4px;
    text-shadow: 0 0 10px rgba(0, 242, 254, 0.5);
    background: linear-gradient(to bottom, #fff, $primary-color);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .header-decoration {
    width: 100%;
    height: 2px;
    background: linear-gradient(
      90deg,
      transparent,
      $primary-color,
      transparent
    );
    margin-top: 10px;
  }

  .header-time {
    position: absolute;
    right: 20px;
    top: 10px;
    color: $secondary-color;
    font-family: "Courier New", Courier, monospace;
    font-weight: bold;
  }
}

.panel-group {
  margin-top: 18px;
  .card-panel {
    &:hover {
    }
  }
}

// 顶部卡片样式
.panel-group {
  margin-top: 18px;
  .card-panel-col {
    margin-bottom: 32px;
  }
  .card-panel {
    height: 108px;
    cursor: pointer;
    font-size: 12px;
    position: relative;
    overflow: hidden;
    color: #666;
    background: $panel-bg; // 半透明背景
    border: 1px solid $border-color;
    box-shadow: 0 0 15px rgba(0, 242, 254, 0.1) inset; // 内发光
    border-radius: 4px;

    // 四角装饰
    .card-corner {
      position: absolute;
      width: 10px;
      height: 10px;
      border: 2px solid $primary-color;
      transition: all 0.3s;
    }
    .corner-tl {
      top: 0;
      left: 0;
      border-right: none;
      border-bottom: none;
    }
    .corner-tr {
      top: 0;
      right: 0;
      border-left: none;
      border-bottom: none;
    }
    .corner-bl {
      bottom: 0;
      left: 0;
      border-right: none;
      border-top: none;
    }
    .corner-br {
      bottom: 0;
      right: 0;
      border-left: none;
      border-top: none;
    }

    &:hover {
      box-shadow: 0 0 25px rgba(0, 242, 254, 0.3) inset;
      .card-panel-icon-wrapper {
        color: #fff;
      }
      .icon-people {
        background: $primary-color;
        box-shadow: 0 0 10px $primary-color;
      }
      .icon-message {
        background: $secondary-color;
        box-shadow: 0 0 10px $secondary-color;
      }
      .icon-money {
        background: #f4516c;
        box-shadow: 0 0 10px #f4516c;
      }
      .icon-shopping {
        background: #34bfa3;
        box-shadow: 0 0 10px #34bfa3;
      }
      .icon-danmaku {
        background: $purple-color; // 弹幕图标悬停背景色
        box-shadow: 0 0 10px $purple-color;
      }
    }

    .icon-people {
      color: $primary-color;
    }
    .icon-message {
      color: $secondary-color;
    }
    .icon-money {
      color: #f4516c;
    }
    .icon-shopping {
      color: #34bfa3;
    }
    .icon-danmaku {
      color: $purple-color;
    } // 弹幕图标默认颜色

    .card-panel-icon-wrapper {
      float: left;
      margin: 14px 0 0 14px;
      padding: 16px;
      transition: all 0.38s ease-out;
      border-radius: 6px;
      background: rgba(255, 255, 255, 0.05); // 微弱背景
    }

    .card-panel-icon {
      float: left;
      font-size: 48px;
    }

    .card-panel-description {
      float: right;
      font-weight: bold;
      margin: 26px;
      margin-left: 0px;

      .card-panel-text {
        line-height: 18px;
        color: rgba(255, 255, 255, 0.6); // 文字变浅色
        font-size: 16px;
        margin-bottom: 12px;
      }

      .card-panel-num {
        font-size: 24px;
        color: #fff;
        font-family: "Arial", sans-serif;
        text-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
      }
    }
  }
}

// 图表区域
.chart-wrapper {
  background: $panel-bg;
  padding: 16px 16px 0;
  margin-bottom: 32px;
  border: 1px solid $border-color;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  position: relative;

  &::before {
    // 顶部扫描线装饰
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 2px;
    background: linear-gradient(
      90deg,
      transparent,
      $primary-color,
      transparent
    );
  }
}

// 底部卡片通用
.tech-card {
  background: $panel-bg;
  border: 1px solid $border-color;
  color: #fff;
  margin-bottom: 20px;

  ::v-deep .el-card__header {
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  }

  ::v-deep .el-card__body {
    background-color: transparent;
  }

  .tech-header-text {
    font-size: 16px;
    font-weight: bold;
    color: $primary-color;
    padding-left: 10px;
    border-left: 4px solid $primary-color;
  }
}

// 表格覆盖样式 - 核心难点
.tech-table {
  background-color: transparent !important;
  color: #fff;

  ::v-deep tr,
  ::v-deep th,
  ::v-deep td {
    background-color: transparent !important;
    border-bottom: 1px solid rgba(255, 255, 255, 0.05) !important;
    color: #ccc;
  }

  ::v-deep th {
    color: $primary-color;
  }

  ::v-deep .el-table__row:hover > td {
    background-color: rgba(0, 242, 254, 0.1) !important; // hover效果
  }

  // 去掉表格两侧和底部的白线
  ::v-deep &.el-table::before {
    height: 0;
  }

  .tech-index {
    display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 20px;
    background: rgba(255, 255, 255, 0.1);
    text-align: center;
    border-radius: 2px;
  }

  .tech-tag {
    color: $secondary-color;
    border: 1px solid $secondary-color;
    padding: 2px 5px;
    border-radius: 4px;
    font-size: 12px;
  }

  .tech-num {
    color: #f56c6c;
    font-family: monospace;
    font-weight: bold;
  }
}

// 底部评论列表样式
.comment-list {
  max-height: 300px;
  overflow-y: auto;

  // 隐藏滚动条但保留功能
  &::-webkit-scrollbar {
    width: 4px;
    background: transparent;
  }
  &::-webkit-scrollbar-thumb {
    background: rgba(0, 242, 254, 0.3);
    border-radius: 2px;
  }

  .comment-item {
    display: flex;
    align-items: center;
    padding: 12px 0;
    border-bottom: 1px dashed rgba(255, 255, 255, 0.1);

    &:last-child {
      border-bottom: none;
    }

    .avatar-tech {
      width: 40px;
      height: 40px;
      line-height: 40px;
      text-align: center;
      background: rgba(0, 0, 0, 0.3);
      border: 1px solid $primary-color;
      color: $primary-color;
      border-radius: 50%;
      margin-right: 15px;
      font-weight: bold;
      box-shadow: 0 0 5px $primary-color;
    }

    .content {
      flex: 1;
      .user-info {
        font-size: 12px;
        color: #888;
        margin-bottom: 5px;
        display: flex;
        justify-content: space-between;

        .username {
          color: $secondary-color;
          font-weight: bold;
        }
        .time {
          color: #666;
        }
      }
      .text {
        font-size: 14px;
        color: #bbb;
        line-height: 1.4;

        .highlight-movie {
          color: #e6a23c;
          font-weight: bold;
        }
      }
    }
  }
}
</style>