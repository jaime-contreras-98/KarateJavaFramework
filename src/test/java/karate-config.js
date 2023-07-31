function fn() {
	var env = karate.env; // get system property 'karate.env'
	karate.log("karate.env system property was:" , env);
	
	if(!env){
		env = 'dev';
	}
	
	var config = {
		env: env,
		myVarName: 'someValue',
		username: 'admin1',
		password: 'welcome',
		_url: 'http://localhost:9897'
	}
	
	if(env == 'dev'){
		// customize
		config.username = 'author';
		config.password = 'authorPassword';
	} else if (env == 'e2e'){
		// customize
		config.username = 'user';
		config.password = 'userPassword';
	} else if (env == 'staging'){
		// customize
		config.username = 'userStage';
		config.password = 'userPasswordStage';
		config._url = 'http://stage.localhost:9897'
	} else if (env == 'preprod'){
		config.username = 'admin1PRE',
		config.password = 'welcomePRE',
		config._url = 'http://pre.localhost:9897'
	} else if (env == 'prod'){
		config.username = 'admin1PROD',
		config.password = 'welcomePROD',
		config._url = 'http://prod.localhost:9897'
	}
		
	return config;
}