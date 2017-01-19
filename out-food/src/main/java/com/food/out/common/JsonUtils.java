package com.food.out.common;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.xianguo.platform.common.Constants;

public class JsonUtils {

	/**
	 * 定义 FASTJSON null值属性输出且值任为null、null集合输出[]、日期格式yyyy-MM-dd HH:mm:ss
	 */
	public static final SerializerFeature[] FASTJSON_FORMAT_1 = { SerializerFeature.WriteMapNullValue,
			SerializerFeature.WriteNullListAsEmpty, SerializerFeature.WriteDateUseDateFormat };

	public static final SerializerFeature[] FASTJSON_FORMAT = { SerializerFeature.WriteMapNullValue,
			SerializerFeature.WriteNullListAsEmpty, SerializerFeature.WriteDateUseDateFormat,
			SerializerFeature.WriteNullStringAsEmpty };

	/**
	 * 输出json数据 render text
	 * 
	 * @param response
	 * @param text
	 * @param contentType
	 *            like "text/x-json;charset=UTF-8"
	 */
	public static void render(HttpServletResponse response, String text, String contentType) {
		try {
			response.setContentType(contentType);
			response.getWriter().write(text);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 输出json数据 render object
	 * 
	 * @param response
	 * @param object
	 */
	public static void renderJSON(HttpServletResponse response, Object object) {
		try {
			response.setContentType(Constants.JSON_TYPE);
			response.getWriter().write(JSONObject.toJSONString(object));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 输出json数据 render object
	 * 
	 * @param response
	 * @param object
	 */
	public static void renderFormatJSON(HttpServletResponse response, Object object) {
		try {
			response.setContentType(Constants.JSON_TYPE);
			response.getWriter().write(JSONObject.toJSONString(object,FASTJSON_FORMAT));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
