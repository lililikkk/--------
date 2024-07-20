package com.example.springboot.entity;


import lombok.Data;
@Data
public class RelateDTO {

    /** 用户id */
    private Integer useId;
    /** 商品id */
    private Integer Managerid;
    /** 指数 */
    private Integer index;

    public RelateDTO(Integer useId, Integer Managerid, Integer index) {
        this.useId = useId;
        this.Managerid = Managerid;
        this.index = index;
    }
}
