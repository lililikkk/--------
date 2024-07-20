package com.example.springboot.common;
import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented

/*
* 自定义注解，使用  @AuthAccess 注解  拦截器自动放行
* */

public @interface AuthAccess {
}
