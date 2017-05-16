/**
 * 
 */
package com.food.out.mq;

import java.io.IOException;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;
/**
 * @author 陈佳
 * @createTime 2017年5月16日 下午12:40:06
 * 
 */
public class Exchang_direct_consumer1 {

	// 交换器名称  
    private static final String EXCHANGE_NAME = "direct_logs";  
    // 路由关键字  
    private static final String[] routingKeys = new String[]{"info" ,"warning", "error"};  
      
    public static void main(String[] argv) throws Exception {  
        ConnectionFactory factory = new ConnectionFactory();  
        factory.setHost("localhost");  
        Connection connection = factory.newConnection();  
        Channel channel = connection.createChannel();  
//      声明交换器  
        channel.exchangeDeclare(EXCHANGE_NAME, "direct");  
//      获取匿名队列名称  
        String queueName = channel.queueDeclare().getQueue();  
//      根据路由关键字进行多重绑定  
        for (String severity : routingKeys) {  
            channel.queueBind(queueName, EXCHANGE_NAME, severity);  
            System.out.println("ReceiveLogsDirect1 exchange:"+EXCHANGE_NAME+", queue:"+queueName+", BindRoutingKey:" + severity);  
        }  
        System.out.println("ReceiveLogsDirect1 [*] Waiting for messages. To exit press CTRL+C");  
  
        DefaultConsumer consumer = new DefaultConsumer(channel) {  
            @Override  
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {  
                String message = new String(body, "UTF-8");  
                System.out.println(" [x] Received '" + envelope.getRoutingKey() + "':'" + message + "'");  
            }  
        };  
        channel.basicConsume(queueName, true, consumer);  
    }  
}
