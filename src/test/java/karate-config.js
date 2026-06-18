function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    config.baseUrl = 'https://serverest.dev';
  } else if (env == 'qa') {
    config.baseUrl = 'https://localhost:3000';
  }
  return config;
}