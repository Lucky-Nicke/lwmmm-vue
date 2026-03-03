import request from '@/utils/request'

// 定义公共的api 
const BASE_URL = '/admin/system/sysDate';

export default {
  getUserTrendData() {
    return request({
      url: `${BASE_URL}/userTrend`,
      method: 'get'
    })
  }
}