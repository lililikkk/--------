<template>
	<view style="padding-bottom: 60px;"  v-if="goods.length > 0">
		<view class="goods-info" v-for="(item,index) in goods" :key="index">
			<view class="info-left">
				<view class="goods-left">
					<checkbox-group @change="selected($event,item)">
						<label>
							<checkbox :checked="item.flag" />
						</label>
					</checkbox-group>
					<image style="width: 150rpx; height: 140rpx; margin-left:10px;"  :src="item.goodsImage"></image>
				</view>
				<view class="size">
					<text style="font-size: 25rpx;">名称: {{item.goodsName}}</text>
					<text style="font-size: 25rpx;">规格: {{item.specsName}}</text>
					<text  class="goods-price">价格: {{item.price}}</text>
				</view>
			</view>
			<view class="info-right">
				<text @click="reduce(item)" class="subtract"> - </text>
				<text class="num">{{item.num}}</text>
				<text @click="add(item)" class="add"> + </text>
			</view>	
		</view>
	</view>
	<view class="end">
		<view class="end-left">
			<checkbox-group @change="selectAlls">
				<label>
					<checkbox :checked="allchecked" />全选
				</label>
			</checkbox-group> 
			<view >
				总计: <text style="color: #f00; font-weight: bold; ">${{totalPrice}}</text>
			</view>
		</view>
		<view class="end-right">
			结算({{totalNum}})
		</view>
	</view>
	<view class="">
		<view class="">
			{{store.count}}
		</view>
		<view class="" @click="store.increment">
			新增
		</view>
	</view>
</template>

<script setup>

import { computed, reactive, ref } from 'vue';
import {carStore} from '../../store/car.js'
	
	//获取store
	const store = carStore() 
	
	const show = ref(true);
	const allchecked = ref(true);
	const checked = ref(true);
	
	//购物车数据
	const goods = computed(()=>{
		return store.carList
	})
	/* const goods = reactive([
		{
			flag: true,
			goodsName:"cc",
			goodsId:1,
			num:1,
			specsName:'中',
			price:11,
			goodsImage:"/static/test1.png",
		},
		{
			flag: true,
			goodsName:"cc",
			goodsId:1,
			num:1,
			specsName:'中',
			price:11,
			goodsImage:"/static/test1.png",
		}
	]) */
	
	//复选框点击事件
	const selected = (e , item)=>{
		console.log(e)
		console.log(item)
		if(item.flag == true){
			item.flag = false;
		}else{
			item.flag = true;
		}
		//全选的设置
		let newArr = store.carList.filter(item =>(item.flag == true))  //找出选中的数据
		
		if(newArr.length == store.carList.length){  //说明全部选中	
			allchecked.value = true;			
		}else{
			allchecked.value = false;
		}
	}
	
	//全选点击事件
	const selectAlls = ()=>{
		if(allchecked.value == true){
			allchecked.value = false;
			store.carList.forEach(item=>{   //循环每一项 然后选中
				item.flag = false;
			})
		}else{
			allchecked.value = true;
			store.carList.forEach(item=>{
				item.flag = true;
			})
		}
	}
	
	//购物车减号
	const reduce = (item)=>{
		let num = item.num;
		if(num > 1){
			num -= 1;
		}else if(num = 1){
			uni.showToast({
				title:"数量不能少于1!"
			})
		}
		item.num = num;
	}
	
	const add = (item)=>{
		let num = item.num;
		item.num = num + 1;
	} 
	
	//总数
	const totalNum = computed(()=>{  //computed 计算属性
		let totalNum = 0;
		store.carList.map(item =>{
			item.flag ? totalNum += item.num : totalNum += 0;  //如果flag为true，则加起来，否则不加
		})
		return totalNum
	})
	
	//总价
	const totalPrice = computed(()=>{
		let totalPrice = 0;
		store.carList.map(item =>{
			item.flag ? totalPrice += item.num*item.price : totalPrice += 0;  //如果flag为true，则加起来，否则不加
		})
		return totalPrice
	})
</script>

<style lang="scss">
	.goods-info {
		display: flex;
		padding: 30px 15px 30px 30px;
		background-color: #fff;
		justify-content: space-between;
		border-bottom: 5px solid #f1f1f1;
		align-items: center;

		.info-left {
			display: flex;

			.goods-left {
				display: flex;
				align-items: center;
			}
			.size { 
				display: flex;
				flex-direction: column;
				justify-content: space-around;
				margin-left: 30px;
				
				.goods-price {
					font-size: 25rpx;
					color: #F44545;
				}
			}
		}

		.info-right {
			text {
				width: 50rpx;
				line-height: 50rpx;
				text-align: center;
				display: inline-block;
				background-color: #f7f7f7;
				margin-right: 10px;
			}
			.add {
				color: #fa4305;
				border-radius: 10rpx 30rpx 30rpx 10rpx;
				margin-right: 20rpx;
			}
			.subtract {
				border-radius: 30rpx 10rpx 10rpx 30rpx;
			}
		}
	}
	
	.end {
		width: 100%;
		height: 90rpx;
		background-color: #fff;
		position: fixed;
		bottom: 0;
		left: 0;
		display: flex;
		align-items: center;
		
		.end-left {
			width: 70%;
			display: flex;
			justify-content: space-between;
			padding: 0 30rpx;
		}
		
		.end-right {
			width: 30%;
			line-height: 90rpx;
			background-color: #f44545;
			text-align: center;
			color: #fff;
		}
	}
</style>