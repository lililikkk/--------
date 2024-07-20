package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
@TableName("specs")
@Entity
public class Specs {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id = java.util.UUID.randomUUID().toString();

    private Integer managerid; // 一般情况下，外键类型使用包装类更合适
    private String specsname;
    private String temp;

}
