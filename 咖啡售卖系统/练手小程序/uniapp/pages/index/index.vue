<template>
	   <u-swiper :list="swipperList"></u-swiper>
</template>

<script setup>  // vue3
import { ref } from 'vue';

	//定义轮播图
	const swipperList = ref([{
		image:'/static/swipper1.png'
	},
		{image:'/static/swipper2.png'
	},
		{image:'/static/swipper3.png'
	}])
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
</style>
