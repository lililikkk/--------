package com.example.springboot.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("advertising")
public class Advertising {

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String managerid;

    private String title;
    private String avatar;
    private Boolean status;
    private String userid;
    private String time;

    @TableField(exist = false)
    private String user;

    @TableField(exist = false)
    private String managername;
}
