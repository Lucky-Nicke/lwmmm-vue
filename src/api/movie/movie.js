import request from '@/utils/request'

// 定义公共的api 
const BASE_URL = '/admin/system/sysMovie';


export default {
  // 当前 页码  每页条数   搜索条件
  getMoviePageInfo(page, limit, searchObj) {
    return request({
      url: `${BASE_URL}/${page}/${limit}`,
      method: 'get',
      params: searchObj
    })
  },
  // 根据id移除一个movie
  removeMovieById(id) {
    return request({
      url: `${BASE_URL}/removeMovie/${id}`,
      method: 'delete'
    })
  },
  // 添加影视
  addMovie(movie) {
    console.log(movie);
    return request({
      url: `${BASE_URL}/addMovie`,
      method: 'post',
      data: movie
    })
  },
  // 更新影视
  updateMovie(movie) {
    return request({
      url: `${BASE_URL}/updateMovie`,
      method: 'post',
      data: movie
    })
  },
  // 根据id获取一个movie
  getMovieById(id) {
    return request({
      url: `${BASE_URL}/findMovieById/${id}`,
      method: 'get'
    })
  },
  // 根据id获取palyAuth播放凭证
  getPlayAuthById(id) {
    return request({
      url: `${BASE_URL}/getPlayAuth/${id}`,
      method: 'get'
    })
  },
  // 返回全部视频信息
  getAllVideoInfo() {
    return request({
      url: `${BASE_URL}/getAllVideoInfo`,
      method: 'post'
    })
  },
  // 返回推荐视频信息
  getHotVideoInfo() {
    return request({
      url: `${BASE_URL}/getHotVideoInfo`,
      method: 'post'
    })
  },
  // 返回排行榜视频信息
  getHotWatchVideoInfo() {
    return request({
      url: `${BASE_URL}/getHotWatchVideoInfo`,
      method: 'post'
    })
  },
  // 发送弹幕
  sendDanMu(danmu) {
    return request({
      url: `${BASE_URL}/sendDanMu`,
      method: 'post',
      data: danmu
    })
  },
  // 返回排行榜视频信息
  sendLike(like) {
    return request({
      url: `${BASE_URL}/sendLike`,
      method: 'post',
      data: like
    })
  },
  // 返回排行榜视频信息
  sendComment(comment) {
    return request({
      url: `${BASE_URL}/sendComment`,
      method: 'post',
      data: comment
    })
  },
  // 播放量+1
  recordVideoPV(data) {
    return request({
      url: `${BASE_URL}/recordVideoPV`,
      method: 'post',
      data: data
    })
  },

  // 投稿视频
  userUploadVideo(data) {
    return request({
      url: `${BASE_URL}/userUploadVideo`,
      method: 'post',
      data: data
    })
  },

  // 获取投稿视频
  showApproveRecord() {
    return request({
      url: `${BASE_URL}/showApproveRecord`,
      method: 'post'
    })
  }
}