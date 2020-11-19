package com.presence.test;

import com.intuit.karate.junit5.Karate;

class AccessToken {
	@Karate.Test
	Karate getToken() {
		return Karate.run("access_token").relativeTo(getClass());
	}
}
