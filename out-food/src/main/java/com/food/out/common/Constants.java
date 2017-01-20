package com.food.out.common;

import java.util.HashMap;
import java.util.Map;

import com.food.out.utils.ConfigurableConstants;


public class Constants extends ConfigurableConstants{
	static {
		// init("ftp.properties");
		init("food.properties"); 
	}
	
	public static final String PAY_ALIPAY_PID = getValue("food_test_value");
	
	public static final Map<String, String> test_valueMap = new HashMap<String, String>();
	static {
		test_valueMap.put("1", "测试种类");
		test_valueMap.put("2", "测试种类二");
	}
	
	public static enum ABCPayType {
		// 1 未创建 2已创建导出任务系统正在执行导出job 3已执行完成并生成了报表4执行失败
		ABCPAY_STATUS_IMM(0, "ImmediatePay"), ABCPAY_STATUS_DIV(1, "DividedPay");
		private String name;
		private int code;

		ABCPayType(int code, String name) {
			this.code = code;
			this.name = name;
		}

		public static String getName(int code) {
			for (ABCPayType reportStatus : ABCPayType.values()) {
				if (reportStatus.getCode() == code) {
					return reportStatus.name;
				}
			}
			return getName(9);
		}

		public int getCode() {
			return code;
		}
	}
}
