package com.food.out.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.food.out.common.Constants;
import com.food.out.common.Status;
import com.food.out.model.Shop;
import com.food.out.model.User;
import com.food.out.service.CartItemService;
import com.food.out.service.ShopService;
import com.food.out.service.UserService;
import com.food.out.utils.EncryptMD5;
import com.food.out.utils.JsonUtils;
@Controller
public class UserController {

	@Resource
	private UserService userService;
	
	@Resource
	private ShopService shopService;
	
	@Resource
	private CartItemService cartService;
	
	
	@RequestMapping("toLogin")
	public ModelAndView toLogin(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("login");
	}
	
	@RequestMapping("toReg")
	public ModelAndView toReg(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("reg");
	}
	
	
	@RequestMapping("Reg")
	public void reg(HttpServletRequest request, HttpServletResponse response) {
		String result = Status.FAIL;
		String code = request.getParameter("code");
		String codeImg = "";
		/**
		 * 判断验证码
		 */
		try {
			codeImg = request.getSession().getAttribute("codeImg").toString();
			if (StringUtils.isEmpty(codeImg) || StringUtils.isEmpty(code) || !codeImg.equals(code)) {
				result = Status.CODE_WRONG;
			} else {
				String userName = request.getParameter("userName");
				String pwd = request.getParameter("pwd");
				User user = new User();
				if (!StringUtils.isEmpty(userName) && !StringUtils.isEmpty(pwd)) {
					List<User> list = userService.selectByUserName(userName);
					if (list==null||list.size()==0) {
						user.setUserName(userName);
						user.setPhone(userName);
						user.setStatus(Status.CANUSE);
						user.setNickName(userName);
						pwd = EncryptMD5.getMD5(pwd);
						user.setPwd(pwd);
						if (userService.insert(user)) {
							request.getSession().setAttribute(Status.SYSTEM_USER_KEYWORD, user);
							result = Status.SUCCESS;
						}
					} else {
						result = Status.HAS_USER;
					}
				}
			}
		} catch (Exception e) {
			result = Status.CODE_WRONG;
			e.printStackTrace();
		}
		JsonUtils.render(response, JSON.toJSONString(result), Status.JSON_TYPE);
	}
	
	
	@RequestMapping("Login")
	public void login(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String pwd = request.getParameter("pwd");
		String result = Status.FAIL;
		List<User> list  = userService.selectByUserName(userName);
		if (list==null||list.size()==0) {
			result = Status.USER_NOT_USER;
		} else {
			User user = list.get(0);
			if (EncryptMD5.equalsMd5(pwd, user.getPwd())) {// 若密码匹配
				if ("0".equals(user.getStatus())) {
					request.getSession().setAttribute(Status.SYSTEM_USER_KEYWORD, user);// 若用户状态为0：正常，根据用户ID获取商铺的申请信息
					List<Shop> shopList = shopService.selectListByUserId(user.getId().toString(),
							Status.SHOP_APPLY_STATUS_YES, Status.DELETED_NO);
					if (shopList.size() > 0) {// 若有商铺信息，写入SESSION
						request.getSession().setAttribute(Status.SYSTEM_SHOP_KEYWORD, shopList.get(0)); // 商铺ID
						request.getSession().setAttribute("shopStatus", shopList.get(0).getStatus()); // 商铺申请状态
					}
					//获取购物车信息
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("userId", user.getId());
					Integer count = cartService.getCartItemCount(param);
					request.getSession().setAttribute(Status.USER_CART_ITEM_COUNT, count); // 商铺ID
					result = Status.SUCCESS;
				} else {
					result = "200";
				}
			} else {
				result = Status.USER_WRONG_PWD;
			}
		}
		JsonUtils.render(response, result, Status.HTML_TYPE);
	}
	
	@RequestMapping("toExit")
	public ModelAndView toExit(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("user");
		return new ModelAndView("login");
	}
	
	//验证手机号是否正确，验证账号是否已经存在
	@RequestMapping("valiUserName")
	public void valiUserName(HttpServletRequest request, HttpServletResponse response) {
		String result = Status.SUCCESS;
		try {
			String userName = request.getParameter("userName");
			if(!isNumRight(userName)){
				result = Status.ERRO_PHONE;
			}
//			if (!StringUtils.isEmpty(userName)) {
//				if (StringUtils.isEmpty(user.getId())) {
//					result = Status.SUCCESS;
//				} else {
//					result = Status.HAS_USER;
//				}
//			}
		} catch (Exception e) {
			 result = Status.FAIL;
			e.printStackTrace();
		}
		JsonUtils.render(response, JSON.toJSONString(result), Status.JSON_TYPE);
	}
	
	public boolean  isNumRight(String mobiles){
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");  
       Matcher m = p.matcher(mobiles);  
        return m.matches();  
	}
}
