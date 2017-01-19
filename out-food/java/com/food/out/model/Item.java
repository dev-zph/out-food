package com.food.out.model;

import java.math.BigDecimal;
import java.util.Date;

public class Item {
    private Integer id;

    private Integer shopId;
    
    private Integer shopItemClassId;

    private String itemName;

    private String itemImg;

    private BigDecimal itemPrice;

    private String monthTradeCount;

    private String recommendCount;

    private Date creatTime;

    private Date updateTime;

    private Integer status;

    private Integer isDel;

    private String describe;
    
    private String dayStock;
    

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
    }

    public String getItemImg() {
        return itemImg;
    }

    public void setItemImg(String itemImg) {
        this.itemImg = itemImg == null ? null : itemImg.trim();
    }

    public BigDecimal getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(BigDecimal itemPrice) {
        this.itemPrice = itemPrice;
    }

    public String getMonthTradeCount() {
        return monthTradeCount;
    }

    public void setMonthTradeCount(String monthTradeCount) {
        this.monthTradeCount = monthTradeCount == null ? null : monthTradeCount.trim();
    }

    public String getRecommendCount() {
        return recommendCount;
    }

    public void setRecommendCount(String recommendCount) {
        this.recommendCount = recommendCount == null ? null : recommendCount.trim();
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

	public Integer getShopItemClassId() {
		return shopItemClassId;
	}

	public void setShopItemClassId(Integer shopItemClassId) {
		this.shopItemClassId = shopItemClassId;
	}

	public String getDayStock() {
		return dayStock;
	}

	public void setDayStock(String dayStock) {
		this.dayStock = dayStock;
	}
    
    
}