@CambiarEstadoPersonalAdminEspecifico
Feature: Alternar estado de un personal administrativo especifico por DNI

  Background:
    * def environments = (typeof __arg != 'undefined' && __arg.baseUrl) ? [__arg.baseUrl] : (baseUrls || [baseUrl])
    * karate.log('🌐 Environments disponibles:', environments)
    * karate.log('🔢 Total de URLs a probar:', environments.length)

  @SIASIS-TC-33 @API01 @Cambiar-Estado-Personal-Admin-Especifico
  Scenario: Cambiar estado de un personal administrativo específico por DNI en TODAS las URLs disponibles
    * def results = []
    * def successCount = 0
    * def primaryEstado = null
    * def primaryDNI = null

        # Función para probar endpoint usando helper cambiar-estado-personal-admin
    * def testUrl =
        """
        function(targetUrl, index) {
          try {
            karate.log('🚀 Probando URL #' + (index + 1) + ' de ' + environments.length + ':', targetUrl);

            // Usar karate.call para ejecutar el helper cambiar-estado-personal-admin
            var callResult = karate.call('classpath:helpers/single-cambiar-estado-personal-administrativo.feature', {
              targetUrl: targetUrl,
              loginFeaturePath: 'classpath:bdd/login/Directivo.feature',
              rolName: 'Directivo'
            });

            karate.log('✅ URL #' + (index + 1) + ' EXITOSA - Estado de personal admin cambiado correctamente');
            karate.log('🆔 DNI modificado:', callResult.DNI_Admin);
            karate.log('🔄 Nuevo estado:', callResult.nuevoEstado);

            return {
              url: targetUrl,
              index: index + 1,
              success: true,
              estadoCambiado: callResult.estadoCambiado,
              DNI_Admin: callResult.DNI_Admin,
              nuevoEstado: callResult.nuevoEstado,
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
              estadoCambiado: null,
              DNI_Admin: null,
              nuevoEstado: null,
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
            if (primaryEstado === null) {
              primaryEstado = result.nuevoEstado;
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
    * karate.log('📊 RESUMEN FINAL DE CAMBIAR ESTADO PERSONAL ADMIN:')
    * karate.log('🌐 URLs totales probadas:', environments.length)
    * karate.log('✅ URLs exitosas:', successCount)
    * karate.log('❌ URLs fallidas:', environments.length - successCount)
    * karate.log('📋 Tasa de éxito:', Math.round((successCount / environments.length) * 100) + '%')

        # Verificar que al menos una URL funcionó
    * if (successCount == 0) karate.fail('❌ CRÍTICO: Ninguna URL de cambiar-estado-personal-admin funcionó correctamente')

        # Establecer variables principales para validaciones (compatibles con el código original)
    * def estado = primaryEstado
    * def DNI_Admin = primaryDNI

    * karate.log('🎯 ESTADO CAMBIADO:', estado !== null ? 'SÍ ✅' : 'NO ❌')
    * karate.log('🎯 DNI MODIFICADO:', DNI_Admin)
    * karate.log('🎯 NUEVO ESTADO:', estado)

        # Validación adicional (manteniendo compatibilidad con el original)
    * match estado == '#boolean'

        # Mostrar detalles de todos los intentos (opcional)
    * karate.log('📋 DETALLES COMPLETOS DE TODAS LAS URLs:', results)