
@casoTutor
Feature: Inicio de Sesion de Tutor

    Background:
        * def environments = (typeof __arg != 'undefined' && __arg.baseUrl) ? [__arg.baseUrl] : (baseUrls || [baseUrl])
        * karate.log('🌐 Environments disponibles:', environments)
        * karate.log('🔢 Total de URLs a probar:', environments.length)

    @SIASIS-TC-14 @API01 @Iniciar-Sesion-Caso-Tutor
    Scenario: Token de tutor en TODAS las URLs disponibles
        * def results = []
        * def successCount = 0
        * def primaryToken = null
        * def primaryRol = null

        # Función para probar login usando helper feature
        * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper feature
            var callResult = karate.call('classpath:helpers/single-login.feature', {
              targetUrl: targetUrl,
              username: 'daniel_sanchez_1542',
              password: '15420745',
              endpoint: 'api/login/profesor-tutor-secundaria'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA');
            karate.log('Token obtenido:', callResult.token ? 'SÍ' : 'NO');
            karate.log('Rol:', callResult.rol);

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              token: callResult.token,
              rol: callResult.rol,
              status: 200
            };

          } catch (error) {
            karate.log('❌ URL #' + (index + 1) + ' FALLÓ:', error.message);
            return {
              url: targetUrl,
              index: index + 1,
              success: false,
              error: error.message,
              token: null,
              rol: null
            };
          }
        }
        """

        # Procesar cada URL del array
        * def processEachUrl =
        """
        function(url, index) {
          var result = testUrl(url, index);
          results.push(result);

          if (result.success) {
            successCount++;
            // Usar el primer login exitoso como resultado principal
            if (!primaryToken) {
              primaryToken = result.token;
              primaryRol = result.rol;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
        * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
        * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
        * karate.log('📊 RESUMEN FINAL DE LOGIN TUTOR:')
        * karate.log('🌐 URLs totales probadas:', environments.length)
        * karate.log('✅ URLs exitosas:', successCount)
        * karate.log('❌ URLs fallidas:', environments.length - successCount)
        * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
        * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de login funcionó correctamente')

        # Establecer variables principales para otros features
        * def token = primaryToken
        * def rol = primaryRol

        * karate.log('🎯 TOKEN PRINCIPAL SELECCIONADO:', token ? 'OBTENIDO ✅' : 'FALLO ❌')
        * karate.log('🎯 ROL PRINCIPAL:', rol)

        # Mostrar detalles de todos los intentos (opcional)
        * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)