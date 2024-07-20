package com.example.springboot.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Manager;
import com.example.springboot.entity.Specs;
import com.example.springboot.service.SpecsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/*
*       咖啡大小温度
* */

@RestController
@RequestMapping("/specs")
public class SpecsController {

    @Autowired
    SpecsService specsService;

    @GetMapping("/selectall")
    public Result selectall(){
        List<Specs> users = specsService.list(new QueryWrapper<Specs>().orderByDesc("id"));  //list 为查询所有
        return Result.success(users);
    }

    @PostMapping("/add")
    public Result addManager(@RequestBody Manager manager) {
        // 处理前端传递的 specs 数据
        List<Specs> specsList = manager.getSpecs();
        if (specsList != null && !specsList.isEmpty()) {
            // 循环处理每个规格数据
            for (Specs specs : specsList) {
                // 设置 managerid，即咖啡的 ID
                specs.setManagerid(manager.getId());
                // 调用 SpecsService 中的 addSpecs 方法将规格数据存储到数据库中
                specsService.save(specs);
            }
        }

        // 其他保存 Manager 实体的逻辑...

        return Result.success();
    }

    @PutMapping("/updateSpecs")
    public Result updateSpecs(@RequestBody Specs specs) {
        // 调用 SpecsService 中的 updateSpecs 方法更新规格数据
        specsService.updateById(specs);

        return Result.success();
    }

}
