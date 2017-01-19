package com.food.out.utils;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.serializer.SerializerFeature;

public class JsonUtils {

	/**
	 * 定义 FASTJSON null值属性输出且值任为null、null集合输出[]、日期格式yyyy-MM-dd HH:mm:ss
	 */
	public static final SerializerFeature [] FASTJSON_FORMAT_1 = {SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteDateUseDateFormat};
	
	/**
	 * 输出json数据
	 * render text
	 * @param response
	 * @param text
	 * @param contentType like "text/x-json;charset=UTF-8"
	 */
    public static void render(HttpServletResponse response, String text,String contentType) {
    	try {
			response.setContentType(contentType);
			response.getWriter().write(text);
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
}
