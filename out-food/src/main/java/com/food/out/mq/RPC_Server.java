/**
 * 
 */
package com.food.out.mq;

import com.rabbitmq.client.AMQP.BasicProperties;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.QueueingConsumer;

/**
 * @author 陈佳
 * @createTime 2017年5月16日 下午1:46:43
 * 
 */
public class RPC_Server {
	private static final String RPC_QUEUE_NAME = "rpc_queue";  
	
	 private static int fib(int n) {  
	       return n+2  ;
	    }  
	 
	 public static void main(String[] argv) {  
	        Connection connection = null;  
	        Channel channel = null;  
	        try {  
	            ConnectionFactory factory = new ConnectionFactory();  
	            factory.setHost("localhost");  
	  
	            connection = factory.newConnection();  
	            channel = connection.createChannel();  
	  
	            channel.queueDeclare(RPC_QUEUE_NAME, false, false, false, null);  
	  
	            channel.basicQos(1);  
	  
	            QueueingConsumer consumer = new QueueingConsumer(channel);  
	            channel.basicConsume(RPC_QUEUE_NAME, false, consumer);  
	  
	            System.out.println("RPCServer [x] Awaiting RPC requests");  
	  
	            while (true) {  
	                String response = null;  
	  
	                QueueingConsumer.Delivery delivery = consumer.nextDelivery();  
	  
	                BasicProperties props = delivery.getProperties();  
	                //先获取回调参数
	                BasicProperties replyProps = new BasicProperties.Builder().correlationId(props.getCorrelationId()).build();  
	  
	                try {  
	                    String message = new String(delivery.getBody(), "UTF-8");  
	                    int n = Integer.parseInt(message);  
	  
	                    System.out.println("RPCServer [.] fib(" + message + ")");  
	                    response = "" + fib(n);  
	                } catch (Exception e) {  
	                    System.out.println(" [.] " + e.toString());  
	                    response = "";  
	                } finally {  
	                	//把返回结果丢回去
	                    channel.basicPublish("", props.getReplyTo(), replyProps, response.getBytes("UTF-8"));  
	                    //在队列中删除消息
	                    channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);  
	                }  
	            }  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        } finally {  
	            if (connection != null) {  
	                try {  
	                    connection.close();  
	                } catch (Exception ignore) {  
	                }  
	            }  
	        }  
	    }  
}
