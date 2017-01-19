package com.food.out.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test")
public class testController {
	@RequestMapping("/value")
	public ModelAndView  test () {
		return new ModelAndView("index");
	}

}
