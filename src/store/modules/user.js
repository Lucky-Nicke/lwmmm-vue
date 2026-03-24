import { login, logout, getInfo } from '@/api/user'
import { getToken, setToken, removeToken } from '@/utils/auth'
import { resetRouter } from '@/router'

const getDefaultState = () => {
  return {
    token: getToken(),
    name: '',
    avatar: '',

    buttons: [],
    menus: ''
  }
}

const state = getDefaultState()

const mutations = {
  RESET_STATE: (state) => {
    Object.assign(state, getDefaultState())
  },
  SET_TOKEN: (state, token) => {
    state.token = token
  },
  SET_NAME: (state, name) => {
    state.name = name
  },
  SET_AVATAR: (state, avatar) => {
    state.avatar = avatar
  },
  SET_BUTTONS: (state, buttons) => {
    state.buttons = buttons
  },
  // 新增
  SET_MENUS: (state, menus) => {
    state.menus = menus
  }
}

const actions = {
  // user login
  login({ commit }, userInfo) {
    const { username, password } = userInfo
    return new Promise((resolve, reject) => {
      login({ username: username.trim(), password: password }).then(response => {
        const { data } = response
        commit('SET_TOKEN', data.token)
        setToken(data.token)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  getInfo({ commit, state }) {
    return new Promise((resolve, reject) => {
      // 确保 state.name 或从本地存储获取的用户名是正确的
      const username = state.name || localStorage.getItem('username');

      getInfo(username).then(response => {
        // 注意：这里要看你的拦截器封装。
        // 如果你的 axios 拦截器直接返回了 res.data，那么 response 就是内容
        // 如果没有拦截器处理，response 才是 axios 的原始对象
        const { data } = response
        if (!data) {
          return reject('验证失败，请重新登录。')
        }
        // 建议打印一下看看结构，确认 keys 是否一致
        console.log('User info data:', data)
        const { name, avatar, buttons, routers } = data
        commit('SET_NAME', name)
        commit('SET_AVATAR', avatar)
        commit("SET_BUTTONS", buttons)
        commit("SET_MENUS", routers)
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },

  // user logout
  logout({ commit, state }) {
    return new Promise((resolve, reject) => {
      logout(state.token).then(() => {
        removeToken() // must remove  token  first
        resetRouter()
        commit('RESET_STATE')
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // remove token
  resetToken({ commit }) {
    return new Promise(resolve => {
      removeToken() // must remove  token  first
      commit('RESET_STATE')
      resolve()
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}

