const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  name: state => state.user.name,
  buttons: state => state.user.buttons,
  menus: state => state.user.menus,
  asyncRoutes: state => state.user.asyncRoutes
}
export default getters
