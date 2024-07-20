package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor  /* 创建构造器 */
@Builder

public class Logs {

    @TableId(type = IdType.AUTO) //id自增的
    private Integer id;
    private String operation;
    private String ip;
    private String user;
    private String time;
    private String type;


}
