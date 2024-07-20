package com.example.springboot.service.aop;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.ArrayUtil;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.entity.Logs;
import com.example.springboot.entity.User;
import com.example.springboot.service.LogsService;
import com.example.springboot.utils.IpUtils;
import com.example.springboot.utils.TokenUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/*
* 日志切面
* */

@Component /*spring 主件 */
@Aspect /* 标注切面 */
@Slf4j  /* 日志 */

public class LogsAspect {

    @Autowired
    LogsService logsService;

    //后置通知  在方法执行完后会自动执行 记录日志
    @AfterReturning(pointcut = "@annotation(honeyLogs)", returning = "jsonResult")
    public void recordLog(JoinPoint joinPoint, HoneyLogs honeyLogs, Object jsonResult) {
        // 获取当前登录的用户的信息
        User loginUser = TokenUtils.getCurrentUser();
        if (loginUser == null) { // 用户未登录的情况下  loginUser是null  是null的话我们就要从参数里面获取操作人信息
            // 登录、注册
            Object[] args = joinPoint.getArgs();  //通过joinPoint获得所以 请求参数
            if (ArrayUtil.isNotEmpty(args)) {
                if (args[0] instanceof User) {   //判断是不是User类型
                    loginUser = (User) args[0];  //参数的第一个值就是用户信息
                }
            }
        }
        if (loginUser == null) {
            log.error("记录日志信息报错，未获取到当前操作用户信息");
            return;
        }
        // 获取HttpServletRequest对象
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();

        // 获取到请求的ip
        String ip = IpUtils.getIpAddr(request);

        //组装日志的实体类对象
        Logs logs = Logs.builder()
                .operation(honeyLogs.operation())
                .type(honeyLogs.type().getValue())
                .ip(ip)
                .user(loginUser.getUsername())
                .time(DateUtil.now())
                .build();

        ThreadUtil.execAsync(() -> {
            // 异步记录日志信息 （多线程）
            logsService.save(logs); //插入数据库
        });
    }
}

