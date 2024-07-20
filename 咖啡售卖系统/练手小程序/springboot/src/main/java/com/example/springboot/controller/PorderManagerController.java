package com.example.springboot.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.entity.PorderManager;
import com.example.springboot.service.CarService;
import com.example.springboot.service.ManagerService;
import com.example.springboot.service.PorderManagerService;
import com.example.springboot.service.PorderService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/porderManager")
public class PorderManagerController {

    @Autowired
    CarService carService;

    @Autowired
    ManagerService managerService;

    @Autowired
    PorderService porderService;
    
    @Autowired
    PorderManagerService porderManagerService;

    /*
     * 新增或者更新信息
     * */
    @HoneyLogs(operation = "订单",type = LogType.ADD)  //自己写注解
    @PostMapping
    public Result add(@RequestBody PorderManager porderManager){

        //新增或者更新信息
        if(porderManager.getId() == null){
            /*porderManager.set(DateUtil.now());
            porderManager.setName(TokenUtils.getCurrentUser().getName());*/
        }
        porderManagerService.saveOrUpdate(porderManager);
        return Result.success();
    }
    

    /*
     * 修改信息
     * @RequestBody  把对象转为JSON
     * */
    @HoneyLogs(operation = "订单管理",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody PorderManager porderManager){

        porderManagerService.updateById(porderManager);  //通过id修改

        return Result.success("修改成功");
    }


    /*
     * 删除
     * @PathVariable 指定路径
     * */
    @HoneyLogs(operation = "订单管理",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        porderManagerService.removeById(id);  //通过id删除一个用户

        return Result.success("删除成功");
    }

    /*
     * 批量删除
     * */
    @HoneyLogs(operation = "",type = LogType.BATCH_DELETE)
    @DeleteMapping("/delete/batch")
    public Result batchdelete(@RequestBody List<Integer> ids){

        porderManagerService.removeBatchByIds(ids);

        return Result.success("删除成功");
    }



    @GetMapping("/selectall")
    public Result selectall(){
        List<PorderManager> users = porderManagerService.list(new QueryWrapper<PorderManager>().orderByDesc("id"));  //list 为查询所有
        return Result.success(users);
    }


    @AuthAccess
    @GetMapping("/{id}")
    public Result sss(@PathVariable Integer id){
        return Result.success(porderManagerService.getById(id));
    }

    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam Integer pageNum,
                             @RequestParam Integer pageSize,
                             @RequestParam(defaultValue = "") String name){

        QueryWrapper<PorderManager> queryWrapper = new QueryWrapper<PorderManager>().orderByDesc("id");  //条件构造器


        return Result.success(porderManagerService.page(new Page<>(pageNum, pageSize),queryWrapper));

    }

}
