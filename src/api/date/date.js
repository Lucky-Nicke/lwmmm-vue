import request from '@/utils/request'

// 定义公共的api 
const BASE_URL = '/admin/system/sysDate';

export function getUserTrendData() {
  return request({
    url: `${BASE_URL}/userTrend`,
    method: 'get'
  })
}

export function getMovieStockData() {
  return request({
    url: `${BASE_URL}/movieStock`, // 请根据你的后端路由前缀调整
    method: 'get'
  })
}

export function getMoviePlaysData() {
  return request({
    url: `${BASE_URL}/moviePlays`, // 请根据你的后端路由前缀调整
    method: 'get'
  })
}

export function getMovieDanmakuData() {
  return request({
    url: `${BASE_URL}/movieDanmaku`, // 请根据你的后端路由前缀调整
    method: 'get'
  })
}

export function getMovieDetail(id) {
  return request({
    url: `${BASE_URL}/singelMovieDetail`,
    method: 'get',
    params: { id } // 使用 params 传递 query 参数
  })
}

export function removeDanmaku(danmakuId) {
  return request({
    url: `${BASE_URL}/deleteDanmaku`,
    method: 'delete',
    params: { danmakuId } // 使用 params 传递 query 参数
  })
}

export function removeComment(commentId) {
  return request({
    url: `${BASE_URL}/deleteComment`,
    method: 'delete',
    params: { commentId } // 使用 params 传递 query 参数
  })
}