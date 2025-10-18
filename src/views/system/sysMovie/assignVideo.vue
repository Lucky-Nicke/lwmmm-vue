<template>
  <div>
    <!-- 定义播放器dom -->
    <div id="J_prismPlayer"></div>
  </div>
</template>

<script>
import api from "@/api/movie/movie.js";

export default {
  data() {
    return {
      playInfo: {
        image: "",
        playId: "",
        playAuth: "",
      },
    };
  },
  created() {
    this.fetchData();
  },
  methods: {
    fetchData() {
      const id = this.$route.query.id;
      // alert(id);
      api.getPlayAuthById(id).then((response) => {
        console.log(response);
        this.playInfo.image = response.data.image;
        this.playInfo.playId = response.data.playId;
        this.playInfo.playAuth = response.data.playAuth;

        // new Aliplayer({
        //     id: "J_prismPlayer",
        //     width: "100%",
        //     height: "500px",
        //     // 播放方式二：加密视频的播放：首先获取播放凭证
        //     //  encryptType: '1', // 如果播放加密视频，则需设置encryptType=1，非加密视频无需设置此项
        //     vid: this.playInfo.playId,
        //     playauth: this.playInfo.playAuth,
        //   },
        //   function (player) {
        //     console.log("播放器创建成功");
        //   }
        // );

        let player = new Aliplayer(
          {
            id: "J_prismPlayer",
            width: "100%",
            height: "500px",
            autoplay: false,
            controlBarVisibility: "hover",
            isLive: false,
            cover: this.playInfo.image, //图片
            vid: this.playInfo.playId, //视频id
            playauth: this.playInfo.playAuth, //视频播放秘钥
            encryptType: 1, //是否加密播放
            license: {
              // 使用在准备工作中获取到的网站域名domain和License Key
              domain: "lucky-nicke-movie.oss-cn-shenzhen.aliyuncs.com", // 申请 License 时填写的域名
              key: "xPfu7NfoGscF2Fycvf1255184446947d1afdf46e27fef31bc", // 申请成功后，在控制台可以看到 License Key
            },
          },
          function (player) {
            console.log("播放器创建好了。");
          }
        );
      });
    },
  },
  mounted() {
    console.log(this.playInfo.playId);
    console.log(this.playInfo.playAuth);
  },
};
</script>
