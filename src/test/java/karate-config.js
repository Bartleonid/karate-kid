function fn() {
  var env = java.lang.System.getenv('GIT_BRANCH');
  karate.log("Environment = " + env);
  var config = {
    url: '',
    username: java.lang.System.getenv('USERNAME'),
    password: java.lang.System.getenv('PASSWORD')
  };
  if (env == 'qa') {
    config.environment = '',
      config.url = '',
      config.username = java.lang.System.getenv('USERNAME_QA'),
      config.password = java.lang.System.getenv('PASSWORD_QA')
  } else if (env == 'staging') {
    config.url = '',
      config.username = java.lang.System.getenv('USERNAME_STAGING'),
      config.password = java.lang.System.getenv('PASSWORD_STAGING')
  } else if (env == 'master') {
      config.url = '',
      config.username = java.lang.System.getenv('USERNAME_MASTER'),
      config.password = java.lang.System.getenv('PASSWORD_MASTER')
  } else {
    karate.log("env is not defined")
  }
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}
