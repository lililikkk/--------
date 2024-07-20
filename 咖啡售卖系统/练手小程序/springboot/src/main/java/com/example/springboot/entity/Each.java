package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;


@Data
@TableName("eachff")  //数据库表名
public class Each {

    @TableId(type = IdType.AUTO)  // id 自增
    private Integer id;

    private String name;
    private String userid;
    private String time;
    private String avatar;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String user;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private List<Manager> goods = new ArrayList<>();
}
