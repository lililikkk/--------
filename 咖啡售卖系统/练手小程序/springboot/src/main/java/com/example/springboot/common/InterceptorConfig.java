package com.example.springboot.common;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;


/*
* 拦截器配置
* */
@Configuration  //配置类
public class InterceptorConfig extends WebMvcConfigurationSupport {

    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(Interceptor())  //配置JWT的拦截器规则
                .addPathPatterns("/**")  //拦截所有的请求路径
                .excludePathPatterns("/login","/front/home");  //将登录放行
        super.addInterceptors(registry);
    }

    @Bean
    public Interceptor Interceptor() {
        return new Interceptor();
    }

}