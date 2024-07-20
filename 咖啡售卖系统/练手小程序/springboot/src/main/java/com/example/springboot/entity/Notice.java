package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("notice")
public class Notice {

    @TableId(type = IdType.AUTO)  // id 自增
    private int id;

    private String title;
    private String content;
    private String time;
    private String userid;
    private Boolean open;

    //这个字段在数据库里不存在，用来做业务处理
    @TableField(exist = false)
    private String user;
}
