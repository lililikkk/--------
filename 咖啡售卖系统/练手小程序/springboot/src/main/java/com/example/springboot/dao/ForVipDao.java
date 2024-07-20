package com.example.springboot.dao;

import com.example.springboot.entity.Comment;
import com.example.springboot.entity.Forvip;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ForVipDao extends JpaRepository<Forvip,Integer> {

    List<Forvip> findAllByuserid(Integer userid);
}
