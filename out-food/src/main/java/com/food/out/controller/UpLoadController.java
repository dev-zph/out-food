package com.food.out.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.food.out.common.ResponseUtil;
import com.food.out.model.User;
import com.food.out.utils.FileUpload;
import com.food.out.utils.FileUpload.Limit;

@Controller
public class UpLoadController extends BaseController{
	
	private final static Logger log = Logger.getLogger(UpLoadController.class);
	
	private final static long FILE_SIZE_MAX = 1024 * 1024 * 10;

	private final static String FILE_FIELD_PREFIX = "file";
	
	private final static String ROUTING = "C:"+ File.separator +"personroot"+ File.separator+"img"+ File.separator;

	/**
	 * 上传
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping(value = "/apply/upload.html")
	public void upload(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("data", Limit.fail.name());
		try {
			User user = getSessionUser(request);
			if (null != user) {
				// check multipart/form-data
				boolean isMultipart = ServletFileUpload.isMultipartContent(request);
				if (isMultipart) {
					Limit limit = FileUpload.uploadCheck(request, FILE_SIZE_MAX);
					if (limit.name().equalsIgnoreCase(Limit.ok.name())) {
						List<FileItem> items = FileUpload.parseRequest(request, FILE_SIZE_MAX);
						// basedir + routing
						String tmpDir =  ROUTING;
						String tmpFileName = DateTime.now().toString(DateTimeFormat.forPattern("yyyyMMddHHmmssms"))
								+ getRandom(1, 100000);
						Map<String, Object> uploadResult = FileUpload.upload(items, new File(tmpDir), FILE_FIELD_PREFIX,
								tmpFileName);
						if ((Boolean) uploadResult.get("uploadState")) {
							data.put("data", Limit.ok.name());
							data.put("tmpFileName", uploadResult.get("fileName"));
							data.put("tmpFileRouting", ROUTING.replaceAll("\\\\", "/"));
						}
					} else {
						data.put("data", limit.name());
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		ResponseUtil.printJson(response, data);
	}
	
}
