// 全局图片内存缓存
// key: 原始 URL，value: blob URL
const cache = new Map()
// 正在请求中的 Promise，防止同一 URL 并发重复请求
const pending = new Map()

/**
 * 获取缓存的图片 blob URL，若未缓存则 fetch 后存入
 * @param {string} url 原始图片 URL
 * @returns {Promise<string>} blob URL
 */
export function getCachedImg(url) {
  if (!url) return Promise.resolve('')
  if (cache.has(url)) return Promise.resolve(cache.get(url))
  if (pending.has(url)) return pending.get(url)

  const p = fetch(url)
    .then(res => res.blob())
    .then(blob => {
      const blobUrl = URL.createObjectURL(blob)
      cache.set(url, blobUrl)
      pending.delete(url)
      return blobUrl
    })
    .catch(() => {
      pending.delete(url)
      return url // 失败时降级返回原始 URL
    })

  pending.set(url, p)
  return p
}

/**
 * Vue 指令：v-cached-img
 * 用法：<img v-cached-img="src" /> 或 <el-image v-cached-img="src" />
 * 会将元素的 src 替换为 blob URL
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
  getCachedImg(url).then(blobUrl => {
    // 兼容 <img> 和 el-image（内部是 <img>）
    const img = el.tagName === 'IMG' ? el : el.querySelector('img')
    if (img) img.src = blobUrl
    // 同时更新 src attribute 供 el-image 内部使用
    if (el.tagName !== 'IMG') el.setAttribute('data-cached-src', blobUrl)
  })
}
