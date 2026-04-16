// 已预加载完成的 URL 集合（浏览器磁盘/内存缓存会接管后续请求）
const loaded = new Set()
// 正在加载中的 Promise，防止同一 URL 并发重复触发
const pending = new Map()

/**
 * 预加载图片，确保浏览器缓存命中后返回原始 URL
 * 不使用 fetch/blob，避免跨域 CORS 报错
 * @param {string} url
 * @returns {Promise<string>}
 */
export function getCachedImg(url) {
  if (!url) return Promise.resolve('')
  if (loaded.has(url)) return Promise.resolve(url)
  if (pending.has(url)) return pending.get(url)

  const p = new Promise((resolve) => {
    const img = new Image()
    img.onload = () => {
      loaded.add(url)
      pending.delete(url)
      resolve(url)
    }
    img.onerror = () => {
      pending.delete(url)
      resolve(url) // 加载失败也返回原始 URL，交给 el-image 的 error slot 处理
    }
    img.src = url
  })

  pending.set(url, p)
  return p
}

/**
 * Vue 指令：v-cached-img
 * 用法：<img v-cached-img="src" />
 */
export const cachedImgDirective = {
  bind(el, binding) {
    applyCache(el, binding.value)
  },
  update(el, binding) {
    if (binding.value !== binding.oldValue) {
      applyCache(el, binding.value)
    }
  }
}

function applyCache(el, url) {
  if (!url) return
  getCachedImg(url).then(resolvedUrl => {
    const img = el.tagName === 'IMG' ? el : el.querySelector('img')
    if (img) img.src = resolvedUrl
  })
}
