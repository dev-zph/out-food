package com.food.out.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author:Steven.Qin
 * @version:1.0.0
 * @createTime:2013-11-29 下午01:58:40
 */
@Controller
public class CodeController {
		private static final Logger logger = Logger.getLogger(CodeController.class);
		
		private int width = 85;//定义图片的width  
	    private int height = 33;//定义图片的height  
	    private int codeCount = 4;//定义图片上显示验证码的个数  
	    private int xx = 15;  
	    private int fontHeight = 18;  
	    private int codeY = 22;  
	    char[] codeSequence = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };  
	    Color color_brown = new Color(51, 26, 30);
	    Color color_purple = new Color(104, 57, 159);
	    Color color_khaki = new Color(91, 110, 64);
	    Color color_green = new Color(30, 167, 89);
	    Color color_blue = new Color(41, 134, 193);
	  
	    @RequestMapping("code")  
	    public void getCode(HttpServletRequest req, HttpServletResponse resp)  
	            throws IOException {  
	  
	        // 定义图像buffer  
	        BufferedImage buffImg = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);  
	        Graphics gd = buffImg.getGraphics();  
	        // 创建一个随机数生成器类  
	        Random random = new Random();  
	        // 将图像填充为灰红
	        gd.setColor(new Color(236, 218, 220));  
	        gd.fillRect(0, 0, width, height);  
	  
	        // 创建字体，字体的大小应该根据图片的高度来定。  
	        Font font = new Font("Fixedsys", Font.BOLD, fontHeight);  
	        // 设置字体。  
	        gd.setFont(font);  
	  
	      // 画80个小圆点，使图象中的认证码不易被其它程序探测到。
	      for(int i = 0; i < 80; i++) {  
	            int x = (int)(Math.random() * width);  
	            int y = (int)(Math.random() * height);  
	            int red = random.nextInt(255); //随机产生三色，使得小圆点颜色不一样  
	            int green = random.nextInt(255);  
	            int blue = random.nextInt(255);  
	            gd.setColor(new Color(red, green, blue));  
	            gd.drawOval(x, y, 1, 0);  
	        }  
	  
	        // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。  
	        StringBuffer randomCode = new StringBuffer();  
	  
	        //随机验证码颜色
           Object[] colors = {color_blue,color_brown,color_green,color_khaki,color_purple};
	        Color fontColor = (Color) colors[random.nextInt(5)];
	        // 随机产生codeCount数字的验证码。  
	        for (int i = 0; i < codeCount; i++) {  
	            // 得到随机产生的验证码数字。  
	            String code = String.valueOf(codeSequence[random.nextInt(10)]);  
	  
	            // 用随机产生的颜色将验证码绘制到图像中。  
	            gd.setColor(fontColor);  
	            gd.drawString(code, (i + 1) * xx, codeY);  
	  
	            // 将产生的四个随机数组合在一起。  
	            randomCode.append(code);  
	        }  
	        // 将四位数字的验证码保存到Session中。  
	        HttpSession session = req.getSession(); 
	        session.setAttribute("codeImg", randomCode.toString()); 
	  
	        // 禁止图像缓存。  
	        resp.setHeader("Pragma", "no-cache");  
	        resp.setHeader("Cache-Control", "no-cache");  
	        resp.setDateHeader("Expires", 0);  
	  
	        resp.setContentType("image/jpeg");  
	  
	        // 将图像输出到Servlet输出流中。  
	        ServletOutputStream sos = resp.getOutputStream();  
	        ImageIO.write(buffImg, "jpeg", sos);  
	        sos.close();  
	    }  
}
