import http from '../common/http.js'

//轮播图
export const getCategoryListApi = ()=>{
	return http.get("/api/category/getCategoryList")
}