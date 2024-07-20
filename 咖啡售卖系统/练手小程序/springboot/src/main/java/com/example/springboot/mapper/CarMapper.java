package com.example.springboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.entity.Car;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CarMapper extends BaseMapper<Car> {


     @Update("update car set num = #{num} where id = #{id}")
     void updateNum(@Param("num") Integer num, @Param("id") Integer id);

    Page<Car> page(Page<Object> objectPage, Integer userId, String role, String name);

}
