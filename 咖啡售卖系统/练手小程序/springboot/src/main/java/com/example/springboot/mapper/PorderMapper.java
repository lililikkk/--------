package com.example.springboot.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.entity.Car;
import com.example.springboot.entity.Porder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PorderMapper extends BaseMapper<Porder> {


    Page<Porder> page(Page<Object> objectPage, Integer userId, String role, String name);
}
