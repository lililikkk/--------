package com.example.springboot.controller;


import cn.hutool.core.lang.Dict;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.entity.ForgetPass;
import com.example.springboot.entity.Notice;
import com.example.springboot.entity.User;
import com.example.springboot.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;


/*
 * 功能：提供接口，返回数据
 * 日期：2023.10.1
 * */

@RestController
public class WebController {

    @Resource
    UserService userService;

    @AuthAccess
    @GetMapping("/")
    public Result get(String name){
         return Result.success("success");
    }

    @HoneyLogs(operation = "用户登录",type = LogType.LOGIN)
   @PostMapping("/login")
    public Result login(@RequestBody User user){
        //if(user.getUsername != null || user.getPassword != null)
        if(StrUtil.isBlank(user.getUsername()) || StrUtil.isBlank(user.getPassword())){
            return Result.error("数据输入不合法");
        }
        user = userService.login(user); //将login中的dbuser 传给user

        return Result.success(user);
   }

   /*
   * 注册
   * */
   @HoneyLogs(operation = "用户注册",type = LogType.REGISTER)
    @AuthAccess   //自定义注解，拦截器放行此路径
    @PostMapping("/register")
    public Result register(@RequestBody User user){
        //if(user.getUsername != null || user.getPassword != null)
        if(StrUtil.isBlank(user.getUsername()) || StrUtil.isBlank(user.getPassword())|| StrUtil.isBlank(user.getRole())){
            return Result.error("数据输入不合法");
        }
        if(user.getUsername().length() > 10 || user.getPassword().length() > 10){
            return Result.error("数据输入不合法");
        }
        user = userService.register(user); //将login中的dbuser 传给user

        return Result.success(user);
    }

    /*
    * 重置密码
    * */
    @HoneyLogs(operation = "修改密码",type = LogType.UPDATE)
    @AuthAccess   //自定义注解，拦截器放行此路径
    @PutMapping("/password")
    public Result password(@RequestBody ForgetPass forgetPass){
        if(StrUtil.isBlank(forgetPass.getUsername()) || StrUtil.isBlank(forgetPass.getPhone())){
            return Result.error("数据输入不合法");
        }
        userService.resetpassword(forgetPass);
        return Result.success();
    }

    /*
    * 获取统计图数据
    * */

   /* *//**
     * 获取统计图数据
     * @return 动态数据
     *//*
    @GetMapping("/charts")
    public Result charts() {
       *//* // 包装折线图的数据
        Set<String> sex = list.stream().map(User::getSex).collect(Collectors.toSet());
        List<Dict> lineList = new ArrayList<>();
        for (String s :sex) {
            // 统计当前日期的所有金额总数和
            BigDecimal sum = list.stream().filter(orders -> orders.getSex().equals(s)).map(User::getMouth)
                    .reduce(BigDecimal::add).orElse(BigDecimal.ZERO);
            Dict dict = Dict.create();
            Dict line = dict.set("date", s).set("value", sum);
            lineList.add(line);
        }*//*

        // 柱状图数据
        List<User> list = userService.list();
        List<Dict> barList = new ArrayList<>();
        Set<String> sex = list.stream().map(User::getSex).collect(Collectors.toSet());
        for (String s : sex) {
            // 统计当前男女人数
            BigDecimal sum = list.stream().filter(user -> user.getSex().equals(s)).map(User::getMouth)
                    .reduce(BigDecimal::add).orElse(BigDecimal.ZERO);
            QueryWrapper<Notice> queryWrapper = new QueryWrapper<Notice>().orderByDesc("id");
            queryWrapper.eq("role","用户");
            Dict dict = Dict.create();
            Dict bar = dict.set("name", s).set("value", sum);
            barList.add(bar);
        }


        // 包装所有数据
        Dict res = Dict.create().set("bar", barList);
        return Result.success(res);
    }*/

}
