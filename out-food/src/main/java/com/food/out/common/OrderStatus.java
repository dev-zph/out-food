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
	MAIJIA_QUREN(0,"客户确认下单"),MAJIA_QUREN(1,"卖家确认"),QISHI_JIEDANG(2,"骑士接单"),ORDER_ARRIVE(3,"订单送达"),EVALUATE(4,"买家已经评价"),CANALE(5,"订单已取消"),ORDER_STATUS_UNKNOW(99, "nihao");
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
