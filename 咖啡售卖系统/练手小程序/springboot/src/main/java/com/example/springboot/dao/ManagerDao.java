package com.example.springboot.dao;

import com.example.springboot.entity.Manager;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ManagerDao extends JpaRepository<Manager,Integer> {

    List<Manager> findAllByeachffid(Integer eachffid);

}
