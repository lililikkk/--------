package com.example.springboot.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Notice;
import com.example.springboot.entity.User;
import com.example.springboot.service.NoticeService;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;


@CrossOrigin //解决跨域问题
@RestController
@RequestMapping("/notice")
public class  NoticeController {


    @Resource
    NoticeService noticeService;

    @Resource
    UserService userService;

    /*
    * 新增信息
    * */
    @HoneyLogs(operation = "系统公告",type = LogType.ADD)  //自己写注解
    @PostMapping ("/add")
    public Result add(@RequestBody Notice notice){

        User currentUser = TokenUtils.getCurrentUser(); //获取当前登录人信息

        notice.setUserid(String.valueOf(currentUser.getId())); //获得当前作者id

        notice.setTime(DateUtil.now()); //当前时间  xxx-xx-xx

        noticeService.save(notice);

        return Result.success("新增成功");
    }

    /*
    * 修改信息
    * @RequestBody  把对象转为JSON
    * */
    @HoneyLogs(operation = "系统公告",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody Notice notice){

        noticeService.updateById(notice);  //通过id修改

        return Result.success("修改成功");
    }


    /*
    * 删除
    * @PathVariable 指定路径
    * */
    @HoneyLogs(operation = "系统公告",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        noticeService.removeById(id);  //通过id删除一个用户

        return Result.success("删除成功");
    }


    /*
     * 批量删除
     * */
    @HoneyLogs(operation = "系统公告",type = LogType.BATCH_DELETE)
    @DeleteMapping("/delete/batch")
    public Result batchdelete(@RequestBody List<Integer> ids){

        noticeService.removeBatchByIds(ids);

        return Result.success("删除成功");
    }

    @GetMapping("/selectall")
    public Result selectall(){
        List<Notice> users = noticeService.list(new QueryWrapper<Notice>().orderByDesc("id"));  //list 为查询所有
        return Result.success(users);
    }

    /*
    * 查询主页公告
    * */
    @GetMapping("/selectUserDate")
    public Result selectUserDate(@RequestParam Integer pageNum,
                                 @RequestParam Integer pageSize,
                                 @RequestParam String title){
        QueryWrapper<Notice> queryWrapper = new QueryWrapper<Notice>().orderByDesc("id");

        queryWrapper.eq("open",1);  //用户只能看到公开的数据

        queryWrapper.like(StrUtil.isNotBlank( title)," title", title); //1.判断title是否为空  2.数据库字段名称  3.参数

        Page<Notice> page = noticeService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Notice> records = page.getRecords(); //每次查出来的信息
        for (Notice record : records) {
            String userid = record.getUserid(); //得到作者Id
            User user = userService.getById(userid); //在user表中找到当前登录人对应的id
            if(user != null){
                record.setUser(user.getName()); //返回姓名
            }
        }

        return Result.success(page);

    }

    /*
    * 根据id查询
    * */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id){
        Notice notice = noticeService.getById(id);
        User user = userService.getById(notice.getUserid());
        if(user != null){
            notice.setUser(user.getName()); //返回姓名
        }
        return Result.success(notice);
    }


    /*
    * 多条件模糊查询
    * */
    @AuthAccess
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam Integer pageNum,
                            @RequestParam Integer pageSize,
                            @RequestParam String title){
        QueryWrapper<Notice> queryWrapper = new QueryWrapper<Notice>().orderByDesc("id");  //条件构造器

        queryWrapper.like(StrUtil.isNotBlank( title)," title", title); //1.判断title是否为空  2.数据库字段名称  3.参数

        Page<Notice> page = noticeService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Notice> records = page.getRecords(); //每次查出来的信息
        for (Notice record : records) {
            String authorid = record.getUserid(); //得到作者Id
            User user = userService.getById(authorid); //在user表中找到当前登录人对应的id
            if(user != null){
                record.setUser(user.getName()); //返回姓名
            }
        }

        return Result.success(page);
    }

}
