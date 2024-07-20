package com.example.springboot.common;

public enum LogType {

    /*
    * 系统操作日志的类型枚举  可以自己定义 增删改查等
    * */

    ADD("新增"),UPDATE("修改"),DELETE("删除"),BATCH_DELETE("批量删除"),LOGIN("登录"),REGISTER("注册");

    private String value;

    public String getValue() {
        return value;
    }

    LogType(String value) {
        this.value = value;
    }
}
