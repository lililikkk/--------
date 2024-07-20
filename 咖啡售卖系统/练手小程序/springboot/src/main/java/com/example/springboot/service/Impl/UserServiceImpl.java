package com.example.springboot.service.Impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.ForgetPass;
import com.example.springboot.entity.User;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.UserMapper;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService{

    @Resource   //和@Autowired 自动装配一样功能
    UserMapper userMapper;



    @Override
    public boolean save(User entity) {
        if(StrUtil.isBlank(entity.getName())){
            entity.setName(entity.getUsername());  //默认名字
        }
        if(StrUtil.isBlank(entity.getPassword())){  //默认密码
            entity.setPassword("123");
        }
        if(StrUtil.isBlank(entity.getRole())){  //默认密码
            entity.setRole("用户");
        }
        return super.save(entity);
    }


    public User selectByUserName(String username){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();  //条件查询器
        queryWrapper.eq("username",username);  // eq  =>  ==    where username=#{username}

        //根据用户名查询用户信息
        return getOne(queryWrapper); //select * from user where username = #{username}
    }

    /*
     * 验证登录功能
     * */
    public User login(User user) {

        User dbuser = selectByUserName(user.getUsername());

        if(dbuser == null){
            //抛出自定义异常
            throw new ServiceException("用户名或密码错误");
        }
        if(!user.getPassword().equals(dbuser.getPassword()) ){
            throw new ServiceException("用户名或密码错误");
        }

        //生成Token
        String token = TokenUtils.createToken(dbuser.getId().toString(), dbuser.getPassword());
        dbuser.setToken(token);

        return dbuser;
    }

    /*
     * 注册功能
     * */
    public User register(User user) {
        //查看用户是否存在
        User dbuser = selectByUserName(user.getUsername());
        if(dbuser != null){
            //抛出自定义异常
            throw new ServiceException("用户名已存在");
        }
        user.setName(user.getUsername());  //将账号作为昵称
        userMapper.insert(user);
        return user;
    }

    /*
     * 忘记密码
     * */
    public void resetpassword(ForgetPass forgetPass) {
        User dbuser = selectByUserName(forgetPass.getUsername()); //查看数据库是否存在用户名
        if(dbuser == null){
            //抛出自定义异常
            throw new ServiceException("用户不存在");
        }
        if(!forgetPass.getPhone().equals(dbuser.getPhone())){
            throw new ServiceException("手机号不正确");
        }
        dbuser.setPassword("123"); //重置密码
        updateById(dbuser);
    }

    @Override
    public void saveid(String vipfid) {

    }


}
