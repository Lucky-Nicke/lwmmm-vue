import Vue from 'vue'
import Router from 'vue-router'
import VideoDetail from '@/views/system/sysMovie/VideoDetail.vue' // 请根据您实际存放 VideoDetail.vue 的路径进行修改
import VideoPortalIndex from '@/views/videoIndex/index'


Vue.use(Router)

/* Layout */
import Layout from '@/layout'

/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'/'el-icon-x' the icon show in the sidebar
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true,
    meta: {
      title: '登录界面'
    }
  },

  {
    path: '/reset-password',
    component: () => import('@/views/login/reset'), // 确保文件名叫 reset.vue
    hidden: true,
    meta: {
      title: '修改密码'
    }
  },

  // {
  //   path: '/404',
  //   component: () => import('@/views/404'),
  //   hidden: true
  // },

  {
    path: '/index',               // 门户页面的基础路径
    component: VideoPortalIndex,  // 将此路径的组件设为 VideoPortalIndex
    name: 'VideoPortalIndex',     // 给门户首页一个名称，方便编程式导航
    // 注意：这里的 hidden 可以根据你的需求决定是否显示在侧边栏，但通常门户页不会在管理后台的侧边栏
    hidden: true,
    meta: {
      title: '视频门户',
      icon: 'guide'
    },
    // 门户内的子路由，视频详情页现在是 /index 的子路由
    children: [
      {
        path: 'video/:id', // 实际路径将是 /index/video/:id
        name: 'VideoDetail', // 命名路由方便跳转
        // 指向你的视频详情组件的实际路径
        component: () => import('@/views/videoIndex/videoInfo/videoDetail'),
        meta: {
          title: '视频详情',
          noCache: true // 详情页通常不需要缓存，确保每次访问都获取最新数据
        },
        hidden: true // 详情页本身也不应在任何侧边栏显示
      },
      {
        path: 'user-center',
        name: 'UserCenter',
        component: () => import('@/views/videoIndex/userInfo/UserCenter.vue'), // 根据你的实际路径修改
        hidden: true, // 非常重要，确保它不出现在侧边栏
        meta: {
          title: '用户中心',
          icon: 'el-icon-document',
          noCache: true,
          // 关键！当访问 /video/sysMovie/xxx 时，激活 /video/list 对应的菜单项
          activeMenu: '/user/info'
        },
      }
    ]
  },

  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [{
      path: 'dashboard',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: '影视管理系统', icon: 'dashboard' }
    }]
  },

  {
    path: '/sysUser',
    component: Layout,      // 关键：指定布局组件，这样右侧才会有框
    hidden: true,           // 整个组在左侧菜单隐藏
    redirect: '/sysUser/profile',
    children: [
      {
        path: 'profile',    // 实际访问路径是 /sysUser/profile
        name: 'SysUserProfile',
        component: () => import('@/views/system/sysUser/userInfo'),
        meta: {
          title: '个人简介',
          icon: 'user',
          noCache: true,
          // 如果你想让它高亮左侧某个菜单，可以加 activeMenu
          // activeMenu: '/dashboard' 
        }
      }
    ]
  },

  {
    path: '/video',
    component: Layout,
    hidden: true,
    // 修正 redirect，使其指向一个有效的列表页路径
    redirect: '/log/sysMovie',
    name: 'VideoManagement',
    // 移除 hidden: true，否则整个 "影视管理" 菜单都看不到了
    // hidden: true, 
    meta: { title: '数据管理', icon: 'el-icon-video-camera' },
    children: [
      // 列表页面路由
      {
        path: 'list',
        name: 'VideoList',
        component: () => import('@/views/system/sysMovie/VideoList.vue'),
        meta: { title: '视频数据', icon: 'el-icon-menu' }
      },
      // --- 详情页面路由，与 list 同级 ---
      {
        // 完整路径就是 /log/sysMovie/:id
        path: 'sysMovie/:id',
        name: 'VideoDetail',
        component: VideoDetail,
        meta: {
          title: '视频详情',
          icon: 'el-icon-document',
          noCache: true,
          // 关键！当访问 /video/sysMovie/xxx 时，激活 /video/list 对应的菜单项
          activeMenu: '/video/list'
        },
        hidden: true // 非常重要，确保它不出现在侧边栏
      }
    ]
  },

  // {
  //   path: '/system',
  //   component: Layout,
  //   redirect: '/system/sysUser',
  //   name: 'system',
  //   meta: { title: '系统管理', icon: 'el-icon-s-help' },
  //   children: [
  //     {
  //       path: 'sysRole',
  //       name: 'sysRole',
  //       component: () => import('@/views/system/sysRole/list'),
  //       meta: { title: '角色管理', icon: 'table' }
  //     },
  //     {
  //       path: 'sysUser',
  //       name: 'sysUser',
  //       component: () => import('@/views/system/sysUser/list'),
  //       meta: { title: '用户管理', icon: 'tree' }
  //     },
  //     {
  //       name: 'sysMenu',
  //       path: 'sysMenu',
  //       component: () => import('@/views/system/sysMenu/list'),
  //       meta: {
  //         title: '菜单管理',
  //         icon: 'el-icon-s-unfold'
  //       },
  //     },
  //     {
  //       path: 'assignAuth',
  //       component: () => import('@/views/system/sysRole/assignAuth'),
  //       meta: {
  //         activeMenu: '/system/sysRole',
  //         title: '角色授权'
  //       },
  //       hidden: true,
  //     },
  //   ]
  // },

  //   // 404 page must be placed at the end !!!
  //   { path: '*', redirect: '/404', hidden: true }
]

const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
