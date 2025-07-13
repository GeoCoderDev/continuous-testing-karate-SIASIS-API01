
@misDatos
Feature: Obtencion de datos personales por rol

    Background:
        * def environments = (typeof __arg != 'undefined' && __arg.baseUrl) ? [__arg.baseUrl] : (baseUrls || [baseUrl])
        * karate.log('🌐 Environments disponibles:', environments)
        * karate.log('🔢 Total de URLs a probar:', environments.length)

    @SIASIS-TC-27 @API01 @Obtener-Mis-Datos-Directivo
    Scenario: Obtener mis datos personales como Directivo en TODAS las URLs disponibles
        * def results = []
        * def successCount = 0
        * def primaryData = null

        # Función para probar endpoint usando helper mis-datos
        * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper mis-datos
            var callResult = karate.call('classpath:helpers/single-mis-datos.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Directivo.feature',
              rolName: 'Directivo'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Datos obtenidos correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              data: callResult.datosPersonales,
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
              data: null,
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
            if (!primaryData) {
              primaryData = result.data;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
        * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
        * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
        * karate.log('📊 RESUMEN FINAL DE MIS DATOS DIRECTIVO:')
        * karate.log('🌐 URLs totales probadas:', environments.length)
        * karate.log('✅ URLs exitosas:', successCount)
        * karate.log('❌ URLs fallidas:', environments.length - successCount)
        * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
        * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de mis-datos funcionó correctamente')

        # Establecer datos principales para validaciones
        * def datosPersonales = primaryData

        * karate.log('🎯 DATOS PRINCIPALES OBTENIDOS:', datosPersonales ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
        * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

    @SIASIS-TC-24 @API01 @Obtener-Mis-Datos-Profesor-Primaria
    Scenario: Obtener mis datos personales como Profesor de Primaria en TODAS las URLs disponibles
        * def results = []
        * def successCount = 0
        * def primaryData = null

        # Función para probar endpoint usando helper mis-datos
        * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper mis-datos
            var callResult = karate.call('classpath:helpers/single-mis-datos.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/ProfesorPrimaria.feature',
              rolName: 'Profesor Primaria'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Datos obtenidos correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              data: callResult.datosPersonales,
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
              data: null,
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
            if (!primaryData) {
              primaryData = result.data;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
        * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
        * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
        * karate.log('📊 RESUMEN FINAL DE MIS DATOS PROFESOR PRIMARIA:')
        * karate.log('🌐 URLs totales probadas:', environments.length)
        * karate.log('✅ URLs exitosas:', successCount)
        * karate.log('❌ URLs fallidas:', environments.length - successCount)
        * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
        * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de mis-datos funcionó correctamente')

        # Establecer datos principales para validaciones
        * def datosPersonales = primaryData

        * karate.log('🎯 DATOS PRINCIPALES OBTENIDOS:', datosPersonales ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
        * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

    @SIASIS-TC-26 @API01 @Obtener-Mis-Datos-Auxiliar
    Scenario: Obtener mis datos personales como Auxiliar en TODAS las URLs disponibles
        * def results = []
        * def successCount = 0
        * def primaryData = null

        # Función para probar endpoint usando helper mis-datos
        * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper mis-datos
            var callResult = karate.call('classpath:helpers/single-mis-datos.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Auxiliar.feature',
              rolName: 'Auxiliar'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Datos obtenidos correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              data: callResult.datosPersonales,
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
              data: null,
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
            if (!primaryData) {
              primaryData = result.data;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
        * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
        * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
        * karate.log('📊 RESUMEN FINAL DE MIS DATOS AUXILIAR:')
        * karate.log('🌐 URLs totales probadas:', environments.length)
        * karate.log('✅ URLs exitosas:', successCount)
        * karate.log('❌ URLs fallidas:', environments.length - successCount)
        * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
        * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de mis-datos funcionó correctamente')

        # Establecer datos principales para validaciones
        * def datosPersonales = primaryData

        * karate.log('🎯 DATOS PRINCIPALES OBTENIDOS:', datosPersonales ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
        * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

    @SIASIS-TC-29 @API01 @Obtener-Mis-Datos-No-Tutor
    Scenario: Obtener mis datos personales como Profesor de Secundaria en TODAS las URLs disponibles
        * def results = []
        * def successCount = 0
        * def primaryData = null

        # Función para probar endpoint usando helper mis-datos
        * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper mis-datos
            var callResult = karate.call('classpath:helpers/single-mis-datos.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/ProfesorSecundaria.feature',
              rolName: 'Profesor Secundaria'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Datos obtenidos correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              data: callResult.datosPersonales,
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
              data: null,
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
            if (!primaryData) {
              primaryData = result.data;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
        * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
        * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
        * karate.log('📊 RESUMEN FINAL DE MIS DATOS PROFESOR SECUNDARIA:')
        * karate.log('🌐 URLs totales probadas:', environments.length)
        * karate.log('✅ URLs exitosas:', successCount)
        * karate.log('❌ URLs fallidas:', environments.length - successCount)
        * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
        * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de mis-datos funcionó correctamente')

        # Establecer datos principales para validaciones
        * def datosPersonales = primaryData

        * karate.log('🎯 DATOS PRINCIPALES OBTENIDOS:', datosPersonales ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
        * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

    @SIASIS-TC-28 @API01 @Obtener-Mis-Datos-Tutor-Secundaria
    Scenario: Obtener mis datos personales como Tutor en TODAS las URLs disponibles
        * def results = []
        * def successCount = 0
        * def primaryData = null

        # Función para probar endpoint usando helper mis-datos
        * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper mis-datos
            var callResult = karate.call('classpath:helpers/single-mis-datos.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Tutor.feature',
              rolName: 'Tutor'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Datos obtenidos correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              data: callResult.datosPersonales,
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
              data: null,
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
            if (!primaryData) {
              primaryData = result.data;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
        * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
        * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
        * karate.log('📊 RESUMEN FINAL DE MIS DATOS TUTOR:')
        * karate.log('🌐 URLs totales probadas:', environments.length)
        * karate.log('✅ URLs exitosas:', successCount)
        * karate.log('❌ URLs fallidas:', environments.length - successCount)
        * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
        * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de mis-datos funcionó correctamente')

        # Establecer datos principales para validaciones
        * def datosPersonales = primaryData

        * karate.log('🎯 DATOS PRINCIPALES OBTENIDOS:', datosPersonales ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
        * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

    @SIASIS-TC-25 @API01 @Obtener-Mis-Datos-Personal-Admin
    Scenario: Obtener mis datos personales como Personal Administrativo en TODAS las URLs disponibles
        * def results = []
        * def successCount = 0
        * def primaryData = null

        # Función para probar endpoint usando helper mis-datos
        * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper mis-datos
            var callResult = karate.call('classpath:helpers/single-mis-datos.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/PersonalAdministrativo.feature',
              rolName: 'Personal Administrativo'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Datos obtenidos correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              data: callResult.datosPersonales,
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
              data: null,
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
            if (!primaryData) {
              primaryData = result.data;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
        * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
        * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
        * karate.log('📊 RESUMEN FINAL DE MIS DATOS PERSONAL ADMINISTRATIVO:')
        * karate.log('🌐 URLs totales probadas:', environments.length)
        * karate.log('✅ URLs exitosas:', successCount)
        * karate.log('❌ URLs fallidas:', environments.length - successCount)
        * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
        * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de mis-datos funcionó correctamente')

        # Establecer datos principales para validaciones
        * def datosPersonales = primaryData

        * karate.log('🎯 DATOS PRINCIPALES OBTENIDOS:', datosPersonales ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
        * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)