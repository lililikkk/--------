package com.example.springboot.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Specs;
import com.example.springboot.mapper.SpecsMapper;
import com.example.springboot.service.SpecsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpecsServiceImpl extends ServiceImpl<SpecsMapper, Specs> implements SpecsService {


}
