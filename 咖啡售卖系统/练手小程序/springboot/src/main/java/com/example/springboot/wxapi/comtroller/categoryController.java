package com.example.springboot.wxapi.comtroller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Each;
import com.example.springboot.entity.Manager;
import com.example.springboot.service.EachService;
import com.example.springboot.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/category")
public class categoryController {

    @Autowired
    EachService eachService;

    @Autowired
    ManagerService managerService;

    /**
     * 分类查询
     * @return
     */
    @AuthAccess
    @GetMapping("/getCategoryList")
    public Result getCategoryList(){
        QueryWrapper<Each> queryWrapper = new QueryWrapper<Each>();
        List<Each> list = eachService.list(queryWrapper);
        if(list.size() > 0){
            for(int i = 0; i < list.size(); i++){
                //查询分类下面的咖啡
                QueryWrapper<Manager> queryWrapper1 = new QueryWrapper<>();
                queryWrapper1.lambda().eq(Manager::getEachffid,list.get(i).getId());
                List<Manager> goods = managerService.list(queryWrapper1);
                list.get(i).setGoods(goods);
            }
        }

        return Result.success(list);
    }

}
