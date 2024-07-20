package com.example.springboot.entity;


import lombok.Data;


/*
* 忘记密码
* */

@Data
public class ForgetPass {

    private String username;  //用户名
    private String phone;   //手机号

}
