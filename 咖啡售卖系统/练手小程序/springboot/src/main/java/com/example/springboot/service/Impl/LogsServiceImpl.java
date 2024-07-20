package com.example.springboot.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Logs;
import com.example.springboot.mapper.LogsMapper;
import com.example.springboot.service.LogsService;
import org.springframework.stereotype.Service;

@Service
public class LogsServiceImpl extends ServiceImpl<LogsMapper, Logs> implements LogsService {
}
