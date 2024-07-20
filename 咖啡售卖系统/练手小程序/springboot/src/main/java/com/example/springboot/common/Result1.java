package com.example.springboot.common;

import java.util.Map;

public class Result1<T>{


    private Map<Object, Object> resultMap;

    public void Result(Map<Object, Object> resultMap) {
        this.resultMap = resultMap;
    }

    public Map<Object, Object> getResultMap() {
        return resultMap;
    }

    public Map<Object, Object> getResultMap1() {
        return (Map<Object, Object>) new Result();
    }

    public void setResultMap(Map<Object, Object> resultMap) {
        this.resultMap = resultMap;
    }

}


