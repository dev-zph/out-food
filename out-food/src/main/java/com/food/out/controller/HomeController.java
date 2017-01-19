package com.food.out.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller("homeController")
public class HomeController {

	
	/**
	 * 跳转首页
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("home")
	public ModelAndView home() {
		return new ModelAndView("index");
	}
}
