package com.example.springboot.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Forvip;
import com.example.springboot.entity.User;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.service.ForvipService;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@CrossOrigin //解决跨域问题
@RestController
@RequestMapping("/user")
public class UserController {



    @Resource
    ForvipService forvipService;

    @Resource
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    /*
    * 新增用户信息
    * */
    @HoneyLogs(operation = "用户信息",type = LogType.ADD)
    @PostMapping ("/add")
    public Result add(@RequestBody User user){
        try {
            userService.save(user);  //在userService中继承的serviceImpl中代理的增删改查中  save为插入一个数据
        } catch (Exception e) {
            if(e instanceof DuplicateKeyException){
                return Result.error("插入数据库错误");
            }else{
                return Result.error("系统错误 ");
            }
        }
        return Result.success();
    }


    /*
    * 修改用户信息
    * @RequestBody  把对象转为JSON
    * */
    @HoneyLogs(operation = "用户信息",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody User user){


        userService.updateById(user);  //通过id修改

        return Result.success();
    }



    /*
    * 删除用户
    * @PathVariable 指定路径
    * */

    @HoneyLogs(operation = "用户信息",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        User currentUser = TokenUtils.getCurrentUser();  //获取当前登录的用户信息

        if(id.equals(currentUser.getId())){   //如果删除的用户是当前登录的用户，则不能删除
            throw new ServiceException("不能删除当前用户");
        }
        userService.removeById(id);  //通过id删除一个用户

        return Result.success();
    }


    /*
     * 批量删除用户
     * */
    @HoneyLogs(operation = "用户信息",type = LogType.BATCH_DELETE)
    @DeleteMapping("/delete/batch")
    public Result batchdelete(@RequestBody List<Integer> ids){

        User currentUser = TokenUtils.getCurrentUser();         //如果批量删除的用户中有当前登录的用户，则不能删除

        if(currentUser.getId() != null && currentUser != null && ids.contains(currentUser.getId())){
            throw new ServiceException("不能删除当前用户");
        }

        userService.removeBatchByIds(ids);

        return Result.success();
    }

    @GetMapping("/selectall")
    public Result selectall(){                                 // select * from user order by id desc  根据id倒序查询出所有信息
        List<User> users = userService.list(new QueryWrapper<User>().orderByDesc("id"));  //list 为查询所有
        return Result.success(users);
    }

    /*
    * 根据id查询
    * */
    @AuthAccess
    @GetMapping("/selectall/{id}")
    public Result selectById(@PathVariable Integer id){

        return Result.success(userService.getById(id));
    }

   /* *//*
    * 多条件查询
    * @RequestParam  传入参数
    * *//*
    @GetMapping("/selectmore")
    public Result selectMore(@RequestParam String username,@RequestParam String name){
        List<User> users = userService.SelectMore(username, name);
        return Result.success(users);
    }*/

    /*
    * 分页模糊查询
    * pagerNum  为当前页码
    * pageSize  为每页查询的页数
    * */
    @AuthAccess
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam Integer pageNum,
                            @RequestParam Integer pageSize,
                            @RequestParam String username,
                            @RequestParam String name){
        QueryWrapper<User> queryWrapper = new QueryWrapper<User>().orderByDesc("id");  //条件构造器
        queryWrapper.like(StrUtil.isNotBlank(username),"username",username); //1.判断username是否为空  2.数据库字段名称  3.参数
        queryWrapper.like(StrUtil.isNotBlank( name)," name", name); //1.判断username是否为空  2.数据库字段名称  3.参数
        // select * from user where username like '%#{username}%' and name like '%#{name}%'

        Page<User> page = userService.page(new Page<>(pageNum, pageSize), queryWrapper);


        return Result.success(page);
    }


    @AuthAccess
    @GetMapping("/selectPage1")
    public Result selectPage1(@RequestParam Integer pageNum,
                             @RequestParam Integer pageSize
                             ){
        QueryWrapper<User> queryWrapper = new QueryWrapper<User>().orderByDesc("id");  //条件构造器
        // select * from user where username like '%#{username}%' and name like '%#{name}%'

        Page<User> page = userService.page(new Page<>(pageNum, pageSize), queryWrapper);


        return Result.success(page);
    }

}
