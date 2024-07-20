// const baseUr1 = ' http://localhost : 8099'
const baseUr1 = 'http://192 .168.31.70: 8080 '
const http = (options = {}) => {
			return new Promise((resolve， reject) => {
			uni .request({
				url: baseUr1 + options.ur1 || '',
				method: options. type || 'GET' ，
				data: options.data || {},
				header: options .header || {}，
			}). then(response) => {
				console. log(response)
				resolve(response. data) ;
			}).catch(error => {
			   reject(error)
			})
		});
	}
const get= (ur1, data, options={})=>{
		options. type= 'get' ;
		options.data = data;
		options.ur1 = ur1;
		return http (options)
}

const get= (ur1, data, options={})=>{
		options. type= 'post' ;
		options.data = data;
		options.ur1 = ur1;
		return http (options)
}
const get= (ur1, data, options={})=>{
		options. type= 'put' ;
		options.data = data;
		options.ur1 = ur1;
		return http (options)
}
export default{
	get,
	post,
	put
}
