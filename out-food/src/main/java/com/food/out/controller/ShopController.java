package com.food.out.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.food.out.common.ResponseUtil;
import com.food.out.common.Status;
import com.food.out.common.StringPrintWriter;
import com.food.out.model.Shop;
import com.food.out.model.User;
import com.food.out.service.ShopService;


@Controller
public class ShopController extends BaseController {
	private final static Logger log = Logger.getLogger(ShopController.class);
	
	@Resource
	private ShopService shopService;
	
	/**
	 * 根据页面名称 跳转页面
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/navigate_apply/{view}.html")
	public ModelAndView navigateToView(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@PathVariable(value = "view") String view) throws Exception {
		User user = getSessionUser(session);
		if (null == user) {
			return new ModelAndView("redirect:/toLogin.html");
		}
		// 根据店铺状态，判断是否可进对应page
		String userId = String.valueOf(user.getId());// 获取当前用户id
		List<Shop> shops = shopService.selectListByUserId(userId, null, Status.DELETED_NO);
		Integer status = null;
		if (CollectionUtils.isNotEmpty(shops)) {
			Shop shop = shops.get(0);
			status = shop.getStatus();
			if (Status.SHOP_APPLY_STATUS_READ == shop.getStatus().intValue()) {
				view = "info";
			}
			if (Status.SHOP_APPLY_STATUS_INFO == shop.getStatus().intValue()
					|| Status.SHOP_APPLY_STATUS_CHECK_NO == shop.getStatus().intValue()) {
				view = "verify";
			}
			if (Status.SHOP_APPLY_STATUS_YES == shop.getStatus().intValue()
					|| Status.SHOP_APPLY_STATUS_BLOCKED == shop.getStatus().intValue()) {
				view = "finished";
			}
		} else {
			if (!("read".equals(view) || "index".equals(view))) {
				view = "index";
			}
		}
		String realView = VIEW_TABLE.get("apply_" + view);
		if (StringUtils.isEmpty(realView)) {
			realView = VIEW_TABLE.get("404");
		}
		ModelAndView mav = new ModelAndView(realView);
		request.getSession().setAttribute("shopStatus", status);
		request.getSession().setAttribute("requestUrl", realView);
		return mav;
	}
	

	/**
	 * 用户店铺数据查询
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @throws Exception
	 */
	@RequestMapping(value = "/apply/shop/data.html")
	public void getApplyShopByUserId(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			User user = getSessionUser(session);
			if (null != user) {
				String userId = String.valueOf(user.getId());// 获取当前用户id
				List<Shop> shops = shopService.selectListByUserId(userId, null, Status.DELETED_NO);
				data.put("data", shops);
			}
		} catch (Exception e) {
			StringPrintWriter printWriter = new StringPrintWriter();
			e.printStackTrace(printWriter);
			log.error(printWriter.getString());
		}
		com.food.out.common.ResponseUtil.printJson(response, data);
	}
	
	/**
	 * 申请流程店铺信息 - 保存
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/apply/shop/save.html")
	public void saveApplyShopInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("data", "fail");
		try {
			User user = getSessionUser(session);
			if (null != user) {
				Shop shop = new Shop();
				BeanUtils.populate(shop, request.getParameterMap());
				shop.setStatus(Status.SHOP_APPLY_STATUS_READ);
				shop.setIsDel(Integer.valueOf(Status.DELETED_NO));
				String userId = String.valueOf(user.getId());// 获取当前用户id
				shop.setUserId(user.getId());
				// 信息校验 - 一用户仅可开一店铺
				List<Shop> shops = shopService.selectListByUserId(userId, null, Status.DELETED_NO);
				if (CollectionUtils.isEmpty(shops)) {
					shopService.insert(shop);
					data.put("data", "success");
				} else {
					data.put("message", "exists");
				}
			}
		} catch (Exception e) {
			StringPrintWriter printWriter = new StringPrintWriter();
			e.printStackTrace(printWriter);
			log.error(printWriter.getString());
		}
		com.food.out.common.ResponseUtil.printJson(response, data);
	}
	
	
	/**
	 * 申请流程店铺信息 - 修改
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/apply/shop/update.html")
	public void updateApplyShopInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("data", "fail");
		try {
			User user = getSessionUser(session);
			if (null != user) {
				Shop shop = new Shop();
				BeanUtils.populate(shop, request.getParameterMap());
				shop.setStatus(Status.SHOP_APPLY_STATUS_INFO);
				shop.setIsDel(Integer.valueOf(Status.DELETED_NO));
				shop.setUserId(null);
				// 信息校验
				boolean sure = true;
				String userId = String.valueOf(user.getId());// 获取当前用户id
				List<Shop> shops = shopService.selectListByUserId(userId, null, Status.DELETED_NO);
				if (CollectionUtils.isEmpty(shops)) {
					sure = false;
				}
				if (sure) {
					shop.setId(shops.get(0).getId());
					shopService.updateByPrimaryKey(shop);
					request.getSession().setAttribute("shopStatus", shop.getStatus());
					data.put("data", "success");
				}
			}
		} catch (Exception e) {
			StringPrintWriter printWriter = new StringPrintWriter();
			e.printStackTrace(printWriter);
			log.error(printWriter.getString());
		}
		ResponseUtil.printJson(response, data);
	}
}
