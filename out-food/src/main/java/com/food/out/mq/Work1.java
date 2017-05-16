/**
 * 
 */
package com.food.out.mq;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;
import com.rabbitmq.client.QueueingConsumer;

/**
 * @author 陈佳
 * @createTime 2017年5月16日 上午10:42:20
 * 
 */
public class Work1 {
	//队列名称  
    private final static String QUEUE_NAME = "out_food_task";  
  
    public static void main(String[] argv) throws Exception {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");
        final Connection connection = factory.newConnection();
        final Channel channel = connection.createChannel();
        boolean durable = true;
        channel.queueDeclare(QUEUE_NAME, durable, false, false, null);
        System.out.println("Worker1 [*] Waiting for messages. To exit press CTRL+C");
        // 每次从队列中获取数量
        channel.basicQos(1);

        final DefaultConsumer consumer = new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {
                String message = new String(body, "UTF-8");

                System.out.println("Worker1 [x] Received '" + message + "'");
                try {
                    doWork(message);
                } finally {
                    System.out.println("Worker1 [x] Done");
                    // 消息处理完成确认
                    channel.basicAck(envelope.getDeliveryTag(), false);
                }
            }
        };
        // 消息消费完成确认
        channel.basicConsume(QUEUE_NAME, false, consumer);
    }

    private static void doWork(String task) {
        try {
            Thread.sleep(1000); // 暂停1秒钟
        } catch (InterruptedException _ignored) {
            Thread.currentThread().interrupt();
        }
    }
}
