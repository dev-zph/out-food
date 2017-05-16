/**
 * 
 */
package com.food.out.mq;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.MessageProperties;

/**
 * 必须要先有队列在交换机上  不然消息就会丢失
 * @author 陈佳
 * @createTime 2017年5月16日 上午11:47:21
 * 
 */
public class Exchange_fanout_producer {

	private static final String EXCHANGE_NAME = "logs";

    public static void main(String[] argv) throws Exception {

        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");
        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();

        channel.exchangeDeclare(EXCHANGE_NAME, "fanout");

//      分发消息
        for(int i = 0 ; i < 5; i++){
            String message = "Hello World! " + i;
             channel.basicPublish(EXCHANGE_NAME, "", MessageProperties.PERSISTENT_TEXT_PLAIN, message.getBytes());
             System.out.println(" [x] Sent '" + message + "'");
        }
        
        channel.close();
        connection.close();
    }
}
