package com.project.common;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

public class MQTTConnector {
	MemoryPersistence persistence = new MemoryPersistence();
	private MqttClient client = null;

	public void connectToMQTT(String password, String username, String url, String clientId) {

		try {
			client = new MqttClient(url, clientId, persistence);
			MqttConnectOptions connOpts = new MqttConnectOptions();
			connOpts.setUserName(username);
			connOpts.setPassword(password.toCharArray());
			connOpts.setCleanSession(true);
			System.out.println("Connecting to broker: " + url);
			client.connect(connOpts);
			System.out.println("Connected");
		} catch (MqttException me) {
			System.out.println("reason " + me.getReasonCode());
			System.out.println("msg " + me.getMessage());
			System.out.println("loc " + me.getLocalizedMessage());
			System.out.println("cause " + me.getCause());
			System.out.println("excep " + me);
			me.printStackTrace();
		}
	}
}
