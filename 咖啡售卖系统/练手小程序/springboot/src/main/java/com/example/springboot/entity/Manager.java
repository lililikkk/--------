package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data
@TableName("manager")
@Entity
public class Manager {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO) //id自增的
    private Integer id;

    private String name;
    private Integer eachffid;
    //菜品价格
    private BigDecimal price;

    //商品码
    private String code;

    private String avatar;
    private String content;
    private Integer userid;
    private String time;
    private Boolean status;


    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String eachffname;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String user;


    @Transient
    @TableField(exist = false)
    private List<Specs> specs;
}
