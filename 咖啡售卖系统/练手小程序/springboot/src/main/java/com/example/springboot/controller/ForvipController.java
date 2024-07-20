package com.example.springboot.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.dao.ForVipDao;
import com.example.springboot.entity.Forvip;
import com.example.springboot.entity.User;
import com.example.springboot.service.ForvipService;
import com.example.springboot.service.NoticeService;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@CrossOrigin //解决跨域问题
@RestController
@RequestMapping("/forvip")
public class ForvipController {


    @Resource
    ForvipService forvipService;

    @Resource
    UserService userService;

    @Resource
    ForVipDao forVipDao;
    /*
    * 新增信息
    * */
    @HoneyLogs(operation = "会员管理",type = LogType.ADD)  //自己写注解
    @PostMapping ("/add")
    public Result add(@RequestBody Forvip forvip){

        User currentUser = TokenUtils.getCurrentUser(); //获取当前登录人信息

        forvip.setUserid(Integer.valueOf(currentUser.getId())); //获得当前作者id

        forvip.setTime(DateUtil.now()); //当前时间  xxx-xx-xx

        forvip.setId(Integer.valueOf(currentUser.getId()));

        forvipService.save(forvip);

        return Result.success("新增成功");
    }

    /*
    * 修改信息
    * @RequestBody  把对象转为JSON
    * */
    @HoneyLogs(operation = "会员管理",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody Forvip forvip){


        forvipService.updateById(forvip);  //通过id修改

        return Result.success();
    }


    /*
    * 删除
    * @PathVariable 指定路径
    * */
    @HoneyLogs(operation = "会员管理",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        forvipService.removeById(id);  //通过id删除一个用户

        return Result.success("删除成功");
    }


    /*
     * 批量删除
     * */
    @HoneyLogs(operation = "会员管理",type = LogType.BATCH_DELETE)
    @DeleteMapping("/delete/batch")
    public Result batchdelete(@RequestBody List<Integer> ids){

        forvipService.removeBatchByIds(ids);

        return Result.success("删除成功");
    }

    @GetMapping("/selectall")
    public Result selectall(){
        List<Forvip> users = forvipService.list(new QueryWrapper<Forvip>().orderByDesc("id"));  //list 为查询所有
        return Result.success(users);
    }

    /*
     * 根据id查询
     * */
    @AuthAccess
    @GetMapping("/selectall/{id}")
    public Result selectById1(@RequestParam  Integer userid){

        List<Forvip> allByuserid = forVipDao.findAllByuserid(userid);

        return Result.success(allByuserid);
    }

    /*
    * 查询主页公告
    * */
    @GetMapping("/selectUserDate")
    public Result selectUserDate(@RequestParam Integer pageNum,
                                 @RequestParam Integer pageSize,
                                 @RequestParam String title){
        QueryWrapper<Forvip> queryWrapper = new QueryWrapper<Forvip>().orderByDesc("id");


        queryWrapper.like(StrUtil.isNotBlank( title)," title", title); //1.判断title是否为空  2.数据库字段名称  3.参数

        Page<Forvip> page = forvipService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Forvip> records = page.getRecords(); //每次查出来的信息
        for (Forvip record : records) {
            Integer userid = record.getUserid(); //得到作者Id
            User user = userService.getById(userid); //在user表中找到当前登录人对应的id
            if(user != null){
                record.setUname(user.getName()); //返回姓名
            }
        }

        return Result.success(page);

    }

    /*
    * 根据id查询
    * */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id){
        Forvip forvip = forvipService.getById(id);
        User user = userService.getById(forvip.getUserid());
        if(user != null){
            forvip.setUname(user.getUsername()); //返回姓名
        }
        return Result.success(forvip);
    }


    /*
    * 多条件模糊查询
    * */
    @AuthAccess
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam Integer pageNum,
                            @RequestParam Integer pageSize){
        QueryWrapper<Forvip> queryWrapper = new QueryWrapper<Forvip>().orderByDesc("id");  //条件构造器

        Page<Forvip> page = forvipService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Forvip> records = page.getRecords(); //每次查出来的信息

        for (Forvip record : records) {
            Integer authorid = record.getUserid(); //得到作者Id
            User user = userService.getById(authorid); //在user表中找到当前登录人对应的id
            if(user != null ){
                record.setUname(user.getUsername()); //返回姓名
            }
        }

        return Result.success(page);
    }

}
