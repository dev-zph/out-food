package com.food.out.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.apache.log4j.Logger;

import com.food.out.common.Status;
import com.food.out.model.User;


public class BaseController {
	private final static Logger log = Logger.getLogger(BaseController.class);
	public static final ExecutorService BASE_EXECUTOR_SERVICE = Executors
			.newFixedThreadPool(3);
	public static final Map<String, String> VIEW_TABLE = new HashMap<String, String>();

	static {
		VIEW_TABLE.put("apply_index", "/shop/applyIndex");
		VIEW_TABLE.put("apply_read", "/shop/applyReadMe");
		VIEW_TABLE.put("apply_info", "/shop/applyInfo");
		VIEW_TABLE.put("apply_verify", "/shop/applyVerify");
		VIEW_TABLE.put("apply_finished", "/shop/applyFinished");
		VIEW_TABLE.put("shop_info", "/shop/baseShopInfo");
		VIEW_TABLE.put("shop_upload", "/shop/baseShopInfoUpload");
		VIEW_TABLE.put("address_address", "/center/address");
		VIEW_TABLE.put("comment_index", "/center/comment");
		VIEW_TABLE.put("comment_list", "/center/commentList");
		VIEW_TABLE.put("comment_seller", "/shop/comment-seller");
		VIEW_TABLE.put("aftersale_index", "/center/afterSales");
		VIEW_TABLE.put("aftersale_list", "/center/afterSalesList");

		VIEW_TABLE.put("aftersale_return", "/seller/afterSales-return");
		VIEW_TABLE.put("aftersale_change", "/seller/afterSales-change");

		VIEW_TABLE.put("complaints_index", "/center/complaintsList");
		VIEW_TABLE.put("complaints_apply", "/center/complaintsApply");

		VIEW_TABLE.put("analysis_flow_volume", "/analysis/shopFlowVolume");
		VIEW_TABLE.put("analysis_item_flow_volume",
				"/analysis/shopItemFlowVolume");
		VIEW_TABLE.put("analysis_sales_volume", "/analysis/shopSalesVolume");
		VIEW_TABLE.put("analysis_item_sales_volume",
				"/analysis/shopItemSalesVolume");
		VIEW_TABLE.put("analysis_sales_flow_rate",
				"/analysis/shopSalesFlowRate");

		VIEW_TABLE.put("404", "");
	}


	protected User getSessionUser(HttpServletRequest request) throws Exception {
		User user = (User) request.getSession().getAttribute(Status.SYSTEM_USER_KEYWORD);
		return user;
	}

	/**
	 * 获取min - max 之间的随机数 max > min
	 * 
	 * @param max
	 * @param min
	 * @return
	 */
	protected static int getRandom(int min, int max) {
		if (max <= min) {
			return 0;
		}
		return new Random().nextInt(max - min) + min;
	}
}
