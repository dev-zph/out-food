/**
 * 
 */
package Exchang_direct_producer;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

/**
 * @author 陈佳
 * @createTime 2017年5月16日 下午12:32:58
 * 
 */
public class Exchang_direct_consumer1 {

	 private static final String EXCHANGE_NAME = "direct_logs";  
	 // 路由关键字  
	    private static final String[] routingKeys = new String[]{"info" ,"warning", "error"};  
	      
	    public static void main(String[] argv) throws Exception {  
	  
	        ConnectionFactory factory = new ConnectionFactory();  
	        factory.setHost("localhost");  
	        Connection connection = factory.newConnection();  
	        Channel channel = connection.createChannel();  
//	      声明交换器  
	        channel.exchangeDeclare(EXCHANGE_NAME, "direct");  
//	      发送消息  
	        for(String severity :routingKeys){  
	            String message = "Send the message level:" + severity;  
	            channel.basicPublish(EXCHANGE_NAME, severity, null, message.getBytes());  
	            System.out.println(" [x] Sent '" + severity + "':'" + message + "'");  
	        }  
	        channel.close();  
	        connection.close();  
	    }  
}
