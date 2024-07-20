package com.example.springboot.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("porder_manager")  //数据库表名
public class PorderManager {

    @TableId(type = IdType.AUTO)  // id 自增
    private Integer id;

    private Integer managerid; //商品id
    private Integer orderid;  //订单id
    private Integer num;

}
