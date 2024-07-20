package com.example.springboot.dao;

import com.example.springboot.entity.Porder;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PorderDao extends JpaRepository<Porder,Integer> {

    List<Porder> findAllBymanagerid(Integer managerid);

}
