package com.example.springboot.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springboot.entity.Each;
import com.example.springboot.entity.Manager;

import java.util.List;

public interface EachService extends IService<Each> {

    void remove(int id);


    void add(Each each);
}
