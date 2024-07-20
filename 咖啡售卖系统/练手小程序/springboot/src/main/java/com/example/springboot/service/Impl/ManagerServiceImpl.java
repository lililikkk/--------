package com.example.springboot.service.Impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.*;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.ManagerMapper;
import com.example.springboot.service.*;
import com.example.springboot.utils.TokenUtils;
import com.example.springboot.utils.UserCF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ManagerServiceImpl extends ServiceImpl<ManagerMapper, Manager> implements ManagerService {




    public Manager selectName(String name){
        QueryWrapper<Manager> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name",name);

        //根据页面给的 name  在数据库中查询是否存在
        return getOne(queryWrapper);
    }

    @Autowired
    SpecsService specsService;

    @Transactional    // 多张表 开启事务
    @Override
    public void add(Manager manager) {
        Manager manager1 = selectName(manager.getName());
        if(manager1 != null){
            throw new ServiceException("此咖啡已存在");
        }else{
            this.save(manager);
        }
    }

    @Autowired
    CarService carService;

    @Autowired
    PorderService porderService;

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @Autowired
    ManagerMapper managerMapper;

    @Override
    public List<Manager> recomend() {

        User currentUser = TokenUtils.getCurrentUser();
        if (ObjectUtil.isEmpty(currentUser)) {
            // 没有用户登录
            return new ArrayList<>();
        }

        // 用户的哪些行为可以认为他跟商品产生了关系？收藏、加入购物车、下单、评论
       /* // 1. 获取所有的收藏信息
        List<Collect> allCollects = collectMapper.selectAll(null);*/
        // 2. 获取所有的购物车信息
        List<Car> allCarts = carService.list();
        // 3. 获取所有的订单信息
        List<Porder> allOrders = porderService.list();
        // 4. 获取所有的评论信息
        List<Comment> list = commentService.list();
        // 5. 获取所有的用户信息
        List<User> allUsers = userService.list();
        // 6. 获取所有的商品信息
        List<Manager> list1 = managerMapper.selectAll();

        // 定义一个存储每个商品和每个用户关系的List
        List<RelateDTO> data = new ArrayList<>();
        // 定义一个存储最后返回给前端的商品List
        List<Manager> result = new ArrayList<>();

        // 开始计算每个商品和每个用户之间的关系数据
        for (Manager goods : list1) {
            Integer managerid = goods.getId();
            for (User user : allUsers) {
                Integer userId = user.getId();
                int index = 1;
               /* // 1. 判断该用户有没有收藏该商品，收藏的权重我们给 1
                Optional<Collect> collectOptional = allCollects.stream().filter(x -> x.getGoodsId().equals(goodsId) && x.getUserId().equals(userId)).findFirst();
                if (collectOptional.isPresent()) {
                    index += 1;
                }*/
                // 2. 判断该用户有没有给该商品加入购物车，加入购物车的权重我们给 2
                Optional<Car> cartOptional = allCarts.stream().filter(x -> x.getManagerid().equals( managerid) && x.getUserid().equals(userId)).findFirst();
                if (cartOptional.isPresent()) {
                    index += 2;
                }
                // 3. 判断该用户有没有对该商品下过单（已完成的订单），订单的权重我们给 3
                Optional<Porder> ordersOptional = allOrders.stream().filter(x -> x.getManagerid().equals( managerid) && x.getUserid().equals(userId)).findFirst();
                if (ordersOptional.isPresent()) {
                    index += 3;
                }
                // 4. 判断该用户有没有对该商品评论过，评论的权重我们给 2
                Optional<Comment> commentOptional = list.stream().filter(x -> x.getFid().equals( managerid) && x.getUserid().equals(userId)).findFirst();
                if (commentOptional.isPresent()) {
                    index += 2;
                }
                if (index > 1) {
                    RelateDTO relateDTO = new RelateDTO(userId, managerid,index);
                    data.add(relateDTO);
                }
            }
        }

        // 数据准备结束后，就把这些数据一起喂给这个推荐算法
        List<Integer> goodsIds = UserCF.recommend(currentUser.getId(), data);
        // 把商品id转换成商品
        List<Manager> recommendResult = goodsIds.stream().map( managerid -> list1.stream()
                        .filter(x -> x.getId().equals( managerid)).findFirst().orElse(null))
                .limit(10).collect(Collectors.toList());

        //        if (CollectionUtil.isEmpty(recommendResult)) {
        //            // 随机给它推荐10个
        //            return getRandomGoods(10);
        //        }
        //        if (recommendResult.size() < 10) {
        //            int num = 10 - recommendResult.size();
        //            List<Goods> list = getRandomGoods(num);
        //            result.addAll(list);
        //        }
        return recommendResult;
    }
}
