package com.example.springboot.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springboot.entity.Manager;

import java.util.List;

public interface ManagerService extends IService<Manager> {

    void add(Manager manager);

    List<Manager> recomend();
}
