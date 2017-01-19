package com.food.out.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("public/")
public class PublicStaticController {
	
	private String prefix = "public/";

	/**
	 * 默认的一个公共方法页面，任何逻辑都不做处理直接返回渲染页面
	 * @param request
	 * @param response
	 * @param view
	 * @return
	 */
	@RequestMapping("{view}.html")
	public ModelAndView get(HttpServletRequest request, HttpServletResponse response,@PathVariable(value = "view") String view){
		return new ModelAndView(view);
	}
}
