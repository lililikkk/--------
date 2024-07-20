package com.example.springboot.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.hibernate.annotations.GenericGenerators;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@TableName("comment")  //数据库表名
@Entity
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @TableId(type = IdType.AUTO) //id自增的
    private Integer id;

    private String content;
    private String username;
    private Integer userid;
    private BigDecimal rate;
    private Integer fid;
    private Integer pid;
    private String target;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createtime;


    @Transient
    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private List<Comment> children;

    @Transient
    @TableField(exist = false)  //表示数据库中不存在token这个字段
    private String pidname;

}
