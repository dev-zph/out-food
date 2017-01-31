/**
 * 
 */
package com.food.out.common;

/**
 * @author 陈佳
 * @createTime 2017年1月27日 下午1:52:08
 * 
 */
public enum OrderStatus {
	MAIJIA_QUREN(0,"客户确认下单"),MAJIA_QUREN(1,"卖家确认"),QISHI_DENGDAI(2,"等待骑士配送"),QISHI_JIEDANG(3,"骑接单"),ORDER_ARRIVE(4,"订单送达"),EVALUATE(5,"买家评价"),ORDER_STATUS_UNKNOW(99, "未知状态");
	private String name;
	private int code;

	OrderStatus(int code, String name) {
		this.code = code;
		this.name = name;
	}

	public static String getName(int code) {
		for (OrderStatus orderStatus : OrderStatus.values()) {
			if (orderStatus.getCode() == code) {
				return orderStatus.name;
			}
		}
		return getName(99);
	}

	public int getCode() {
		return code;
	}
}
