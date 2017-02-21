package com.food.out.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.food.out.common.ResponseJsonResult;
import com.food.out.common.Status;
import com.food.out.model.User;
import com.food.out.utils.JsonUtils;


public class PrivilegeInterceptor extends HandlerInterceptorAdapter {

	private String notcheck;

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		String requestURI = request.getRequestURI();
		String contextpath = request.getContextPath();
		requestURI = requestURI.replaceAll(contextpath, "");
		if (requestURI.endsWith(".json") || requestURI.endsWith(".html")) {
			if (notcheck.indexOf(requestURI) > -1) {
				return true;
			}
			User user = (User) request.getSession().getAttribute(Status.SYSTEM_USER_KEYWORD);
			if (user == null) {
				ResponseJsonResult result = new ResponseJsonResult();
				result.setCode(Status.NEED_LOGIN);
				result.setMessage("登录已失效，请重新登陆！");
				JsonUtils.renderJSON(response, result);
				return false;
			}
			return true;
		}
		return true;
	}

	public String getNotcheck() {
		return notcheck;
	}

	public void setNotcheck(String notcheck) {
		this.notcheck = notcheck;
	}

}
