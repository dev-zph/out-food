/**
 * 
 */
package com.food.out.common.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;


/**
 * @author 陈佳
 * @createTime 2017年2月10日 下午3:15:09
 * 
 */
public class DisplayOrderStatus extends TagSupport {

	private int code;

	private static final long serialVersionUID = 756047067693576460L;

	@Override
	public int doStartTag() throws JspException {
			try {
				pageContext.getOut().print(com.food.out.common.OrderStatus.getName(code));
			} catch (IOException e) {
				e.printStackTrace();
			}
		return EVAL_BODY_INCLUDE;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

}
