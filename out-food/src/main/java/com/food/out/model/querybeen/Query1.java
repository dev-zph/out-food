/**
 * 
 */
package com.food.out.model.querybeen;

/**
 * @author 陈佳
 * @createTime 2017年2月10日 下午3:33:32
 * 
 */
public class Query1 {
	private Integer userId;
	private String status;
	private String startDate;
	private String endDate;
	private String orderNum;
	public Query1() {
		
	}
	
	/**
	 * @param userId
	 * @param status
	 * @param startDate
	 * @param endDate
	 */
	public Query1(Integer userId, String status, String startDate, String endDate,String orderNum) {
		super();
		this.userId = userId;
		this.status = status;
		this.startDate = startDate;
		this.endDate = endDate;
		this.orderNum = orderNum;
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
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the startDate
	 */
	public String getStartDate() {
		return startDate;
	}
	/**
	 * @param startDate the startDate to set
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	/**
	 * @return the endDate
	 */
	public String getEndDate() {
		return endDate;
	}
	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
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
	
}
