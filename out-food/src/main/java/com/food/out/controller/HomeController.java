package com.food.out.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.food.out.model.Shop;
import com.food.out.service.ShopService;
@Controller("homeController")
public class HomeController {
@Resource
private ShopService shopService;


private static Integer MOST_SHOP_COUNT = 5;
private static Integer LEAST_SHOP_COUNT = 5;
	/**
	 * 跳转首页
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("home")
	public ModelAndView home() {
		ModelAndView view = new ModelAndView("index");
//		List<Shop> mastShopList = shopService.selectOrderMastShops(MOST_SHOP_COUNT);
//		List<Shop> leastShopList = shopService.selectNewShops(LEAST_SHOP_COUNT);
//		view.addObject("mastShopList",mastShopList);
//		view.addObject("leastShopList",leastShopList);
		return view;
	}
}
