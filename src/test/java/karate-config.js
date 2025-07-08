function fn() {
    var env = karate.env;
    if (!env) {
       env = 'C'; // Por defecto ejecutar en todas las copias de certificación
    }

    var config = {};

    // ==============================================
    // DESARROLLO (D = Development)
    // ==============================================

    // D1 = Desarrollo copia 1
    if (env == 'D1') {
       config.baseUrl = "https://api01-siasis-dev.vercel.app/";
    }

    // D2 = Desarrollo copia 2
    if (env == 'D2') {
       config.baseUrl = "https://api01-siasis-dev-ins2.vercel.app/";
    }

    // ==============================================
    // CERTIFICACIÓN (C = Certification)
    // ==============================================

    // C1 = Certificación copia 1
    if (env == 'C1') {
       config.baseUrl = 'https://api01-siasis-cert.vercel.app/';
    }

    // C2 = Certificación copia 2
    if (env == 'C2') {
       config.baseUrl = 'https://api01-siasis-cert-ins2.vercel.app/';
    }

    // C3 = Certificación copia 3
    if (env == 'C3') {
       config.baseUrl = "https://api01-siasis-cert-ins3.vercel.app/";
    }

    // ==============================================
    // PRODUCCIÓN (P = Production)
    // ==============================================

    // P1 = Producción copia 1
    if (env == 'P1') {
       config.baseUrl = "https://ie20935-api01-ins1.vercel.app";
    }

    // P2 = Producción copia 2
    if (env == 'P2') {
       config.baseUrl = "https://ie20935-api01-ins1.vercel.app";
    }

    // P3 = Producción copia 3
    if (env == 'P3') {
       config.baseUrl = "https://ie20935-api01-ins1.vercel.app";
    }

    // ==============================================
    // MÚLTIPLES ENTORNOS (TODAS LAS COPIAS)
    // ==============================================

    // C = TODAS las copias de Certificación (C1 + C2 + C3)
    if (env == 'C') {
       config.baseUrls = [
           'https://api01-siasis-cert.vercel.app/',           // C1
           'https://api01-siasis-cert-ins2.vercel.app/',      // C2
           'https://api01-siasis-cert-ins3.vercel.app/'       // C3
       ];
       config.baseUrl = config.baseUrls[0]; // URL por defecto
    }

    // D = TODAS las copias de Desarrollo (D1 + D2)
    if (env == 'D') {
       config.baseUrls = [
           'https://api01-siasis-dev.vercel.app/',            // D1
           'https://api01-siasis-dev-ins2.vercel.app/'        // D2
       ];
       config.baseUrl = config.baseUrls[0]; // URL por defecto
    }

    // P = TODAS las copias de Producción (P1 + P2 + P3)
    if (env == 'P') {
       config.baseUrls = [
           'https://ie20935-api01-ins1.vercel.app',           // P1
           'https://ie20935-api01-ins1.vercel.app',           // P2
           'https://ie20935-api01-ins1.vercel.app'            // P3
       ];
       config.baseUrl = config.baseUrls[0]; // URL por defecto
    }

    karate.configure('connectTimeout', 20000);
    karate.configure('readTimeout', 20000);
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);

    karate.log('Ambiente configurado:', env);
    karate.log('BaseURL(s) configurada(s):', config.baseUrls || config.baseUrl);

    return config;
}