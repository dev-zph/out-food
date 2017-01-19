package com.food.out.common;

public class Status {
	
	
	
	
	/**
	 * 公共状态
	 */
	public final static String SUCCESS = "101"; // 成功

	public final static String FAIL = "102"; // 失败
	
	/**
	 * 用户状态
	 */
	public final static String USER_NOT_USER = "201"; // 用户不存在

	public final static String USER_WRONG_PWD = "202"; // 密码错误

	public final static String CODE_WRONG = "203"; // 短信验证码错误

	public final static String HAS_USER = "204"; // 用户名已存在

	public final static String NEED_LOGIN = "205"; // 需重新登录
	
	public final static String ERRO_PHONE = "206"; // 手机号类型填写不正确
	
	public final static String UNACCEP_TYPE = "207";//用户账号被禁用
	
	public final static String CANUSE = "0"; // 正常账号
	
	public final static String NOTUSE = "1";//账号呗冻结
	
	//user相关的信息,session.key
	public static final String SYSTEM_SHOP_KEYWORD = "shop";
	public static final String SYSTEM_USER_KEYWORD = "user";
	/**
	 * 店铺管理
	 */
	public static final int SHOP_APPLY_STATUS_YES = 0;// 正常、通过审核

	public static final int SHOP_APPLY_STATUS_READ = 1;// 开店申请 - 阅读须知

	public static final int SHOP_APPLY_STATUS_INFO = 2;// 开店申请 - 信息录入 同时表示待审核

	public static final int SHOP_APPLY_STATUS_CHECK_NO = 3;// 未通过审核

	public static final int SHOP_APPLY_STATUS_BLOCKED = 4;// 被冻结
	/**
	 * 通用
	 */
	public static final String DELETED_NO = "0"; // 正常

	public static final String DELETED_YES = "1"; // 已删除
	/**
	 * 店铺的状态
	 */
	public static final Integer ITEM_STORE = 1; // 仓库中的商品

	public static final Integer ITEM_CHECK = 2; // 待审核商品

	public static final Integer ITEM_SALE = 3; // 销售中的商品

	public static final Integer ITEM_CHECK_NO = 4; // 审核被拒绝
	
	/**
	 * 错误信息
	 */
	public static final String SHOP_NOT_FOUND = "未查询到您的店铺相关信息";
	
	// ContentType
	public static final String HTML_TYPE = "text/html;charset=utf-8"; // html
	public static final String JSON_TYPE = "application/json;charset=UTF-8"; // Json
}
