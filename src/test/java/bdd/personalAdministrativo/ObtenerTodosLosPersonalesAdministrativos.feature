
Feature: Obtener todos los personales administrativos registrados en el sistema

    Background:
        * def environments = (typeof __arg != 'undefined' && __arg.baseUrl) ? [__arg.baseUrl] : (baseUrls || [baseUrl])
        * karate.log('🌐 Environments disponibles:', environments)
        * karate.log('🔢 Total de URLs a probar:', environments.length)

    @TodosPersonalesAdmin
    Scenario: Ver todos los personales Administrativos en TODAS las URLs disponibles
        * def results = []
        * def successCount = 0
        * def primaryPersonalAdmin = null
        * def primaryDNI = null

        # Función para probar endpoint usando helper obtener-personal-admin
        * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper obtener-personal-admin
            var callResult = karate.call('classpath:helpers/single-obtener-personal-administrativo.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Directivo.feature',
              rolName: 'Directivo'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Personal Admin obtenido correctamente');
            karate.log('📋 Cantidad de personal admin:', callResult.personalAdmin.length);
            karate.log('🆔 Primer DNI:', callResult.primerPersonalAdminDNI);

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              personalAdmin: callResult.personalAdmin,
              primerDNI: callResult.primerPersonalAdminDNI,
              token: callResult.loginResult.token,
              rol: callResult.loginResult.rol,
              status: 200
            };

          } catch (error) {
            karate.log('❌ URL #' + (index + 1) + ' FALLÓ:', error.message);
            return {
              url: targetUrl,
              index: index + 1,
              success: false,
              error: error.message,
              personalAdmin: null,
              primerDNI: null,
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
            // Usar el primer resultado exitoso como datos principales
            if (!primaryPersonalAdmin) {
              primaryPersonalAdmin = result.personalAdmin;
              primaryDNI = result.primerDNI;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
        * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
        * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
        * karate.log('📊 RESUMEN FINAL DE OBTENER PERSONAL ADMINISTRATIVO:')
        * karate.log('🌐 URLs totales probadas:', environments.length)
        * karate.log('✅ URLs exitosas:', successCount)
        * karate.log('❌ URLs fallidas:', environments.length - successCount)
        * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
        * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de obtener-personal-admin funcionó correctamente')

        # Establecer variables principales para validaciones (compatibles con el código original)
        * def personalAdmin = primaryPersonalAdmin
        * def DNI = primaryDNI

        * karate.log('🎯 PERSONAL ADMIN OBTENIDO:', personalAdmin ? personalAdmin.length + ' registros' : 'NINGUNO')
        * karate.log('🎯 PRIMER DNI:', DNI)

        # Mostrar detalles de todos los intentos (opcional)
        * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

        # Validaciones adicionales (opcionales)
        * if (personalAdmin && personalAdmin.length > 0) karate.log('✅ Se encontró personal administrativo en el sistema')
        * if (personalAdmin && personalAdmin.length == 0) karate.log('⚠️ No hay personal administrativo registrado en el sistema')
