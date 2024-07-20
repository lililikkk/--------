package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("user")

public class User {
    @TableId(type = IdType.AUTO)  // id 自增
    private Integer id;

    private String username;
    private String password;
    private String name;
    private String avatar;
    private String role;
    private String phone;
    private String email;
    private String sex;
    private String address;
    private String time;
    private Boolean open;


    private String vipfid;

    public User(String vipfid) {
        this.vipfid = vipfid;
    }



    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String token;


    private String vipname;

}
