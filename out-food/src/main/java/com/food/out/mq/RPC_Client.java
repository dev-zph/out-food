/**
 * 
 */
package com.food.out.mq;

import java.util.UUID;

import com.rabbitmq.client.AMQP.BasicProperties;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.QueueingConsumer;

/**
 * @author 陈佳
 * @createTime 2017年5月16日 下午1:46:59
 * 
 */
public class RPC_Client {

	private Connection connection;
	private static Channel channel;
	private static String requestQueueName = "rpc_queue";
	private static String replyQueueName;
	private static QueueingConsumer consumer;

	public RPC_Client() throws Exception {
		ConnectionFactory factory = new ConnectionFactory();
		factory.setHost("localhost");
		connection = factory.newConnection();
		channel = connection.createChannel();

		replyQueueName = channel.queueDeclare().getQueue();
		consumer = new QueueingConsumer(channel);
		channel.basicConsume(replyQueueName, true, consumer);
	}

	public static String pushMessage(String message) throws Exception{
      String corrId = UUID.randomUUID().toString();  
      BasicProperties props = new BasicProperties.Builder().correlationId(corrId).replyTo(replyQueueName).build();  
      try{
    	  channel.txSelect();//开启事务
    	  channel.basicPublish("", requestQueueName, props, message.getBytes("UTF-8")); 
    	  channel.txCommit();//提交事务
      }catch(Exception e){
    	  e.printStackTrace();
    	  channel.txRollback();//回滾事物
      }
      return corrId;
  }

	public static String call(String corrId) throws Exception {
		String response = null;
		while (true) {
			QueueingConsumer.Delivery delivery = consumer.nextDelivery();
			if (delivery.getProperties().getCorrelationId().equals(corrId)) {
				response = new String(delivery.getBody(), "UTF-8");
				break;
			}
		}
		return response;
	}

	public void close() throws Exception {
		connection.close();
	}

	public static void main(String[] argv) {
		RPC_Client fibonacciRpc = null;
		String response = null;
		try {
			fibonacciRpc = new RPC_Client();

			System.out.println("RPCClient [x] Requesting fib(30)");
			String corrId = pushMessage("30");
			response = call(corrId);
			System.out.println("RPCClient [.] Got '" + response + "'");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fibonacciRpc != null) {
				try {
					fibonacciRpc.close();
				} catch (Exception ignore) {
				}
			}
		}
	}
}
