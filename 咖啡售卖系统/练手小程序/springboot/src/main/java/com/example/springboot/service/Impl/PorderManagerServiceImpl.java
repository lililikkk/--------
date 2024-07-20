package com.example.springboot.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Car;
import com.example.springboot.entity.PorderManager;
import com.example.springboot.mapper.CarMapper;
import com.example.springboot.mapper.PorderManagerMapper;
import com.example.springboot.service.CarService;
import com.example.springboot.service.PorderManagerService;
import org.springframework.stereotype.Service;

@Service
public class PorderManagerServiceImpl extends ServiceImpl<PorderManagerMapper,PorderManager> implements PorderManagerService{
}
