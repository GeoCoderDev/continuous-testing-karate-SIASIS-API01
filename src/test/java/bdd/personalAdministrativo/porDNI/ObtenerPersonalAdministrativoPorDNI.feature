
Feature: Obtener datos de un Personal Administrativo específico por DNI

  Background:
    * def environments = (typeof __arg != 'undefined' && __arg.baseUrl) ? [__arg.baseUrl] : (baseUrls || [baseUrl])
    * karate.log('🌐 Environments disponibles:', environments)
    * karate.log('🔢 Total de URLs a probar:', environments.length)

  @AdminEspecificoDNI
  Scenario: Ver datos de un personal administrativo específico por DNI en TODAS las URLs disponibles
    * def results = []
    * def successCount = 0
    * def primaryPersonalAdmin = null
    * def primaryDNI = null

        # Función para probar endpoint usando helper personal-admin-específico
    * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper personal-admin-específico
            var callResult = karate.call('classpath:helpers/single-personal-administrativo-especifico.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Directivo.feature',
              rolName: 'Directivo'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Personal Admin específico obtenido correctamente');
            karate.log('🆔 DNI consultado:', callResult.DNI_Admin);

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              personalAdmin: callResult.personalAdminEspecifico,
              DNI_Admin: callResult.DNI_Admin,
              token: callResult.token,
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
              DNI_Admin: null,
              token: null
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
              primaryDNI = result.DNI_Admin;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
    * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
    * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
    * karate.log('📊 RESUMEN FINAL DE PERSONAL ADMIN ESPECÍFICO:')
    * karate.log('🌐 URLs totales probadas:', environments.length)
    * karate.log('✅ URLs exitosas:', successCount)
    * karate.log('❌ URLs fallidas:', environments.length - successCount)
    * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
    * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de personal-admin-específico funcionó correctamente')

        # Establecer variables principales para validaciones (compatibles con el código original)
    * def personalAdminEspecifico = primaryPersonalAdmin
    * def DNI_Admin = primaryDNI

    * karate.log('🎯 PERSONAL ADMIN ESPECÍFICO OBTENIDO:', personalAdminEspecifico ? 'SÍ ✅' : 'NO ❌')
    * karate.log('🎯 DNI CONSULTADO:', DNI_Admin)

        # Mostrar detalles de todos los intentos (opcional)
    * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)
