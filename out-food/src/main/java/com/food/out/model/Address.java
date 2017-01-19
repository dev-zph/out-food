package com.food.out.model;

import java.util.Date;

public class Address {
    private Integer id;

    private Integer userId;

    private String phone;

    private String connectName;

    private Byte sex;

    private Date creatTime;

    private Byte isDef;

    private Byte idDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getConnectName() {
        return connectName;
    }

    public void setConnectName(String connectName) {
        this.connectName = connectName == null ? null : connectName.trim();
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Byte getIsDef() {
        return isDef;
    }

    public void setIsDef(Byte isDef) {
        this.isDef = isDef;
    }

    public Byte getIdDel() {
        return idDel;
    }

    public void setIdDel(Byte idDel) {
        this.idDel = idDel;
    }
}