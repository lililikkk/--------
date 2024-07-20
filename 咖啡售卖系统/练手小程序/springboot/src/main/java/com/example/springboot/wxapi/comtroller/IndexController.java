package com.example.springboot.wxapi.comtroller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Advertising;
import com.example.springboot.entity.Each;
import com.example.springboot.entity.Manager;
import com.example.springboot.service.AdvertisingService;
import com.example.springboot.service.EachService;
import com.example.springboot.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/index")
public class IndexController {

    @Autowired
    EachService eachService;

    @Autowired
    AdvertisingService advertisingService;

    @Autowired
    ManagerService managerService;

    /**
     * 首页轮播图
     * @return
     */
    @AuthAccess
    @GetMapping("/getSwipperList")
    public Result getSwipperList(){
        QueryWrapper<Advertising> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Advertising::getStatus,"1");
        List<Advertising> list = advertisingService.list(queryWrapper);
        return Result.success(list);
    }

    /**
     * 首页热推
     * @return
     */
    @AuthAccess
    @GetMapping("/getHotList")
    public Result getHotList(){
        QueryWrapper<Manager> queryWrapper = new QueryWrapper<Manager>().orderByDesc("id");
        queryWrapper.lambda().eq(Manager::getStatus,"1");
        List<Manager> list = managerService.list(queryWrapper);


        return Result.success(list);
    }

}
