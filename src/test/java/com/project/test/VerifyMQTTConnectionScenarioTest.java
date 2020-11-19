package com.project.test;

import com.intuit.karate.junit5.Karate;

class VerifyMQTTConnectionScenarioTest {
	@Karate.Test
	Karate verifyMQTTConnectionFlow() {
		return Karate.run("mqtt_connection_flow").relativeTo(getClass());
	}
}
