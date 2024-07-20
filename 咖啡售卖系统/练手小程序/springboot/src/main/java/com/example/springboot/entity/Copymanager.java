package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class Copymanager {

    @TableId(type = IdType.AUTO)  // id 自增
    private Integer id;

    private String name;
    private String eachffid;
    //菜品价格
    private String price;

    //商品码
    private String code;

    private String avatar;
    private String content;
    private String userid;
    private String time;
    private Boolean status;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String user;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String eachffName;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private List<Specs> specs = new ArrayList<>();

}
