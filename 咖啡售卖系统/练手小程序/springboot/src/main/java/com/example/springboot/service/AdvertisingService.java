package com.example.springboot.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springboot.entity.Advertising;
import com.example.springboot.entity.Manager;

public interface AdvertisingService extends IService<Advertising> {
    void add(Advertising advertising);
}
