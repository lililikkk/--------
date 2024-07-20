package com.example.springboot.dao;

import com.example.springboot.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CommentDao extends JpaRepository<Comment,Integer> {

    List<Comment> findAllByfid(Integer fid);
}
