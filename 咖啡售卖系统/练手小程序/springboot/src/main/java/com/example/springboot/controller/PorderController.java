package com.example.springboot.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.dao.PorderDao;
import com.example.springboot.dto.GoodsDto;
import com.example.springboot.entity.*;
import com.example.springboot.mapper.CarMapper;
import com.example.springboot.mapper.PorderMapper;
import com.example.springboot.service.*;
import com.example.springboot.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/porder")
public class PorderController {

    @Autowired
    CarService carService;

    @Autowired
    ManagerService managerService;

    @Autowired
    PorderService porderService;

    @Resource
    PorderMapper porderMapper;

    @Autowired
    EachService eachService;

    @Autowired
    PorderDao porderDao;


    @Resource
    private PorderManagerService porderManagerService;

    private final String now = DateUtil.now();

    /*
     * 新增或者更新信息
     * */
    @HoneyLogs(operation = "订单",type = LogType.ADD)  //自己写注解
    @PostMapping
    public Result ADD(@RequestBody Porder porder){

        //新增或者更新信息
        if(porder.getId() == null) {
            Date date = new Date();

            porder.setTime(DateUtil.formatDateTime(date));
            porder.setNo(DateUtil.format(date, "yyyyMMdd") + System.currentTimeMillis());
            porder.setUserid(TokenUtils.getCurrentUser().getId());

            //先创建订单
            porderService.save(porder);

            List<Car> cars = porder.getCars();
            for (Car car1 : cars) {
                PorderManager porderManager = new PorderManager();
                porderManager.setManagerid(car1.getManagerid());
                porderManager.setNum(car1.getNum());
                porderManager.setOrderid(porder.getId());
                porderManagerService.save(porderManager);



                //删除购物车数据
                carService.removeById(car1.getId());
            }
        }else{
            porderService.updateById(porder);
        }

        return Result.success();
    }



    /*
     * 修改信息
     * @RequestBody  把对象转为JSON
     * */
    @HoneyLogs(operation = "订单管理",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody Porder porder){

        porderService.updateById(porder); //通过id修改

        return Result.success();
    }


    /*
     * 删除
     * @PathVariable 指定路径
     * */
    @HoneyLogs(operation = "订单管理",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        porderService.removeById(id);  //通过id删除一个用户

        return Result.success("删除成功");
    }

    /*
     * 批量删除
     * */
    @HoneyLogs(operation = "",type = LogType.BATCH_DELETE)
    @DeleteMapping("/delete/batch")
    public Result batchdelete(@RequestBody List<Integer> ids){

        porderService.removeBatchByIds(ids);

        return Result.success("删除成功");
    }



    @GetMapping("/selectall")
    public Result selectall(){
        List<Porder> users = porderService.list(new QueryWrapper<Porder>().orderByDesc("id"));  //list 为查询所有
        return Result.success(users);
    }


    @AuthAccess
    @GetMapping("/{id}")
    public Result sss(@PathVariable Integer id){
        return Result.success(porderService.getById(id));
    }

    @AuthAccess
    @GetMapping("/select")
    public Result ppp(@RequestParam Integer managerid){

        List<Porder> allBymanagerid = porderDao.findAllBymanagerid(managerid);
        return Result.success(allBymanagerid);

    }


    //显示商品
    @AuthAccess
    @GetMapping("/getGoodsById/{id}")
    public Result getGoodsById(@PathVariable Integer id){

        QueryWrapper<PorderManager> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("orderid",id);

        ArrayList<Manager> arrayList = new ArrayList<>();

        List<PorderManager> list = porderManagerService.list(queryWrapper);
        for (PorderManager list1 : list) {
            Integer managerid = list1.getManagerid();
            Manager manager = managerService.getById(managerid);
            Integer eachffid = manager.getEachffid();
            Each byId = eachService.getById(eachffid);
            manager.setEachffname(byId.getName());

            arrayList.add(manager);
        }

        return Result.success(arrayList);
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
        String role = currentUser.getRole();
        Integer userId = currentUser.getId();

        Page<Porder> page = porderMapper.page(new Page<>(pageNum, pageSize),userId,role, name );

        return Result.success(page);

    }

}
