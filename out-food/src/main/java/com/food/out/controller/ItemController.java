package com.food.out.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.food.out.common.Constants;
import com.food.out.common.ResponseJsonResult;
import com.food.out.common.Status;
import com.food.out.exception.ApplicationException;
import com.food.out.model.Item;
import com.food.out.model.Shop;
import com.food.out.model.ShopItemClass;
import com.food.out.model.User;
import com.food.out.page.Page;
import com.food.out.service.ItemService;
import com.food.out.service.ShopItemClassService;
import com.food.out.service.ShopService;
import com.food.out.utils.JsonUtils;

@Controller
@RequestMapping("item/")
public class ItemController {

	private final static Logger log = Logger.getLogger(ItemController.class);
	@Resource
	private ShopItemClassService shopItemClassService;
	@Resource
	private ShopService shopService;
	@Resource
	private ItemService itemService;

	@RequestMapping("toAdd")
	public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute(Status.SYSTEM_USER_KEYWORD);
		if (StringUtils.isEmpty(user)) {
			return new ModelAndView("redirect://toLogin.html");
		}
		ModelAndView model = new ModelAndView("item/add");
		String userId = String.valueOf(user.getId());// 获取当前用户id
		List<Shop> shops = shopService.selectListByUserId(userId, null, Status.DELETED_NO);
		List<ShopItemClass> classList = shopItemClassService.selectClassListByShopId(shops.get(0).getId());
		model.addObject("classList", classList);
		return model;
	}

	@RequestMapping("addItem")
	public void addItem(HttpServletRequest request, HttpServletResponse response) {
		ResponseJsonResult result = new ResponseJsonResult();
		try {
			Shop shop = (Shop) request.getSession().getAttribute(Status.SYSTEM_SHOP_KEYWORD);
			Integer shopId = shop.getId();
			String itemName = request.getParameter("itemName");
			String shopItemClassId = request.getParameter("shopItemClassId");
			String itemImg = request.getParameter("itemImg");
			String itemPrice = request.getParameter("itemPrice");
			String status = request.getParameter("status");
			Item item = new Item();
			item.setItemName(itemName);
			if (StringUtils.isEmpty(shopItemClassId)) {
				throw new ApplicationException("请选择商品的类别!");
			}
			item.setShopItemClassId(Integer.valueOf(shopItemClassId));
			item.setItemImg(itemImg);
			item.setItemPrice(new BigDecimal(itemPrice));
			item.setDescribe("test");
			item.setStatus(Integer.valueOf(status));
			item.setCreatTime(new Date());
			item.setShopId(shopId);
			itemService.insert(item);
			result.setCode(Status.SUCCESS);
			result.setMessage("添加成功!");
		} catch (ApplicationException e) {
			result.setCode(Status.FAIL);
			result.setMessage(e.getMessage());
		} catch (Exception e) {
			result.setCode(Status.FAIL);
			result.setMessage("添加失败!");
			log.error("item/addItem.json---Exception: " + e.getMessage());
		}
		JsonUtils.render(response, JSONObject.toJSONString(result), Status.JSON_TYPE);
	}

	@RequestMapping("get/{type}")
	public ModelAndView getItemWithPage(HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer type) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			if (Status.ITEM_SALE.equals(type)) {
				modelAndView = new ModelAndView("item/sale");
			} else if (Status.ITEM_CHECK.equals(type)) {
				modelAndView = new ModelAndView("item/check");
			} else if (Status.ITEM_STORE.equals(type)) {
				modelAndView = new ModelAndView("item/storeHouse");
			} else {
				modelAndView = new ModelAndView("item/check");
			}
			String itemName = request.getParameter("itemName");
			Shop shop = (Shop) request.getSession().getAttribute(Status.SYSTEM_SHOP_KEYWORD);
			if (shop == null) {
				throw new ApplicationException(Status.SHOP_NOT_FOUND);
			}
			String shopId = String.valueOf(shop.getId());
			String pageNo = request.getParameter("pageNo");
			Map<String, Object> conditions = new HashMap<String, Object>();
			conditions.put("status", type);
			if (!StringUtils.isEmpty(shopId)) {
				conditions.put("shopId", shopId);
			}
			conditions.put("itemName", itemName);
			conditions.put("isDel", Status.DELETED_NO);
			Integer count = itemService.getItemsCount(conditions);
			Page<Item> page = new Page<Item>(count, StringUtils.hasLength(pageNo) ? Integer.parseInt(pageNo) : 1,
					request.getContextPath() + "/item/get/" + type + ".html", conditions);
			page = itemService.getItemsByPage(page);
			modelAndView.addObject("page", page);
			modelAndView.addObject("count", count);
			modelAndView.addObject("type", type);
			modelAndView.addObject("itemName", itemName);
			modelAndView.addObject("code", Status.SUCCESS);
			modelAndView.addObject("message", "查询成功！");
		} catch (ApplicationException e) {
			log.error("item/get/{type}.html--ApplicationException:", e);
			modelAndView.addObject("code", Status.FAIL);
			modelAndView.addObject("message", "查询失败！");
		} catch (Exception e) {
			log.error("item/get/{type}.html--Exception:", e);
			modelAndView.addObject("code", Status.FAIL);
			modelAndView.addObject("message", "查询失败！");
		}
		return modelAndView;
	}

	@RequestMapping("toUpdate/{id}")
	public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") Integer id) {
		User user = (User) request.getSession().getAttribute(Status.SYSTEM_USER_KEYWORD);
		ModelAndView model = new ModelAndView("item/update");
		if (StringUtils.isEmpty(user)) {
			return new ModelAndView("redirect://toLogin.html");
		}
		String userId = String.valueOf(user.getId());// 获取当前用户id
		List<Shop> shops = shopService.selectListByUserId(userId, null, Status.DELETED_NO);
		List<ShopItemClass> classList = shopItemClassService.selectClassListByShopId(shops.get(0).getId());
		model.addObject("classList", classList);

		Item item = itemService.selectByPrimaryKey(id);
		model.addObject("item", item);
		return model;
	}

	@RequestMapping("updateItem")
	public void updateItem(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> data = new HashMap<String, Object>();
		User user = (User) request.getSession().getAttribute(Status.SYSTEM_USER_KEYWORD);
		if (StringUtils.isEmpty(user)) {
			data.put("data", Status.NEED_LOGIN);
		}
		try {
			Shop shop = (Shop) request.getSession().getAttribute(Status.SYSTEM_SHOP_KEYWORD);
			Integer shopId = shop.getId();
			Item item = new Item();
			BeanUtils.populate(item, request.getParameterMap());
			item.setShopId(shopId);
			itemService.updateItem(item);
			data.put("data", Status.SUCCESS);
		} catch (Exception e) {
			data.put("data", Status.FAIL);
			e.printStackTrace();
			log.error("======item/addItem: " + e.getMessage());
		}
		com.food.out.common.ResponseUtil.printJson(response, data);
	}

	@RequestMapping("updateItemStatus")
	public void updateItemStatus(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> data = new HashMap<String, Object>();
		User user = (User) request.getSession().getAttribute(Status.SYSTEM_USER_KEYWORD);
		if (StringUtils.isEmpty(user)) {
			data.put("data", Status.NEED_LOGIN);
		}
		try {
			Shop shop = (Shop) request.getSession().getAttribute(Status.SYSTEM_SHOP_KEYWORD);
			Integer shopId = shop.getId();
			String id = request.getParameter("id");
			String status = request.getParameter("status");
			Item item = new Item();
			item.setId(Integer.valueOf(id));
			item.setStatus(Integer.valueOf(status));
			item.setShopId(shopId);
			item.setUpdateTime(new Date());
			itemService.updateItem(item);
			data.put("data", Status.SUCCESS);
		} catch (Exception e) {
			data.put("data", Status.FAIL);
			e.printStackTrace();
			log.error("======item/updateItemStatus: " + e.getMessage());
		}
		com.food.out.common.ResponseUtil.printJson(response, data);
	}

	@RequestMapping("getItemById")
	public ModelAndView getItemById(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView("/item/item_detail");
		try {
			String itemId = request.getParameter("itemId");
			if (StringUtils.isEmpty(itemId)) {
				throw new ApplicationException("未接受前台数据!");
			}
			// 获取商品信息
			Map<String, Object> con = new HashMap<String, Object>();
			con.put("id", itemId);
			List<Item> list = itemService.getItems(con);
			Item item = list.get(0);
			Integer shopId = item.getShopId();
			Shop shop = shopService.selectByPrimaryKey(shopId);
			if (list == null || list.size() == 0) {
				throw new ApplicationException("未查询到相关信息！");
			}
			modelAndView.addObject("shop", shop);
			modelAndView.addObject("item", list.get(0));

			modelAndView.addObject("code", Status.SUCCESS);
			modelAndView.addObject("message", "查询成功");
		} catch (ApplicationException e) {
			log.error("item/getItemById.html---ApplicationException", e);
			modelAndView.addObject("code", Status.FAIL);
			modelAndView.addObject("message", "查询失败");
		} catch (Exception e) {
			log.error("item/getItemById.html---Exception", e);
			modelAndView.addObject("code", Status.FAIL);
			modelAndView.addObject("message", "查询失败");
		}
		return modelAndView;
	}
}
