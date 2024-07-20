import {
	createSSRApp
} from "vue";
import App from "./App.vue";
//引入 uView UI
import uView from './uni_modules/vk-uview-ui';

import * as Pinia from 'pinia';
export function createApp() {
	const app = createSSRApp(App);
	//使用 uView UI
	app.use(uView);
	//使用 pinia
	app.use(Pinia.createPinia());
	return {
		app,
		Pinia, // 此处必须将 Pinia 返回
	};
}
