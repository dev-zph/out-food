/**
 * 
 */
package com.food.out.model;

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
	
	
}
