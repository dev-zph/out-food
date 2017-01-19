package com.food.out.common;

/**
 * @author zph
 * @createTime 2017年1月17日 下午1:53:16
 * 
 */
public class ResponseJsonResult {
	private String code = "";// 返回结果
	private String message = "";
	private Object data = null;

	public ResponseJsonResult() {
	}

	public ResponseJsonResult(String code, String message) {
		this.code = code;
		this.message = message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
