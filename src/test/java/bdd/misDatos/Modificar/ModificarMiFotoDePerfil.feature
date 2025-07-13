
@modificarPerfil
Feature: Modificar mi propia foto de perfil

  Background:
    * def environments = (typeof __arg != 'undefined' && __arg.baseUrl) ? [__arg.baseUrl] : (baseUrls || [baseUrl])
    * karate.log('🌐 Environments disponibles:', environments)
    * karate.log('🔢 Total de URLs a probar:', environments.length)

  Scenario: Modificar foto de perfil como Profesor de Primaria en TODAS las URLs disponibles
    * def results = []
    * def successCount = 0
    * def primaryResponse = null

        # Función para probar endpoint usando helper foto-perfil
    * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper foto-perfil
            var callResult = karate.call('classpath:helpers/single-foto-perfil.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/ProfesorPrimaria.feature',
              rolName: 'Profesor Primaria',
              fotoPath: 'classpath:data/fotosPerfil/prueba.jpeg',
              fotoFilename: 'prueba.jpeg'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Foto actualizada correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              response: callResult.fotoActualizada,
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
              response: null,
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
            // Usar el primer resultado exitoso como respuesta principal
            if (!primaryResponse) {
              primaryResponse = result.response;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
    * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
    * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
    * karate.log('📊 RESUMEN FINAL DE FOTO PERFIL PROFESOR PRIMARIA:')
    * karate.log('🌐 URLs totales probadas:', environments.length)
    * karate.log('✅ URLs exitosas:', successCount)
    * karate.log('❌ URLs fallidas:', environments.length - successCount)
    * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
    * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de foto-perfil funcionó correctamente')

        # Establecer respuesta principal para validaciones
    * def fotoPerfilResponse = primaryResponse

    * karate.log('🎯 FOTO ACTUALIZADA:', fotoPerfilResponse ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
    * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

  Scenario: Modificar foto de perfil como Auxiliar en TODAS las URLs disponibles
    * def results = []
    * def successCount = 0
    * def primaryResponse = null

        # Función para probar endpoint usando helper foto-perfil
    * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper foto-perfil
            var callResult = karate.call('classpath:helpers/single-foto-perfil.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Auxiliar.feature',
              rolName: 'Auxiliar',
              fotoPath: 'classpath:data/fotosPerfil/prueba.jpeg',
              fotoFilename: 'prueba.jpeg'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Foto actualizada correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              response: callResult.fotoActualizada,
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
              response: null,
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
            // Usar el primer resultado exitoso como respuesta principal
            if (!primaryResponse) {
              primaryResponse = result.response;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
    * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
    * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
    * karate.log('📊 RESUMEN FINAL DE FOTO PERFIL AUXILIAR:')
    * karate.log('🌐 URLs totales probadas:', environments.length)
    * karate.log('✅ URLs exitosas:', successCount)
    * karate.log('❌ URLs fallidas:', environments.length - successCount)
    * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
    * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de foto-perfil funcionó correctamente')

        # Establecer respuesta principal para validaciones
    * def fotoPerfilResponse = primaryResponse

    * karate.log('🎯 FOTO ACTUALIZADA:', fotoPerfilResponse ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
    * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

  Scenario: Modificar foto de perfil como Profesor de Secundaria en TODAS las URLs disponibles
    * def results = []
    * def successCount = 0
    * def primaryResponse = null

        # Función para probar endpoint usando helper foto-perfil
    * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper foto-perfil
            var callResult = karate.call('classpath:helpers/single-foto-perfil.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/ProfesorSecundaria.feature',
              rolName: 'Profesor Secundaria',
              fotoPath: 'classpath:data/fotosPerfil/prueba.jpeg',
              fotoFilename: 'prueba.jpeg'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Foto actualizada correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              response: callResult.fotoActualizada,
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
              response: null,
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
            // Usar el primer resultado exitoso como respuesta principal
            if (!primaryResponse) {
              primaryResponse = result.response;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
    * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
    * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
    * karate.log('📊 RESUMEN FINAL DE FOTO PERFIL PROFESOR SECUNDARIA:')
    * karate.log('🌐 URLs totales probadas:', environments.length)
    * karate.log('✅ URLs exitosas:', successCount)
    * karate.log('❌ URLs fallidas:', environments.length - successCount)
    * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
    * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de foto-perfil funcionó correctamente')

        # Establecer respuesta principal para validaciones
    * def fotoPerfilResponse = primaryResponse

    * karate.log('🎯 FOTO ACTUALIZADA:', fotoPerfilResponse ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
    * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

  Scenario: Modificar foto de perfil como Tutor en TODAS las URLs disponibles
    * def results = []
    * def successCount = 0
    * def primaryResponse = null

        # Función para probar endpoint usando helper foto-perfil
    * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper foto-perfil
            var callResult = karate.call('classpath:helpers/single-foto-perfil.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Tutor.feature',
              rolName: 'Tutor',
              fotoPath: 'classpath:data/fotosPerfil/prueba.jpeg',
              fotoFilename: 'prueba.jpeg'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Foto actualizada correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              response: callResult.fotoActualizada,
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
              response: null,
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
            // Usar el primer resultado exitoso como respuesta principal
            if (!primaryResponse) {
              primaryResponse = result.response;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
    * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
    * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
    * karate.log('📊 RESUMEN FINAL DE FOTO PERFIL TUTOR:')
    * karate.log('🌐 URLs totales probadas:', environments.length)
    * karate.log('✅ URLs exitosas:', successCount)
    * karate.log('❌ URLs fallidas:', environments.length - successCount)
    * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
    * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de foto-perfil funcionó correctamente')

        # Establecer respuesta principal para validaciones
    * def fotoPerfilResponse = primaryResponse

    * karate.log('🎯 FOTO ACTUALIZADA:', fotoPerfilResponse ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
    * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

  Scenario: Modificar foto de perfil como Directivo en TODAS las URLs disponibles
    * def results = []
    * def successCount = 0
    * def primaryResponse = null

        # Función para probar endpoint usando helper foto-perfil
    * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper foto-perfil
            var callResult = karate.call('classpath:helpers/single-foto-perfil.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Directivo.feature',
              rolName: 'Directivo',
              fotoPath: 'classpath:data/fotosPerfil/prueba.jpeg',
              fotoFilename: 'prueba.jpeg'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Foto actualizada correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              response: callResult.fotoActualizada,
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
              response: null,
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
            // Usar el primer resultado exitoso como respuesta principal
            if (!primaryResponse) {
              primaryResponse = result.response;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
    * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
    * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
    * karate.log('📊 RESUMEN FINAL DE FOTO PERFIL DIRECTIVO:')
    * karate.log('🌐 URLs totales probadas:', environments.length)
    * karate.log('✅ URLs exitosas:', successCount)
    * karate.log('❌ URLs fallidas:', environments.length - successCount)
    * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
    * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de foto-perfil funcionó correctamente')

        # Establecer respuesta principal para validaciones
    * def fotoPerfilResponse = primaryResponse

    * karate.log('🎯 FOTO ACTUALIZADA:', fotoPerfilResponse ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
    * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)

  Scenario: Modificar foto de perfil como Personal Administrativo en TODAS las URLs disponibles
    * def results = []
    * def successCount = 0
    * def primaryResponse = null

        # Función para probar endpoint usando helper foto-perfil
    * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper foto-perfil
            var callResult = karate.call('classpath:helpers/single-foto-perfil.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/PersonalAdministrativo.feature',
              rolName: 'Personal Administrativo',
              fotoPath: 'classpath:data/fotosPerfil/prueba.jpeg',
              fotoFilename: 'prueba.jpeg'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Foto actualizada correctamente');

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              response: callResult.fotoActualizada,
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
              response: null,
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
            // Usar el primer resultado exitoso como respuesta principal
            if (!primaryResponse) {
              primaryResponse = result.response;
              karate.log('🎯 Estableciendo URL #' + result.index + ' como resultado principal');
            }
          }
        }
        """

        # Ejecutar test en TODAS las URLs del array environments
    * karate.log('🚀 INICIANDO PRUEBAS EN TODAS LAS URLs...')
    * karate.forEach(environments, processEachUrl)

        # Mostrar resumen completo
    * karate.log('📊 RESUMEN FINAL DE FOTO PERFIL PERSONAL ADMINISTRATIVO:')
    * karate.log('🌐 URLs totales probadas:', environments.length)
    * karate.log('✅ URLs exitosas:', successCount)
    * karate.log('❌ URLs fallidas:', environments.length - successCount)
    * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
    * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de foto-perfil funcionó correctamente')

        # Establecer respuesta principal para validaciones
    * def fotoPerfilResponse = primaryResponse

    * karate.log('🎯 FOTO ACTUALIZADA:', fotoPerfilResponse ? 'SÍ ✅' : 'NO ❌')

        # Mostrar detalles de todos los intentos (opcional)
    * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)