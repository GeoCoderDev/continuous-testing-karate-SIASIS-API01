
function fn() {
	var env = karate.env;
	if (!env) {
		env = 'integracion';
	}

	var config = {
	};

	if (env == 'desa') {
		config.baseUrl = "https://api01-siasis-dev.vercel.app/"
	}

	if (env == 'desaIns02') {
		config.baseUrl = "https://api01-siasis-dev-ins2.vercel.app/"
	}

	if (env == 'certi') {
		config.baseUrl = 'https://api01-siasis-cert.vercel.app/';

	}

	if (env == 'certiIns02') {
		config.baseUrl = 'https://api01-siasis-cert-ins2.vercel.app/';

	}
	if (env == 'certiIns03') {
		config.baseUrl = "https://api01-siasis-cert-ins3.vercel.app/"
	}
	
	if (env == 'prod') {
		config.baseUrl = "https://ie20935-api01-ins1.vercel.app"
	}
		
	if (env == 'prodIns02') {
		config.baseUrl = "https://ie20935-api01-ins1.vercel.app"
	}
		
	if (env == 'prodIns03') {
		config.baseUrl = "https://ie20935-api01-ins1.vercel.app"
	}

	karate.configure('connectTimeout', 20000);
	karate.configure('readTimeout', 20000);
	karate.configure('logPrettyRequest', true);
	karate.configure('logPrettyResponse', true);
	return config;
}