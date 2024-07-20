package com.example.springboot.exception;


import com.example.springboot.common.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalException {

    //创建自定义异常

    @ExceptionHandler(ServiceException.class)
    @ResponseBody  //Result 转成json
    public Result serviceException(ServiceException e) {
        return Result.error(e.getCode(),e.getMessage());
    }

    /*
    * 全局异常
    * */
    @ExceptionHandler(Exception.class)
    @ResponseBody  //Result 转成json
    public Result globalException(Exception e) {
        e.printStackTrace(); //打印错误信息
        return Result.error("500","系统错误");
    }

}
