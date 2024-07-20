package com.example.springboot.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import com.example.springboot.dao.CommentDao;
import com.example.springboot.entity.Comment;
import com.example.springboot.entity.Each;
import com.example.springboot.entity.Manager;
import com.example.springboot.entity.User;
import com.example.springboot.service.CommentService;
import com.example.springboot.service.ManagerService;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
@RequestMapping("/comment")
public class CommentController {


    @Autowired
    CommentService commentService;
    @Autowired
    UserService userService;

    @Autowired
    ManagerService managerService;

    @Resource
    CommentDao commentDao;
    private Comment comment;


    @PostMapping
    public Result add(@RequestBody Comment comment){

        commentService.save(comment);
        return Result.success();
    }

    @AuthAccess
    @GetMapping
    public Result list(@RequestParam Integer fid){

        Map<String,Object> map = new HashMap<>();

        List<Comment> comments = commentDao.findAllByfid(fid);

        map.put("rate", BigDecimal.ZERO);
        List<Comment> commentList = comments.stream().filter(comment -> comment.getRate() != null).collect(Collectors.toList());
        commentList.stream().map(Comment::getRate).reduce(BigDecimal::add).ifPresent(res ->{
            map.put("rate", res.divide(BigDecimal.valueOf(commentList.size()),1, RoundingMode.HALF_UP));
        });

        List<Comment> root = comments.stream().filter(comment -> comment.getPid() == null).collect(Collectors.toList());

        for (Comment rootcomment : root) {
            rootcomment.setChildren(comments.stream().filter(comment -> rootcomment.getId().equals(comment.getPid())).collect(Collectors.toList()));
        }

        map.put("comments", root);

        return Result.success(map);
    }

    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @return
     */
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam Integer pageNum,
                             @RequestParam Integer pageSize){

        QueryWrapper<Comment> queryWrapper = new QueryWrapper<Comment>().orderByDesc("id");

        Page<Comment> page = commentService.page(new Page<>(pageNum, pageSize), queryWrapper);

        List<Comment> records = page.getRecords();

        for (Comment record : records) {
            Integer fid = record.getFid();
            Manager byId = managerService.getById(fid);
            if(byId != null){
                record.setPidname(byId.getName());
            }
        }

        return Result.success(page);

    }

    /*
     * 修改信息
     * @RequestBody  把对象转为JSON
     * */
    @HoneyLogs(operation = "咖啡分类",type = LogType.UPDATE)
    @PutMapping("/update")
    public Result update(@RequestBody Comment comment){

        commentService.updateById(comment);  //通过id修改

        return Result.success("修改成功");
    }

    @HoneyLogs(operation = "删除评论",type = LogType.DELETE)
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id){

        commentService.removeById(id);  //通过id删除一个用户

        return Result.success("删除成功");
    }

    /*
     * 根据id查询
     * */
    @AuthAccess
    @GetMapping("/selectall/{id}")
    public Result selectById(@PathVariable Integer id){

        return Result.success(commentService.getById(id));
    }

    /*
     * 新增信息
     * */
    @HoneyLogs(operation = "咖啡分类",type = LogType.ADD)  //自己写注解
    @PostMapping("/add")
    public Result save(@RequestBody Comment comment){

        User currentUser = TokenUtils.getCurrentUser(); //获取当前登录人信息

        comment.setUserid(Integer.valueOf(String.valueOf(currentUser.getId()))); //获得当前作者id

        comment.setCreatetime(LocalDateTime.parse(DateUtil.now())); //当前时间  xxx-xx-xx

        commentService.save(comment);

        return Result.success();
    }


}
