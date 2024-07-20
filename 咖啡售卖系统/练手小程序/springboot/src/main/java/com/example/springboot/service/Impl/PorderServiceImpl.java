package com.example.springboot.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Car;
import com.example.springboot.entity.Porder;
import com.example.springboot.mapper.CarMapper;
import com.example.springboot.mapper.PorderMapper;
import com.example.springboot.service.CarService;
import com.example.springboot.service.PorderService;
import org.springframework.stereotype.Service;

@Service
public class PorderServiceImpl extends ServiceImpl<PorderMapper, Porder> implements PorderService {
}
