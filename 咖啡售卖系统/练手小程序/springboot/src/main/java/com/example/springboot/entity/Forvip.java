package com.example.springboot.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigDecimal;

@Data
@TableName("forvip")  //数据库表名
@Entity
public class Forvip {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO) //id自增的
    private Integer id;

    private String vipname;
    private String time;
    private Integer userid;
    private String vipfid;

    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String uname;





}
