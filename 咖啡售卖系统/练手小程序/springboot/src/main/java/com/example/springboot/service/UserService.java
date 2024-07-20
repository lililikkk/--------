package com.example.springboot.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springboot.entity.ForgetPass;
import com.example.springboot.entity.User;

public interface UserService extends IService<User> {

    public boolean save(User entity);

    public User login(User user);

    public User selectByUserName(String username);

    public User register(User user);

    public void resetpassword(ForgetPass forgetPass);

    void saveid(String vipfid);
}
