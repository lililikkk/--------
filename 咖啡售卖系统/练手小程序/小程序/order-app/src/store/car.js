// 引入 store
import { defineStore } from 'pinia';
//通过defineStore定义store
// defineStore 第一个参数是唯一的
export const carStore = defineStore('carStore', {
	state: () => {
		return { 
			count: 0 ,
			//存储购物车数据
			carList:[]
			};
	},
	// 也可以这样定义
	// state: () => ({ count: 0 })
	actions: {
		//数量+1
		increment() {
			this.count++;
		},
		//加入购物车
		addCar(goods){
			//判断是否已经加入购物车
			const index = this.carList.findIndex(item => goods.goodsId == item.goodsId)
			if(index > -1){
				//购物车存在，删除购物车里面的数据
				this.carList.splice(index,1);
			}
			//加入购物车
			this.carList.push(goods)
		}
	},
});