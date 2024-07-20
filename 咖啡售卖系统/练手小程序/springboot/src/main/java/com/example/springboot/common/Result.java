package com.example.springboot.common;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data  /*@Get and @Set 自动创建了get和set方法*/
@AllArgsConstructor  /* 所有属性的创造函数 */
@NoArgsConstructor   /* 创建无参构造 */
@Builder
public class Result {



    public static final String CODE_SUCCESS = "200";
    public static final String CODE_AUTH_ERROR = "401";
    public static final String CODE_SYS_ERROR = "500";

    /*
    * code:请求的返回编码： 200 401(没有权限) 404(没有资源) 500(系统错误)
    * 作用：可以看出失败的类型
    * */
    private String code;
    /*
    * msg:表示错误的详细信息
    * */
    private String msg;
    /*
    * 数据从什么地方返回出去？  就是这个data
    * */
    private Object data;



    public static Result success(){
        return new Result(CODE_SUCCESS,"请求成功",null);
    }

    public static Result success(Object data){
        return new Result(CODE_SUCCESS,"请求成功",data);
    }

    public static Result error(String msg){
        return new Result(CODE_SYS_ERROR,msg,null);
    }

    public static Result error(String code , String msg){
        return new Result(code,msg,null);
    }

    public static Result error(){
        return new Result(CODE_SYS_ERROR,"系统错误",null);
    }

    }

