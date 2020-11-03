function fn() {
  var env = java.lang.System.getenv('GIT_BRANCH');
  karate.log("Environment = " + env);
  var config = {
    environment: '',
    presencedevices_url: '',
    devices_agent_id: '',
    devices_oauth_client_id: java.lang.System.getenv('OAUTH_CLIENT_ID'),
    devices_oauth_client_secret: java.lang.System.getenv('OAUTH_CLIENT_SECRET'),
    username: java.lang.System.getenv('USERNAME'),
    password: java.lang.System.getenv('PASSWORD')
  };
  if (env == 'qa') {
    config.environment = '',
      config.presencedevices_url = '',
      config.devices_agent_id = '',
      config.devices_oauth_client_id = java.lang.System.getenv('OAUTH_CLIENT_ID_QA'),
      config.devices_oauth_client_secret = java.lang.System.getenv('OAUTH_CLIENT_SECRET_QA'),
      config.username = java.lang.System.getenv('USERNAME_QA'),
      config.password = java.lang.System.getenv('PASSWORD_QA')
  } else if (env == 'staging') {
      config.devices_oauth_client_id = java.lang.System.getenv('OAUTH_CLIENT_ID_STAGING'),
      config.devices_oauth_client_secret = java.lang.System.getenv('OAUTH_CLIENT_SECRET_STAGING'),
      config.username = java.lang.System.getenv('USERNAME_STAGING'),
      config.password = java.lang.System.getenv('PASSWORD_STAGING')
  } else if (env == 'master') {
      config.devices_oauth_client_id = java.lang.System.getenv('OAUTH_CLIENT_ID_MASTER'),
      config.devices_oauth_client_secret = java.lang.System.getenv('OAUTH_CLIENT_SECRET_MASTER'),
      config.username = java.lang.System.getenv('USERNAME_MASTER'),
      config.password = java.lang.System.getenv('PASSWORD_MASTER')
  } else {
    karate.log("env is not defined")
  }
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}
