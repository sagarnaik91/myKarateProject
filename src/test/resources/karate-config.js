function fn() {
  var env = karate.env || 'dev';

  var config = {
    env: env,
    baseUrl: 'https://api.dev.example.com',
    odata: {
      bp: '/sap/opu/odata/sap/API_BUSINESS_PARTNER',
      so: '/sap/opu/odata/sap/API_SALES_ORDER_SRV'
    }
  };

  if (env == 'qa') {
    config.baseUrl = 'https://api.qa.example.com';
  } else if (env == 'prod') {
    config.baseUrl = 'https://api.example.com';
  }

  // common headers (example)
  karate.configure('headers', { 'Accept': 'application/json' });

  // retry policy (optional)
  karate.configure('retry', { count: 3, interval: 1000 });

  return config;
}