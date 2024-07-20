package com.example.springboot.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.dao.ManagerDao;
import com.example.springboot.dao.SpecsDao;
import com.example.springboot.entity.Each;
import com.example.springboot.entity.Manager;
import com.example.springboot.entity.Specs;
import com.example.springboot.entity.User;
import com.example.springboot.mapper.ManagerMapper;
import com.example.springboot.service.EachService;
import com.example.springboot.service.ManagerService;
import com.example.springboot.service.SpecsService;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    ManagerService managerService;

    @Autowired
    EachService eachService;

    @Autowired
    UserService userService;

    @Autowired
    SpecsService specsService;

    @Resource
    ManagerDao managerDao;

    @Resource
    SpecsDao specsDao;

    @Autowired
    ManagerMapper managerMapper;

    /*
     * 新增信息
     * */
    @HoneyLogs(operation = "咖啡管理",type = LogType.ADD)  //自己写注解
    @PostMapping("/add")
    public Result add(@RequestBody Manager manager){

        User currentUser = TokenUtils.getCurrentUser(); //获取当前登录人信息

        manager.setUserid(Integer.valueOf(currentUser.getId())); //获得当前作者id

        manager.setTime(DateUtil.now()); //当前时间  xxx-xx-xx

        managerService.add(manager);

        List<Specs> specsList = manager.getSpecs();
        if (specsList != null && !specsList.isEmpty()) {
            // 清空之前的规格数据
            specsList.clear();
            // 循环处理每个规格数据
            for (Specs specs : manager.getSpecs()) {
                // 检查规格对象的 id 是否已经存在于数据库中，如果存在则为其分配一个新的唯一 id
                String uniqueId = generateUniqueId();
                while (specsDao.existsById(uniqueId)) {
                    uniqueId = generateUniqueId();
                }
                specs.setId(uniqueId);
                specsList.add(specs); // 添加新的规格数据
            }
            specsService.saveBatch(specsList);
                }


        return Result.success();
    }

    // 生成唯一 ID 的方法，可以使用时间戳、UUID 等
    private String generateUniqueId() {
        String uniqueId = "id_" + UUID.randomUUID().toString();
        while (specsDao.existsById(uniqueId)) {
            uniqueId = "id_" + UUID.randomUUID().toString();
        }
        return uniqueId;
    }

    /*
     * 修改信息
     * @RequestBody  把对象转为JSON
     * */
    @HoneyLogs(operation = "咖啡管理",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody Manager manager){

        // 获取前端传递过来的规格列表
        List<Specs> specs = manager.getSpecs();
        // 遍历规格列表，逐个更新规格信息
        for (Specs spec : specs) {
            // 更新每个规格条目的信息
            specsService.updateById(spec);
        }
        // 更新其他信息，比如咖啡的其他属性
        managerService.updateById(manager);
        return Result.success();
    }


    @AuthAccess
    @GetMapping("/recommend")
    public Result recommend(){
        List<Manager> list = managerService.recomend();
        return Result.success(list);
    }

    /*
     * 删除
     * @PathVariable 指定路径
     * */
    @HoneyLogs(operation = "咖啡管理",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        managerService.removeById(id);  //通过id删除一个用户

        return Result.success();
    }

    /*
     * 批量删除
     * */
    @HoneyLogs(operation = "咖啡管理",type = LogType.BATCH_DELETE)
    @DeleteMapping("/delete/batch")
    public Result batchdelete(@RequestBody List<Integer> ids){

        managerService.removeBatchByIds(ids);

        return Result.success();
    }

    @AuthAccess
    @GetMapping("/selectall")
    public Result selectall(){
        List<Manager> users = managerService.list(new QueryWrapper<Manager>().orderByDesc("id"));  //list 为查询所有


        return Result.success(users);
    }

    @AuthAccess
    @GetMapping("/selectAll")
    public Result selectAll(){

        List<Manager> managers = managerMapper.selectAll();

        return Result.success(managers);
    }


    @AuthAccess
    @GetMapping("/eachmanager")
    public Result allEach(@RequestParam Integer eachffid){

        List<Manager> managerList = managerDao.findAllByeachffid(eachffid);

        return Result.success(managerList);
    }


    @AuthAccess
    @GetMapping("/{id}")
    public Result selectId(@PathVariable Integer id){

        Manager manager = managerService.getById(id);

        List<Specs> list = specsService.list(new QueryWrapper<Specs>().eq("managerid",id));


        manager.setSpecs(list);

        return Result.success(manager);
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
                             @RequestParam String price,
                             @RequestParam String name){
        QueryWrapper<Manager> queryWrapper = new QueryWrapper<Manager>().orderByDesc("id");

        queryWrapper.like(StrUtil.isNotBlank(name),"name",name);
        queryWrapper.like(StrUtil.isNotBlank(price),"price",price);


        Page<Manager> page = managerService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Manager> records = page.getRecords();

        for(int i = 0; i < records.size(); i++){
            Integer userid = records.get(i).getUserid();
            Integer eachffId = records.get(i).getEachffid();
            User byId = userService.getById(userid);
            Each byId1 = eachService.getById(eachffId);
            if(byId != null && byId1 != null){
                records.get(i).setUser(byId.getName());
                byId1.getName();
                records.get(i).setEachffname(byId1.getName());
            }

            //规格
            QueryWrapper<Specs> queryWrapper1 = new QueryWrapper<Specs>().orderByDesc("id");
            queryWrapper1.lambda().eq(Specs::getManagerid,records.get(i).getId());  //查询specs里的咖啡和manager里面咖啡对比
            //将specs表里的数据传给 manager里的Specs数组
            List<Specs> list = specsService.list(queryWrapper1);
            records.get(i).setSpecs(list);
        }

        return Result.success(page);

    }


    @AuthAccess
    @GetMapping("/selectPage1")
    public Result selectPage1(@RequestParam Integer pageNum,
                              @RequestParam Integer pageSize,
                              @RequestParam Integer eachffid){
        QueryWrapper<Manager> queryWrapper = new QueryWrapper<Manager>().orderByDesc("id");

       queryWrapper.eq("eachffid",eachffid);

        Page<Manager> page = managerService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Manager> records = page.getRecords();

        for(int i = 0; i < records.size(); i++){
            Integer userid = records.get(i).getUserid();
            Integer eachffId = records.get(i).getEachffid();
            User byId = userService.getById(userid);
            Each byId1 = eachService.getById(eachffId);
            if(byId != null && byId1 != null){
                records.get(i).setUser(byId.getName());
                byId1.getName();
                records.get(i).setEachffname(byId1.getName());
            }

            //规格
            QueryWrapper<Specs> queryWrapper1 = new QueryWrapper<Specs>().orderByDesc("id");
            queryWrapper1.lambda().eq(Specs::getManagerid,records.get(i).getId());  //查询specs里的咖啡和manager里面咖啡对比
            //将specs表里的数据传给 manager里的Specs数组
            List<Specs> list = specsService.list(queryWrapper1);
            records.get(i).setSpecs(list);
        }

        return Result.success(page);

    }


    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @return
     */
    @AuthAccess
    @GetMapping("/selectPage2")
    public Result selectPage2(@RequestParam Integer pageNum,
                             @RequestParam Integer pageSize
                                  ){
        QueryWrapper<Manager> queryWrapper = new QueryWrapper<Manager>().orderByDesc("id");

        queryWrapper.eq("status",1);

        Page<Manager> page = managerService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Manager> records = page.getRecords();

        for(int i = 0; i < records.size(); i++){
            Integer userid = records.get(i).getUserid();
            Integer eachffId = records.get(i).getEachffid();
            User byId = userService.getById(userid);
            Each byId1 = eachService.getById(eachffId);
            if(byId != null && byId1 != null){
                records.get(i).setUser(byId.getName());
                byId1.getName();
                records.get(i).setEachffname(byId1.getName());
            }

            //规格
            QueryWrapper<Specs> queryWrapper1 = new QueryWrapper<Specs>().orderByDesc("id");
            queryWrapper1.lambda().eq(Specs::getManagerid,records.get(i).getId());  //查询specs里的咖啡和manager里面咖啡对比
            //将specs表里的数据传给 manager里的Specs数组
            List<Specs> list = specsService.list(queryWrapper1);
            records.get(i).setSpecs(list);
        }

        return Result.success(page);

    }
}
