/**
 * 
 */
package com.food.out.mq;

import java.io.IOException;
import java.util.Date;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;

/**
 * @author 陈佳
 * @createTime 2017年5月16日 下午12:01:23
 * 
 */
public class Exchang_fanout_consumer2 {

	private static final String EXCHANGE_NAME = "logs";

    public static void main(String[] argv) throws Exception {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");
        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();

        channel.exchangeDeclare(EXCHANGE_NAME, "fanout");
        String queueName = channel.queueDeclare().getQueue();
        channel.queueBind(queueName, EXCHANGE_NAME, "");
        channel.basicQos(1);
        System.out.println(" [*] Waiting for messages. To exit press CTRL+C");

        Consumer consumer = new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {
                String message = new String(body, "UTF-8");
                doWork(message);
                System.out.println(" [x] Received '" + new Date() +message + "'");
            }
        };
        channel.basicConsume(queueName, true, consumer);
    }
    /**
     * 任务处理
     * 
     * @param task
     *            void
     */
    private static void doWork(String task) {
        try {
            Thread.sleep(1000); // 暂停1秒钟
        } catch (InterruptedException _ignored) {
            Thread.currentThread().interrupt();
        }
    }
}
