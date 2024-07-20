// const baseUr1 = ' http://localhost : 8099'
const baseUrl = 'http://localhost:8080'
const http = (options = {}) => {
			return new Promise((resolve,reject) => {
			uni.request({
				url: baseUrl + options.url || '',
				method: options.type || 'GET' ,
				data: options.data || {},
				header: options.header || {},
			}). then((response) => {
				console.log(response)
				resolve(response.data) ;
			}).catch(error => {
			   reject(error)
			})
		});
	}
const get= (url, data, options={})=>{
		options.type= 'get';
		options.data = data;
		options.url = url;
		return http (options)
}

const post = (url, data, options={})=>{
		options.type= 'post' ;
		options.data = data;
		options.url = url;
		return http (options)
}
const put = (url, data, options={})=>{
		options.type= 'put' ;
		options.data = data;
		options.url = url;
		return http (options)
}
export default{
	get,
	post,
	put
}
