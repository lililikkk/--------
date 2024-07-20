package com.example.springboot.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Each;
import com.example.springboot.entity.User;
import com.example.springboot.service.EachService;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/each")
public class EachController {

    @Autowired
    EachService eachService;

    @Autowired
    UserService userService;

    /*
     * 新增信息
     * */
    @HoneyLogs(operation = "咖啡分类",type = LogType.ADD)  //自己写注解
    @PostMapping("/add")
    public Result add(@RequestBody Each each){

        User currentUser = TokenUtils.getCurrentUser(); //获取当前登录人信息

        each.setUserid(String.valueOf(currentUser.getId())); //获得当前作者id

        each.setTime(DateUtil.now()); //当前时间  xxx-xx-xx

        eachService.add(each);

        return Result.success("新增成功");
    }

    /*
     * 修改信息
     * @RequestBody  把对象转为JSON
     * */
    @HoneyLogs(operation = "咖啡分类",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody Each each){

        eachService.updateById(each);  //通过id修改

        return Result.success("修改成功");
    }


    /*
     * 删除
     * @PathVariable 指定路径
     * */
    @HoneyLogs(operation = "咖啡分类",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        eachService.remove(id);  //通过id删除一个用户

        return Result.success("删除成功");
    }


   /* *//*
     * 批量删除
     * *//*
    @HoneyLogs(operation = "咖啡分类",type = LogType.BATCH_DELETE)
    @DeleteMapping("/delete/batch")
    public Result batchdelete(@RequestBody List<Integer> ids){

        eachService.deletemore(ids);

        return Result.success("删除成功");
    }*/


    @GetMapping("/selectall")
    public Result selectall(){
        List<Each> users = eachService.list(new QueryWrapper<Each>().orderByDesc("id"));  //list 为查询所有
        return Result.success(users);
    }

    @AuthAccess
    @GetMapping("/{id}")
    public Result sss(@PathVariable Integer id){
        return Result.success(eachService.getById(id));
    }

    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param name
     * @return
     */
    @AuthAccess
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam Integer pageNum,
                             @RequestParam Integer pageSize,
                             @RequestParam String name){
        QueryWrapper<Each> queryWrapper = new QueryWrapper<Each>().orderByDesc("id");

        queryWrapper.like(StrUtil.isNotBlank(name),"name",name);

        Page<Each> page = eachService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Each> records = page.getRecords();

        for (Each record : records) {
            String userid = record.getUserid();
            User byId = userService.getById(userid);
            if(byId != null){
                record.setUser(byId.getUsername());
            }
        }

        return Result.success(page);

    }

}
