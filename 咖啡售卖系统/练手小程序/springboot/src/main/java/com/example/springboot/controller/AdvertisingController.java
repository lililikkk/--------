package com.example.springboot.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.entity.*;
import com.example.springboot.service.AdvertisingService;
import com.example.springboot.service.ManagerService;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/advertising")
@Controller
public class AdvertisingController {

    @Autowired
    AdvertisingService advertisingService;

    @Autowired
    UserService userService;

    @Autowired
    ManagerService managerService;

    @HoneyLogs(operation = "广告管理",type= LogType.ADD)
    @PostMapping("/add")
    public Result add(@RequestBody Advertising advertising){

        User currentUser = TokenUtils.getCurrentUser();//获取当前登录人信息

        advertising.setUserid(String.valueOf(currentUser.getId())); //获取当前登录人id

        advertising.setTime(DateUtil.now());

        advertisingService.add(advertising);

        return Result.success("新增成功");
    }

    /*
     * 修改信息
     * @RequestBody  把对象转为JSON
     * */
    @HoneyLogs(operation = "广告管理",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody Advertising advertising){

        advertisingService.updateById(advertising);  //通过id修改

        return Result.success("修改成功");
    }


    /*
     * 删除
     * @PathVariable 指定路径
     * */
    @HoneyLogs(operation = "广告管理",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        advertisingService.removeById(id);  //通过id删除一个用户

        return Result.success("删除成功");
    }


    /*
     * 批量删除
     * */
    @HoneyLogs(operation = "广告管理",type = LogType.BATCH_DELETE)
    @DeleteMapping("/delete/batch")
    public Result batchdelete(@RequestBody List<Integer> ids){

        advertisingService.removeBatchByIds(ids);

        return Result.success("删除成功");
    }

    @GetMapping("/selectall")
    public Result selectall(){
        List<Advertising> users = advertisingService.list(new QueryWrapper<Advertising>().orderByDesc("id"));  //list 为查询所有
        return Result.success(users);
    }

    /*
     * 查询主页公告
     * */
    @GetMapping("/selectUserDate")
    public Result selectUserDate(@RequestParam Integer pageNum,
                                 @RequestParam Integer pageSize,
                                 @RequestParam String title){
        QueryWrapper<Advertising> queryWrapper = new QueryWrapper<Advertising>().orderByDesc("id");

        queryWrapper.eq("status",1);  //用户只能看到公开的数据

        queryWrapper.like(StrUtil.isNotBlank( title)," title", title); //1.判断title是否为空  2.数据库字段名称  3.参数

        Page<Advertising> page = advertisingService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Advertising> records = page.getRecords(); //每次查出来的信息
        for (Advertising record : records) {
            String userid = record.getUserid(); //得到作者Id
            User user = userService.getById(userid); //在user表中找到当前登录人对应的id
            if(user != null){
                record.setUser(user.getName()); //返回姓名
            }
        }

        return Result.success(page);

    }

    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param title
     * @return
     */
    @AuthAccess
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam Integer pageNum,
                             @RequestParam Integer pageSize,
                             @RequestParam String title){
        QueryWrapper<Advertising> queryWrapper = new QueryWrapper<Advertising>().orderByDesc("id");

        queryWrapper.like(StrUtil.isNotBlank(title),"title",title);

        Page<Advertising> page = advertisingService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Advertising> records = page.getRecords();

        for (Advertising record : records) {
            String userid = record.getUserid();
            String managerid = record.getManagerid();
            User byId = userService.getById(userid);
            Manager byId1 = managerService.getById(managerid);
            if(byId != null && byId1 != null){
                record.setUser(byId.getName());
                record.setManagername(byId1.getName());
            }
        }

        return Result.success(page);

    }
}
