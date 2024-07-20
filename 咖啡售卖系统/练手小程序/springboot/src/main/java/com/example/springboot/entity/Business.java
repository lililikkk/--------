package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;


@Data
public class Business {

    @TableId(type = IdType.AUTO)  // id 自增
    private int id;

    private String username;
    private String password;
    private String name;
    private String avatar;
    private String role;
    private String phone;
    private String info;
    private String address;
    private String license;
    private String status;

}
