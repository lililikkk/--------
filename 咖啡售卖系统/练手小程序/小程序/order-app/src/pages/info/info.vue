<template>
	<u-swiper name='avatar' border-radius='1' :duration="duration" :interval="inteerval" :height="height"
		:list="swipperList"></u-swiper>
	<view class="fo">
		<view class="title">
			{{title}}
		</view>
		<view class="price">
			{{price}}元<span class="goodsUnit">{{goodsUnit}}</span>
		</view>
	</view>
	<view class="spec-driver">
		规格
	</view>
	<view class="spces">
		<view @click="change(index,item)" :class="{active: current === index}" v-for="(item,index) in specs"
			class="item">
			{{item.specsname}}
		</view>
	</view>
	<view class="info">
		<view @click="tabClick(0)" class="left" :class="[tabIndex == 0? 'item-active':'item']">
			详情
		</view>
		<view @click="tabClick(1)" class="right" :class="[tabIndex == 1? 'item-active':'item']">
			评论
		</view>
	</view>
	<swiper class="swiper-box" :current="swiperCurrent" @animationfinish="animationfinish">
		<swiper-item class="swiper-item">
			<scroll-view scroll-y style="height: 100%;width: 100%;">
				<view class="page-box">
					<u-parse :html="content"></u-parse>
				</view>
			</scroll-view>
		</swiper-item>
		<swiper-item class="swiper-item">
			<scroll-view scroll-y style="height: 100%;width: 100%;">
				<view class="page-box">
					我是内容一
					我是内容一
					我是内容一
					我是内容一
					我是内容一
					我是内容一
					我是内容一
				</view>
			</scroll-view>
		</swiper-item>
	</swiper>
	<view class="navigation">
		<view class="left">
			<view class="item" @click="goHome">
				<u-icon name="home" :size="40" :color="$u.color['contentColor']"></u-icon>
				<view class="text u-line-1">首页</view>
			</view>
			<view class="item car" @click="goOrder">
				<u-badge class="car-num" :count="carCount" type="error" :offset="[-3, -6]"></u-badge>
				<u-icon name="shopping-cart" :size="40" :color="$u.color['contentColor']"></u-icon>
				<view class="text u-line-1">购物车</view>
			</view>
		</view>
		<view class="right">
			<view class="cart btn u-line-1" @click="addCar">加入购物车</view>
			<view class="buy btn u-line-1">立即购买</view>
		</view>
	</view>
</template>

<script setup>
	import {
		onLoad
	} from '@dcloudio/uni-app';
	import {
		ref
	} from 'vue';
	import { carStore } from '../../store/car.js'
	//获取store
	const store = carStore()

	//购物车数量
	const carCount = ref(7)

	//咖啡详情
	const content = ref('')

	const current = ref(0)
	
	//轮播图高度
	const height = ref('404')

	//是否显示面板指示点
	const indicatorDots = ref(false)

	//是否自动播放
	const autoplay = ref(true)

	//自动切换时间
	const inteerval = ref(2000) //两秒

	//滑动动画时长
	const duration = ref(500)

	//定义轮播图数据
	const swipperList = ref([])
	
	//标题
	const title = ref('')
	
	//价格
	const price = ref(0)
	
	//单位
	const goodsUnit = ref('')
	
	//规格
	const specs = ref([])
	
	//规格点击事件
	const change = (index , item)=>{
		current.value = index
		price.value = item.goodsPrice
	}
	
	//详情tab
	const swiperCurrent = ref(0)
	const dx = ref(0)
	const tabIndex = ref(0)
	
	//购物车数据类型
	const carData = ref({
			flag: true,
			goodsName:'',
			goodsId:'',
			num:1,
			specsName:'',
			price:'',
			goodsImage:''
		})
	
	//tab栏内容
	const tabClick = (index) =>{
		tabIndex.value = index;
		swiperCurrent.value = index;
	}
	
	//加入购物车
	const addCar = () =>{
		store.addCar(carData.value)
	}
	
	const animationfinish = ({info : {current} })=>{
		swiperCurrent.value = current;
		tabIndex.value = current;
	}
	
	//跳转首页
	const goHome = ()=>{
		uni.switchTab({
			url:'../index/index'
		});
	}
	
	//跳转购物车
	const goOrder = ()=>{
		uni.switchTab({
			url:'../orders/orders'
		});
	}

	onLoad((options) => {
		console.log(options)
		const goods = JSON.parse(options.goods) //将字符串转为对象
		swipperList.value = goods.avatar.split(',')
		console.log(goods)
		goodsUnit.value = goods.goodsUnit
		title.value = goods.name
		price.value = goods.price
		specs.value = goods.specs
		content.value = goods.content
		
		//设置购物车数据
		carData.value.goodsId = goods.Id
		carData.value.goodsName = goods.name
		carData.value.goodsUnit = goods.goodsUnit
		carData.value.specsName = goods.specs
		carData.value.price = goods.price
		carData.value.goodsImage = goods.avatar.split(',')[0]
	})
</script>

<style lang="scss" scoped>
	
	.page {
		display: flex;
		flex-direction: column;
		height: 100%;
	}
	
	.fo {
		display: flex;
		align-items: center;
		background-color: #fff;
	}
	
	.title {
		color: #313131;
		font-weight: bold;
		padding: 20rpx;
		font-size: 30rpx;
	}
	
	.price {
		color: #F3AF28;
		padding: 20rpx;
		font-weight: bold;
	}
	
	.goodsUnit {
		padding-left: 3rpx;
		color: #000;
	}
	
	.spec-driver {
		display: flex;
		align-items: center;
		padding: 10rpx 20rpx;
		font-weight: bold;
		background-color: #f0f0f0;
	}
	
	.spces {
		display: flex;
		flex-wrap: wrap;
		background-color: #FFF;
		padding: 15rpx 10rpx;
		margin: 10rpx 0rpx;
	
		.item {
			padding: 5px 20px;
			margin: 0px 10px;
			border-radius: 5px;
			border: 1px solid;
		}
		
		.active {
			padding: 2px 20px;
			margin: 0px 10px;
			border-radius: 5px;
			border: 1px solid #e2e2e2;
			background-color: #F3AF28;
			color: #fff;
		}
	}
	
	.info {
		display: flex;
		padding: 0px 5px;
	
		.item {
			flex-grow: 1;
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 7px;
		}
	
		.left {
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			border-top: 1px solid #e2e2e2;
			border-left: 1px solid #e2e2e2;
		}
		
		.right {
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
			border: 1px solid #e2e2e2;
		}
		
		.item-active {
			flex-grow: 1;
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 7px;
			background-color: #f0f0f0;
		}
	}
		
	.navigation {
		display: flex;
		margin-top: 100rpx;
		border: solid 2rpx #f2f2f2;
		background-color: #ffffff;
		padding: 16rpx 0;
		position: fixed;
		width: 100%;
		bottom: 0;

		.left {
			display: flex;
			font-size: 20rpx;

			.item {
				margin: 0 30rpx;

				&.car {
					text-align: center;
					position: relative;

					.car-num {
						position: absolute;
						top: -10rpx;
						right: -10rpx;
					}
				}
			}
		}

		.right {
			display: flex;
			font-size: 28rpx;
			align-items: center;

			.btn {
				line-height: 66rpx;
				padding: 0 50rpx;
				border-radius: 36rpx;
				color: #ffffff;
			}

			.cart {
				background-color: #ed3f14;
				margin-right: 50rpx;
			}

			.buy {
				background-color: #ff7900;
			}
		}
	}
	
	.swiper-box {
		flex: 1;
	}
	
	.page-box {
		padding: 20rpx;
	}
	
</style>