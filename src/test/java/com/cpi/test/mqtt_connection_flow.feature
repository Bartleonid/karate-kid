Feature: presence-api

  Background:
    * url environment
    * def result = call read('access_token.feature')
    * def access_token = result.access_token
    * def MQTTConnector = Java.type('com.presence.common.MQTTConnector')
    * def conn = new MQTTConnector() 

	Scenario: Verify connection to MQTT brocker and active session for a device
	
# Getting successfully credentials for MQTT first time	

* path 'users/'+ devices_agent_id +'/presence/session'

* configure headers = {'Content-Type': 'application/hal+json', 'Accept': 'application/hal+json', 'Authorization': '#("Bearer " + access_token)' }
* request {'device_id': 'tdui.conversation_app'}
* method post
* status 200

* def mqtt_password = response.password
* def brocker = response.url
* def mqtt_client_id = response.client_id
* def mqtt_username = response.username

# Successfully connecting to MQTT brocker

* conn.connectToMQTT(mqtt_password, mqtt_username, brocker, mqtt_client_id)

# Getting credentials for MQTT with error message "There is already an active session for that device."

* path 'users/'+ devices_agent_id +'/presence/session'

* configure headers = {'Content-Type': 'application/hal+json', 'Accept': 'application/hal+json', 'Authorization': '#("Bearer " + access_token)' }
* request {'device_id': 'tdui.conversation_app'}
* method post
* status 409

* def delete_session_link = response._links['delete_session']
* match response.message == "There is already an active session for that device."

# Delete an active session

* url delete_session_link
* configure headers = {'Content-Type': 'application/hal+json', 'Accept': 'application/hal+json', 'Authorization': '#("Bearer " + access_token)' }
* request {'device_id': 'tdui.conversation_app'}
* method delete
* status 204

# Getting successfully credentials for MQTT brocker again

* url environment
* path 'users/'+ devices_agent_id +'/presence/session'
* configure headers = {'Content-Type': 'application/hal+json', 'Accept': 'application/hal+json', 'Authorization': '#("Bearer " + access_token)' }
* request {'device_id': 'tdui.conversation_app'}
* method post
* status 200

* match response.password == '#notnull'
* match response.url == '#notnull'
* match response.client_id == '#notnull'
* match response.username == '#notnull'



