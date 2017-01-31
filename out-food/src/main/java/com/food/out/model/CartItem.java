/**
 * 
 */
package com.food.out.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author 陈佳
 * @createTime 2017年1月23日 上午9:40:21
 * 
 */
public class CartItem {
	/**
	 * 主键Id
	 */
	private Integer id;
	/**
	 * 用户Id
	 */
	private Integer userId;
	/**
	 * itemId
	 */
	private Integer itemId;
	/**
	 * 购买数量
	 */
	private Integer buyCount;
	/**
	 * 添加时间
	 */
	private Date addTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;
	/**
	 * 状态 0有效1无效
	 */
	private String deleted;
	/**
	 * 店铺id
	 */
	private Integer shopId;
	
	
	//非持久化字段
	/**
	 * 店铺名称
	 */
	private String shopName;
	/**
	 * 商品名称
	 */
	private String itemName;
	/**
	 * 商品单价
	 */
	private BigDecimal itemPrice;
	/**
	 * 配送费
	 */
	private BigDecimal sendMon;
	/**
	 * 打包费
	 */
	private BigDecimal packageMon;
	
	
	
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the userId
	 */
	public Integer getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	/**
	 * @return the itemId
	 */
	public Integer getItemId() {
		return itemId;
	}
	/**
	 * @param itemId the itemId to set
	 */
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	/**
	 * @return the buyCount
	 */
	public Integer getBuyCount() {
		return buyCount;
	}
	/**
	 * @param buyCount the buyCount to set
	 */
	public void setBuyCount(Integer buyCount) {
		this.buyCount = buyCount;
	}
	/**
	 * @return the addTime
	 */
	public Date getAddTime() {
		return addTime;
	}
	/**
	 * @param addTime the addTime to set
	 */
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	/**
	 * @return the updateTime
	 */
	public Date getUpdateTime() {
		return updateTime;
	}
	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	/**
	 * @return the deleted
	 */
	public String getDeleted() {
		return deleted;
	}
	/**
	 * @param deleted the deleted to set
	 */
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	/**
	 * @return the shopId
	 */
	public Integer getShopId() {
		return shopId;
	}
	/**
	 * @param shopId the shopId to set
	 */
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	/**
	 * @return the shopName
	 */
	public String getShopName() {
		return shopName;
	}
	/**
	 * @param shopName the shopName to set
	 */
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	/**
	 * @return the itemName
	 */
	public String getItemName() {
		return itemName;
	}
	/**
	 * @param itemName the itemName to set
	 */
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	/**
	 * @return the itemPrice
	 */
	public BigDecimal getItemPrice() {
		return itemPrice;
	}
	/**
	 * @param itemPrice the itemPrice to set
	 */
	public void setItemPrice(BigDecimal itemPrice) {
		this.itemPrice = itemPrice;
	}
	/**
	 * @return the sendMon
	 */
	public BigDecimal getSendMon() {
		return sendMon;
	}
	/**
	 * @param sendMon the sendMon to set
	 */
	public void setSendMon(BigDecimal sendMon) {
		this.sendMon = sendMon;
	}
	/**
	 * @return the packageMon
	 */
	public BigDecimal getPackageMon() {
		return packageMon;
	}
	/**
	 * @param packageMon the packageMon to set
	 */
	public void setPackageMon(BigDecimal packageMon) {
		this.packageMon = packageMon;
	}
}
