package com.food.out.model;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
	/**
	 * 订单编号
	 */
	private Integer id;
	/**
	 * 买家id
	 */
	private Integer userId;
	/**
	 * 店铺id
	 */
	private Integer shopId;
	/**
	 * 订单号
	 */
	private String orderNum;
	/**
	 * 订单价格
	 */
	private BigDecimal orderPrice;
	/**
	 * 添加时间
	 */
	private Date createTime;
	/**
	 * 预期时间
	 */
	private Date overTime;
	/**
	 * 订单状态
	 */
	private Integer status;
	/**
	 * 
	 */
	private Date preSendTime;
	/**
	 * 逻辑
	 */
	private String isDel;
	/**
	 * 配送地址
	 */
	private String address;
	/**
	 * 评价状态
	 */
	private Integer isGood;
	/**
	 * 评价信息
	 */
	private String comment;
	/**
	 * 更新时间
	 */
	private Date updateTime;
	// 非持久化属性
	private String userName;
	private String phone;

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

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	/**
	 * @return the orderPrice
	 */
	public BigDecimal getOrderPrice() {
		return orderPrice;
	}

	/**
	 * @param orderPrice
	 *            the orderPrice to set
	 */
	public void setOrderPrice(BigDecimal orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getOverTime() {
		return overTime;
	}

	public void setOverTime(Date overTime) {
		this.overTime = overTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getPreSendTime() {
		return preSendTime;
	}

	public void setPreSendTime(Date preSendTime) {
		this.preSendTime = preSendTime;
	}

	public String getIsDel() {
		return isDel;
	}

	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName
	 *            the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the isGood
	 */
	public Integer getIsGood() {
		return isGood;
	}

	/**
	 * @param isGood
	 *            the isGood to set
	 */
	public void setIsGood(Integer isGood) {
		this.isGood = isGood;
	}

	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * @param comment
	 *            the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
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

}