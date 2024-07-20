<template>
	<u-swiper name='avatar' border-radius='1' :duration="duration" :interval="inteerval" :height="height"
		:list="swiperList"></u-swiper>
	<u-divider margin-top="20" font-size="50" color="#F3AF28">热门推荐</u-divider>
	<view class="wrap">
		<u-waterfall v-model="flowList" ref="uWaterfall1">
			<template v-slot:left="{leftList}">
				<view class="demo-warter" v-for="(item, index) in leftList" :key="index">
					<!-- 警告：微信小程序中需要hx2.8.11版本才支持在template中结合其他组件，比如下方的lazy-load组件 -->
					<u-lazy-load @click="toinfo(item)" threshold="-450" border-radius="10" :image="item.avatar" :index="index"></u-lazy-load>
					<view class="demo-title">
						{{item.name}}
					</view>
					<view class="price-item">
						<view class="demo-price">
							{{item.price}}元
						</view>
						<view class="demo-title">
							/份
						</view>
						<image @click="toinfo(item)" class="carimg" :src="carimg"></image>
					</view>
				</view>
			</template>
			<template v-slot:right="{rightList}">
				<view class="demo-warter" v-for="(item, index) in rightList" :key="index">
					<u-lazy-load @click="toinfo(item)" threshold="-450" border-radius="10" :image="item.avatar" :index="index"></u-lazy-load>
					<view class="demo-title">
						{{item.name}}
					</view>
					<view class="price-item">
						<view class="demo-price">
							{{item.price}}元
						</view>
						<view class="demo-title">
							/份
						</view>
						<image @click="toinfo(item)" class="carimg" :src="carimg"></image>
					</view>
				</view>
			</template>
		</u-waterfall>
	</view>
</template>

<script setup>
	import {getSwipperListApi , getHotListApi} from '../../api/index.js'
	import {
		ref
	} from 'vue';
import { onLoad } from '@dcloudio/uni-app';
	
	const carimg = ref('/static/add.png')
	//轮播图高度
	const height = ref('400')

	//是否显示面板指示点
	const indicatorDots = ref(true)

	//是否自动播放
	const autoplay = ref(true)

	//自动切换时间
	const inteerval = ref(2000) //两秒

	//滑动动画时长
	const duration = ref(500)

	//定义轮播图数据
	const swiperList = ref([])
	
	//列表数据
	const flowList = ref([])
	
	//获取轮播图数据
	const getSwipperList = async()=>{
		let res = await getSwipperListApi()
		if(res && res.code == "200"){
			swiperList.value = res.data
		}
	}
	//获取热推数据
	const getHotList = async()=>{
		let res = await getHotListApi()
		if(res && res.code == "200"){
			flowList.value = res.data
		}
	}
	
	//跳转详情
	const toinfo = (item)=>{
		//在起始页跳转到详情页
		uni.navigateTo({
			url: '../info/info?goods='+JSON.stringify(item)  //JSON.stringify(item) 转为字符串
		});
	}
	
	onLoad(()=>{
		getSwipperList()
		getHotList()
	})
	
	
</script>

<style>
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.logo {
		height: 200rpx;
		width: 200rpx;
		margin-top: 200rpx;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50rpx;
	}

	.text-area {
		display: flex;
		justify-content: center;
	}

	.title {
		font-size: 36rpx;
		color: #8f8f94;
	}
	
	.wrap {
		padding: 0px 4px;
	}
	
	.demo-warter {
			border-radius: 8px;
			margin: 5px;
			background-color: #ffffff;
			padding: 8px;
			position: relative;
		}
		
		.u-close {
			position: absolute;
			top: 32rpx;
			right: 32rpx;
		}
		
		.demo-image {
			width: 100%;
			border-radius: 4px;
		}
		
		.demo-title {
			font-size: 30rpx;
			margin-top: 5px;
			color: $u-main-color;
		}
		
		.demo-tag {
			display: flex;
			margin-top: 5px;
		}
		
		.demo-tag-owner {
			background-color: $u-type-error;
			color: #FFFFFF;
			display: flex;
			align-items: center;
			padding: 4rpx 14rpx;
			border-radius: 50rpx;
			font-size: 20rpx;
			line-height: 1;
		}
		
		.demo-tag-text {
			border: 1px solid $u-type-primary;
			color: $u-type-primary;
			margin-left: 10px;
			border-radius: 50rpx;
			line-height: 1;
			padding: 4rpx 14rpx;
			display: flex;
			align-items: center;
			border-radius: 50rpx;
			font-size: 20rpx;
		}
		
		.demo-price {
			font-size: 30rpx;
			color: #FF7670;
			margin-top: 5px;
		}
		
		.price-item {
			display: flex;
			align-items: center;
		}
		
		.carimg {
			height: 50rpx;
			width: 50rpx;
			margin-top: 5px;
			margin-bottom: 8px;
		}
</style>