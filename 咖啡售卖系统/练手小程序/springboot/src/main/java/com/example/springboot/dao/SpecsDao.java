package com.example.springboot.dao;

import com.example.springboot.entity.Specs;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SpecsDao extends JpaRepository<Specs,String> {



}
