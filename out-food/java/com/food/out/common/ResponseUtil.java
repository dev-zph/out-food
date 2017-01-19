package com.food.out.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.MapUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

/**
 * 数据返回
 * 
 * @author liuwei3
 *
 */
public class ResponseUtil {
	private final static Logger log = Logger.getLogger(ResponseUtil.class);
	// 定义 FASTJSON null值属性输出且值为null、null集合输出[]、日期格式yyyy-MM-dd
	// HH:mm:ss、null字符串输出空
	public static final SerializerFeature[] FASTJSON_FORMAT = {
			SerializerFeature.WriteMapNullValue,
			SerializerFeature.WriteNullListAsEmpty,
			SerializerFeature.WriteDateUseDateFormat,
			SerializerFeature.WriteNullStringAsEmpty };

	/**
	 * out
	 * 
	 * @param response
	 * @param text
	 */
	public static void print(HttpServletResponse response, String text,
			String contentType) {
		try {
			log.debug("print->" + text);
			response.setContentType(contentType);
			PrintWriter out = response.getWriter();
			out.print(text);
			out.close();
			out = null;
		} catch (IOException e) {
		}
	}

	/**
	 * out json
	 * 
	 * @param response
	 * @param data
	 */
	public static void printJson(HttpServletResponse response,
			Map<String, Object> data) {
		try {
			Map<String, Object> m = new HashMap<String, Object>();
			if (MapUtils.isNotEmpty(data)) {
				m.putAll(data);
			}
			String text = JSONObject.toJSONString(m, FASTJSON_FORMAT);
			print(response, text, Status.JSON_TYPE);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			log.error(e.getMessage());
		}
	}
}
