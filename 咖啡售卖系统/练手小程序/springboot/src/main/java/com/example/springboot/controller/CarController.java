package com.example.springboot.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.unit.DataUnit;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Car;
import com.example.springboot.entity.Manager;
import com.example.springboot.entity.Notice;
import com.example.springboot.entity.User;
import com.example.springboot.mapper.CarMapper;
import com.example.springboot.service.CarService;
import com.example.springboot.service.ManagerService;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/car")
public class CarController {

    @Autowired
    UserService userService;

    @Autowired
    ManagerService managerService;

    @Autowired
    CarService carService;

    @Resource
    CarMapper carMapper;

    /*
     * 新增或者更新信息
     * */
    @HoneyLogs(operation = "购物车",type = LogType.ADD)  //自己写注解
    @PostMapping
    public Result add(@RequestBody Car car){

        Integer userid = TokenUtils.getCurrentUser().getId();

        //更细购物车里想同商品数量
        Integer managerid = car.getManagerid();

        String specsname = car.getSpecsname();
        String temp = car.getTemp();

        // 存储到购物车表中
        car.setSpecsname(specsname);
        car.setTemp(temp);

        QueryWrapper<Car> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid",userid);
        queryWrapper.eq("managerid",managerid);

        Car one = carService.getOne(queryWrapper);

        if(one != null){
            one.setNum(one.getNum() + car.getNum());
            carService.updateById(one);
            return Result.success();
        }

        //新增或者更新信息
        if(car.getId() == null){
            car.setTime(DateUtil.now());
            car.setUserid(userid );
        }
        carService.saveOrUpdate(car);
        return Result.success();
    }

    //计数价格
    @PostMapping("/num/{id}/{num}")
    public Result updateNum(@PathVariable Integer id,@PathVariable Integer num){
        carMapper.updateNum(num,id);
        return Result.success();
    }


    /*
     * 修改信息
     * @RequestBody  把对象转为JSON
     * */
    @HoneyLogs(operation = "订单管理",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody Car car){

        carService.updateById(car);  //通过id修改

        return Result.success("修改成功");
    }


    /*
     * 删除
     * @PathVariable 指定路径
     * */
    @HoneyLogs(operation = "订单管理",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        carService.removeById(id);  //通过id删除一个用户

        return Result.success("删除成功");
    }

    /*
     * 批量删除
     * */
    @HoneyLogs(operation = "",type = LogType.BATCH_DELETE)
    @DeleteMapping("/delete/batch")
    public Result batchdelete(@RequestBody List<Integer> ids){

        carService.removeBatchByIds(ids);

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
        List<Car> users = carService.list(new QueryWrapper<Car>().orderByDesc("id"));  //list 为查询所有
        return Result.success(users);
    }

    @AuthAccess
    @GetMapping("/{id}")
    public Result sss(@PathVariable Integer id){
        return Result.success(carService.getById(id));
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
                             @RequestParam String name){

        User currentUser = TokenUtils.getCurrentUser();
        Integer userId = currentUser.getId();
        String role = currentUser.getRole();


        Page<Car> page = carMapper.page(new Page<>(pageNum, pageSize), userId, role, name);


        return Result.success(page);

    }

}
