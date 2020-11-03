Feature: presence-api

  Background:
    * url presencedevices_url
    * def Util = Java.type('com.presence.common.Utility')

	Scenario: Get an access token

# Get CSRF Token on LoginPage

* path '/login'
* configure headers = { 'Content-Type': 'application/x-www-form-urlencoded'}
* method get
* status 200

* def csrf = Util.extractValueByRegex(response, "token: '(.+?)'")
* def SESSION = Util.extractValueByRegex(responseHeaders, "SESSION=(.+?);")

# Authenticate

* path '/authenticate'
* params { _csrf: '#(csrf)', username: '#(username)', password: '#(password)' }
* request ''
* configure followRedirects = true
* configure headers = { 'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json', 'referer': 'https://presencedevices.talkdeskqaid.com/login', 'cookie': '#("SESSION=" + SESSION)'}
* method post
* status 200

* match response.redirect_uri == "/"
* def session_auth = Util.extractValueByRegex(responseHeaders, "SESSION=(.+?);")

# Authorize

* path '/oauth/authorize'
* params { response_type: 'code', state: '', client_id: '#(devices_oauth_client_id)', redirect_uri: 'https://www.getpostman.com/oauth2/callback', scope: 'presence-device-session:write'  }
* configure followRedirects = false
* configure headers = {'Accept': 'text/html', 'cookie': '#("SESSION=" + session_auth)'}
* method get
* status 302

* def code = Util.extractValueByRegex(responseHeaders['Location'][0], "code=(.+?)&")

# Get an acces token

* path '/oauth/token'
* form field grant_type = 'authorization_code'
* configure headers = {'Content-Type': 'application/x-www-form-urlencoded'}
* params { grant_type: 'authorization_code', code: '#(code)', redirect_uri: 'https://www.getpostman.com/oauth2/callback', client_id: '#(devices_oauth_client_id)' }
* header Authorization = call read('basic-auth.js') { username: '#(devices_oauth_client_id)', password: '#(devices_oauth_client_secret)' }
* method post
* status 200

* def access_token = response.access_token
* match access_token == '#notnull'

