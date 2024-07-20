package com.example.springboot.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@TableName("porder")  //数据库表名
@Entity
public class Porder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO)  // id 自增
    private Integer id;

    private Integer userid;
    private Integer managerid;

    private String name;
    private String no;

    private BigDecimal totalprice;

    private String state;
    private String specsname;
    private String temp;

    private String time;
    private String paytime;

    @Transient
    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private List<Car> cars;

    @Transient
    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String username;

    @Transient
    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String nickname;




}
