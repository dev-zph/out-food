/**
 * 
 */
package com.food.out.model.querybeen;

import java.math.BigDecimal;
import java.util.List;

import com.food.out.model.OrderDetail;

/**
 * @author 陈佳
 * @createTime 2017年2月13日 下午3:10:12
 * 
 */
public class OrderDetailBean {
	private Integer status;
	private String  orderNum;
	private BigDecimal price;
	private String  shopName;
	private String nickName;
	private String phone;
	
	private List<OrderDetail> detailList;
	/**
	 * @return the status
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * @return the orderNum
	 */
	public String getOrderNum() {
		return orderNum;
	}
	/**
	 * @param orderNum the orderNum to set
	 */
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	/**
	 * @return the price
	 */
	public BigDecimal getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
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
	 * @return the nickName
	 */
	public String getNickName() {
		return nickName;
	}
	/**
	 * @param nickName the nickName to set
	 */
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the detailList
	 */
	public List<OrderDetail> getDetailList() {
		return detailList;
	}
	/**
	 * @param detailList the detailList to set
	 */
	public void setDetailList(List<OrderDetail> detailList) {
		this.detailList = detailList;
	}

	
	
}
