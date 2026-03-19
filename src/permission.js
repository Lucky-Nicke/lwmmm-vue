import router from './router'
import store from './store'
import { getToken } from '@/utils/auth'
import { Message } from 'element-ui'
import NProgress from 'nprogress' // 水平进度条提示: 在跳转路由时使用
import 'nprogress/nprogress.css' // 水平进度条样式
import getPageTitle from '@/utils/get-page-title' // 获取应用头部标题的函数
import Layout from '@/layout'
import ParentView from '@/components/ParentView'
const _import = require('./router/_import_' + process.env.NODE_ENV) // 获取组件的方法

NProgress.configure({ showSpinner: false }) // NProgress Configuration
const whiteList = [
  '/login',
  '/reset-password',
  '/index'
]

// 是否属于门户页面（放行）
function isWhitePath(path) {
  return whiteList.some(w => path.startsWith(w))
}

router.beforeEach(async (to, from, next) => {
  NProgress.start()
  document.title = getPageTitle(to.meta.title)

  const hasToken = getToken()

  // ✅ 第一优先：门户页面直接放行（无论有没有 token）
  if (isWhitePath(to.path)) {
    next()
    return
  }

  if (hasToken) {
    if (to.path === '/login') {
      next({ path: '/' })
      NProgress.done()
    } else {
      const hasGetUserInfo = store.getters.name

      if (hasGetUserInfo) {
        next()
      } else {
        try {
          await store.dispatch('user/getInfo')

          const menus = store.getters.menus || []

          if (menus.length > 0) {
            const accessRoutes = filterAsyncRouter(menus)
            router.addRoutes(accessRoutes)

            router.addRoutes([
              { path: '*', redirect: '/404', hidden: true }
            ])

            global.antRouter = accessRoutes

            next({ ...to, replace: true })
          } else {
            // ❗没有菜单，不要乱跳 dashboard
            next()
          }

        } catch (error) {
          console.log('getInfo error:', error)

          // ❗关键修改：不要强制踢登录
          // await store.dispatch('user/resetToken')

          // 👉 直接放行（否则你门户永远进不去）
          next()
        }
      }
    }
  } else {
    // 未登录
    next(`/login?redirect=${to.path}`)
    NProgress.done()
  }
})

router.afterEach(() => { // finish progress bar
  NProgress.done()
}) // // 遍历后台传来的路由字符串，转换为组件对象
function filterAsyncRouter(asyncRouterMap) {
  const accessedRouters = asyncRouterMap.filter(route => {
    if (route.component) {
      if (route.component === 'Layout') {
        route.component = Layout
      } else if (route.component === 'ParentView') {
        route.component = ParentView
      } else {
        try {
          route.component = _import(route.component)// 导入组件
        } catch (error) {
          console.log(error)
          route.component = _import('dashboard/index')// 导入组件
        }
      }
    }
    if (route.children && route.children.length > 0) {
      route.children = filterAsyncRouter(route.children)
    } else {
      delete route.children
    }
    return true
  })
  return accessedRouters
}