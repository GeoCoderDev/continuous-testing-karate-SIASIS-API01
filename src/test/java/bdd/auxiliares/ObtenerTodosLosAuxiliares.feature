Feature: Obtener todos los auxiliares registrados en el sistema

  Background:
    * def environments = (typeof __arg != 'undefined' && __arg.baseUrl) ? [__arg.baseUrl] : (baseUrls || [baseUrl])
    * karate.log('🌐 Environments disponibles:', environments)
    * karate.log('🔢 Total de URLs a probar:', environments.length)

  @obtencion @smoke @API01 @RDP02 @directivo @auxiliar
  Scenario: Ver todos los auxiliares con Directivo en TODAS las URLs disponibles
    * def results = []
    * def successCount = 0
    * def primaryAuxiliares = null
    * def primaryDNI = null

        # Función para probar endpoint usando helper obtener-auxiliares
    * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper obtener-auxiliares
            var callResult = karate.call('classpath:helpers/single-obtener-auxiliares.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Directivo.feature',
              rolName: 'Directivo'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Auxiliares obtenidos correctamente');
            karate.log('📋 Cantidad de auxiliares:', callResult.auxiliares.length);
            karate.log('🆔 Primer DNI:', callResult.primerAuxiliarDNI);

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              auxiliares: callResult.auxiliares,
              primerDNI: callResult.primerAuxiliarDNI,
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
              auxiliares: null,
              primerDNI: null,
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
            if (!primaryAuxiliares) {
              primaryAuxiliares = result.auxiliares;
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
    * karate.log('📊 RESUMEN FINAL DE OBTENER AUXILIARES CON DIRECTIVO:')
    * karate.log('🌐 URLs totales probadas:', environments.length)
    * karate.log('✅ URLs exitosas:', successCount)
    * karate.log('❌ URLs fallidas:', environments.length - successCount)
    * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
    * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de obtener-auxiliares funcionó correctamente')

        # Establecer variables principales para validaciones
    * def auxiliares = primaryAuxiliares
    * def DNI = primaryDNI

    * karate.log('🎯 AUXILIARES OBTENIDOS:', auxiliares ? auxiliares.length + ' auxiliares' : 'NINGUNO')
    * karate.log('🎯 PRIMER DNI:', DNI)

        # Mostrar detalles de todos los intentos (opcional)
    * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

        # Validaciones adicionales (opcionales)
    * if (auxiliares && auxiliares.length > 0) karate.log('✅ Se encontraron auxiliares en el sistema')
    * if (auxiliares && auxiliares.length == 0) karate.log('⚠️ No hay auxiliares registrados en el sistema')
