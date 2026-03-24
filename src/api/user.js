import request from '@/utils/request'

export function login(data) {
  return request({
    url: '/admin/system/index/login',
    method: 'post',
    data
  })
}

export function getInfo(username) {
  return request({
    url: '/admin/system/index/info',
    method: 'get',
    params: { username }
  })
}

export function getLessInfo(userId) {
  return request({
    url: `/admin/system/sysUser/info/${userId}`,
    method: 'get'
  })
}

export function logout() {
  return request({
    url: '/admin/system/index/logout',
    method: 'post'
  })
}

export function resetPassword(data) {
  return request({
    url: '/admin/system/index/changePwd',
    method: 'post',
    data
  })
}

export function registerUser(data) {
  return request({
    url: '/admin/system/sysUser/registerUser',
    method: 'post',
    data
  })
}
