package com.example.springboot.dto;

public class RelateDTO {
    /** 用户id */
    private Integer useid;
    /** 商品id */
    private Integer goodsid;
    /** 指数 */
    private Integer index;

    public RelateDTO(Integer useid, Integer goodsid, Integer index) {
        this.useid = useid;
        this.goodsid = goodsid;
        this.index = index;
    }
}
