package com.example.springboot.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@TableName("car")  //数据库表名
@JsonIgnoreProperties(ignoreUnknown = true)
public class Car {

    @TableId(type = IdType.AUTO)  // id 自增
    private Integer id;

    private Integer managerid;
    private Integer userid;
    private Integer num;
    private String time;
    private String specsname;
    private String temp;


    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String user;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String manager;  //商品名称

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String managerAvatar;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private BigDecimal price;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String nickname;


}
