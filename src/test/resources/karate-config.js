function fn() {

  var env = karate.env || 'dev';
  karate.log('Running Karate tests for environment:', env);
  var config = {
   payPalUrl : "https://api-m.sandbox.paypal.com"
  };
  if (env === 'dev') {
    config.baseUrl = 'https://dev.example.com/api';
    config.clientId ='AQV5GfG1KCuIP2YLegv95MUSBo_PeOfBAMU5f2cL-bqOcIG98ZoaqAjXfkW4ysbi5VujgIlxSDYLfpCt'
    config.clientSecret = 'EB7jQzo5EyMM9LKx5-zVIS3gohhT7vzGvUQQzc2dQ9bYtGoVoJlG5pmDZblyQDdv0m6C3nGoQd5ws-Ct'
  } else if (env === 'qa') {
    config.baseUrl = 'https://qa.example.com/api';
  } else if (env === 'prod') {
    config.baseUrl = 'https://prod.example.com/api';
  }

  return config;
}