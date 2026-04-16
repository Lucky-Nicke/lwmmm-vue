<template>
  <el-image v-bind="$attrs" :src="cachedSrc" v-on="$listeners">
    <slot v-for="(_, name) in $slots" :name="name" :slot="name" />
    <div slot="error" style="width:100%;height:100%;background:#f5f7fa"></div>
    <div slot="placeholder" style="width:100%;height:100%;background:#f5f7fa"></div>
  </el-image>
</template>

<script>
import { getCachedImg } from '@/utils/imgCache'

export default {
  name: 'CachedImage',
  inheritAttrs: false,
  props: {
    src: { type: String, default: '' }
  },
  data() {
    return { cachedSrc: '' }
  },
  watch: {
    src: {
      immediate: true,
      handler(val) {
        if (!val) { this.cachedSrc = ''; return }
        getCachedImg(val).then(url => { this.cachedSrc = url })
      }
    }
  }
}
</script>
