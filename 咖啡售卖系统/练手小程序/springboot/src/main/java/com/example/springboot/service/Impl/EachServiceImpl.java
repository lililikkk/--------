package com.example.springboot.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Each;
import com.example.springboot.entity.Manager;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.EachMapper;
import com.example.springboot.service.EachService;
import com.example.springboot.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.file.Watchable;
import java.util.Collections;
import java.util.List;

@Service
public class EachServiceImpl extends ServiceImpl<EachMapper, Each> implements EachService {

    @Autowired
    ManagerService managerService;

    @Override
    public void remove(int id) {

        LambdaQueryWrapper<Manager> queryWrapper = new LambdaQueryWrapper<>();

        queryWrapper.eq(Manager::getEachffid,id); // 要删除的 类的id 与咖啡中类的id对比

        long count = managerService.count(queryWrapper); // id相等的数量

        if(count > 0){
            throw new ServiceException("当前类中存在咖啡，不能删除");
        }else{
            super.removeById(id);
        }
    }


   /* @Override
    public void deletemore(List<Integer> ids) {

        int count = 0;

        int n = ids.size();

        LambdaQueryWrapper<Manager> queryWrapper = new LambdaQueryWrapper<>();

        for (Integer id : ids) {
            queryWrapper.eq(Manager::getEachffid, id); // 要删除的 类的id 与咖啡中类的id对比

            count = (int) managerService.count(queryWrapper); // id相等的数量

            count+=count;

            n-=1;

            if(n > 0){
                continue;
            }
        }
        if(count > 0){
            throw new ServiceException("当前类中存在咖啡，不能删除");
        }else{
            super.removeBatchByIds(ids);
        }

    }*/


    public Each selectName(String name){
        QueryWrapper<Each> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name",name);

        //根据页面给的 name  在数据库中查询是否存在
        return getOne(queryWrapper);
    }


    @Override
    public void add(Each each) {
        Each manager1 = selectName(each.getName());
        if(manager1 != null){
            throw new ServiceException("此类已存在");
        }else{
            this.save(each);
        }
    }
}
