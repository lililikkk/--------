package com.example.springboot.common;



import java.lang.annotation.*;

/*
* 自定义注解
* */

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface HoneyLogs {
    // 操作的模块（新闻，公告等）
    String operation();
    // 操作类型（增删改查）
    LogType type();
}
