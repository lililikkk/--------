package com.example.springboot.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Advertising;
import com.example.springboot.entity.Manager;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.AdvertisingMapper;
import com.example.springboot.service.AdvertisingService;
import org.springframework.stereotype.Service;

@Service
public class AdvertisingServiceImpl extends ServiceImpl<AdvertisingMapper, Advertising> implements AdvertisingService {

    public Advertising selectName(String title){
        QueryWrapper<Advertising> queryWrapper = new QueryWrapper<>();

        queryWrapper.eq("title",title);

        //根据页面给的 name  在数据库中查询是否存在
        return getOne(queryWrapper);
    }



    @Override
    public void add(Advertising advertising) {
        Advertising advertising1 = selectName(advertising.getTitle());

        if(advertising1 != null){
            throw new ServiceException("此标题已存在");
        }else{
            this.save(advertising);
        }
    }
}
