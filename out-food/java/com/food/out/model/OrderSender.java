package com.food.out.model;

public class OrderSender {
    private Integer id;

    private Integer orderId;

    private Byte isGood;

    private Byte isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Byte getIsGood() {
        return isGood;
    }

    public void setIsGood(Byte isGood) {
        this.isGood = isGood;
    }

    public Byte getIsDel() {
        return isDel;
    }

    public void setIsDel(Byte isDel) {
        this.isDel = isDel;
    }
}