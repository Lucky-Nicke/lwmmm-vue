import request from '@/utils/request'
// 定义基本的url
const BASE_URL = '/admin/system/openrecord';

export default {
    // 查询用户和分页
    getLogPageList(page, limit, searchObj) {
        return request({
            url: `${BASE_URL}/${page}/${limit}`,
            method: 'get',
            params: searchObj
        })
    },
    // 单个删除用户
    delLog(id) {
        return request({
            url: `${BASE_URL}/del/${id}`,
            method: 'post',
        })
    },
    // 批量删除用户
    batchdelLog(ids) {
        return request({
            url: `${BASE_URL}/batchdel/${ids}`,
            method: 'post',
        })
    },
}