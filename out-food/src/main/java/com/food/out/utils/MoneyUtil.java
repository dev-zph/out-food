/**
 * @版权所有 城云科技（杭州）有限公司
 * 
 */
package com.food.out.utils;

import java.math.BigDecimal;

import org.apache.commons.lang.StringUtils;

import com.xianguo.platform.common.Constants;

/**
 * 金额计算
 * 
 * @author ubuntu
 *
 */
public class MoneyUtil {
	private static int SCALE = 2;

	public static BigDecimal getEarnesMoney(BigDecimal price) {
		BigDecimal earnestMoney = new BigDecimal(Constants.EARNEST_MONEY);
		BigDecimal limtUpMoney = new BigDecimal(Constants.LIMT_UP_MONEY);
		BigDecimal limtLowMoney = new BigDecimal(Constants.LIMT_LOW_MONEY);
		BigDecimal bd = price.multiply(earnestMoney);
		if (bd.compareTo(limtLowMoney) == -1) {
			return limtLowMoney;
		}
		if (bd.compareTo(limtUpMoney) == 1) {
			return limtUpMoney;
		} else {
			return bd.setScale(2, BigDecimal.ROUND_HALF_UP);
		}
	}

	public static BigDecimal getTotalPrice(BigDecimal price, BigDecimal count) {
		BigDecimal zeor = new BigDecimal(Constants.DATE_STATUS_ZEOR);
		if (zeor.compareTo(count) == 0) {
			return zeor;
		} else {
			return price.multiply(count).setScale(SCALE, BigDecimal.ROUND_HALF_UP);
		}
	}

	/**
	 * one * two 保留scale位
	 * 
	 * @param args1
	 * @param args2
	 * @param scale
	 * @return
	 */
	public static BigDecimal multipy(BigDecimal args1, BigDecimal args2, int scale) {
		return args1.multiply(args2).setScale(scale, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * 计算单价乘以数量，默认保留2位小数
	 * 
	 * @param args1
	 * @param args2
	 * @return
	 */
	public static BigDecimal multipy(BigDecimal args1, BigDecimal args2) {
		return multipy(args1, args2, SCALE);
	}

	/**
	 * 计算单价乘以数量
	 * 
	 * @param args1
	 * @param args2
	 * @return
	 */
	public static BigDecimal multipy(BigDecimal args1, Integer args2) {
		return multipy(args1, new BigDecimal(args2));
	}

	/**
	 * 计算单价乘以数量
	 * 
	 * @param args1
	 * @param args2
	 * @return
	 */
	public static BigDecimal multipy(BigDecimal args1, Integer args2, int scale) {
		return multipy(args1, new BigDecimal(args2), scale);
	}

	/**
	 * 两个Integer 相除
	 * 
	 * @param a
	 * @param divisor
	 * @param scale
	 * @param roundingMode
	 * @return
	 */
	public static BigDecimal divide(Integer dividend, Integer divisor, int scale, int roundingMode) {
		return new BigDecimal(dividend).divide(new BigDecimal(divisor), scale, roundingMode);
	}

	/**
	 * 两个Integer 相除，得到两位小数精度的数字,结果四舍五入
	 * 
	 * @param a
	 * @param divisor
	 * @param scale
	 * @param roundingMode
	 * @return
	 */
	public static BigDecimal divide(Integer dividend, Integer divisor) {
		return new BigDecimal(dividend).divide(new BigDecimal(divisor), SCALE, BigDecimal.ROUND_HALF_UP);
	}

	public static BigDecimal divide(BigDecimal dividend, BigDecimal divisor) {
		return dividend.divide(divisor, SCALE, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * 减法 args1 - args2 保留scale位
	 * 
	 * @param args1
	 * @param args2
	 * @param scale
	 * @return
	 */
	public static BigDecimal subtract(BigDecimal args1, BigDecimal args2, int scale) {
		return args1.subtract(args2).setScale(scale, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * 减法 args1 - args2 保留scale位
	 * 
	 * @param args1
	 * @param args2
	 * @param scale
	 * @return
	 */
	public static BigDecimal subtract(BigDecimal args1, BigDecimal args2) {
		return subtract(args1, args2, 2);
	}

	/**
	 * 加法保留2位
	 * 
	 * @param args1
	 * @param args2
	 * @param scale
	 * @return
	 */
	public static BigDecimal add(BigDecimal args1, BigDecimal args2, int scale) {
		return args1.add(args2).setScale(scale, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * 加法保留2位
	 * 
	 * @param args1
	 * @param args2
	 * @return
	 */
	public static BigDecimal add(BigDecimal args1, BigDecimal args2) {
		return add(args1, args2, SCALE);
	}

	public static boolean iseEmony(BigDecimal price) {
		BigDecimal isEmony = new BigDecimal(Constants.IS_EARNEST_MONEY);
		if (price.compareTo(isEmony) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isNumeric(String str) {
		return StringUtils.isNumeric(str);
	}

	/**
	 * 比较两个数字是否一样大，精度为小数点后2位，四舍五入
	 * 
	 * @param args1
	 * @param args2
	 * @return
	 */
	public static boolean equals(BigDecimal args1, BigDecimal args2) {
		if (args1 == null && args2 == null) {
			return true;
		}
		if ((args1 == null && args2 != null) || (args1 != null && args2 == null)) {
			return false;
		}
		return args1.setScale(2, BigDecimal.ROUND_HALF_UP).equals(args2.setScale(2, BigDecimal.ROUND_HALF_UP));
	}

	/**
	 * 是否是0
	 * 
	 * @param args
	 * @return
	 */
	public static boolean isZero(BigDecimal args) {
		if (args == null) {
			return false;
		}
		if (args.compareTo(new BigDecimal(0)) == 0) {
			return true;
		}
		return false;
	}
}
