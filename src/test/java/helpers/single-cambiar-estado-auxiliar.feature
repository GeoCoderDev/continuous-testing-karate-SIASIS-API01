Feature: Helper para cambiar estado de auxiliar por DNI en cualquier URL

  Scenario: Cambiar estado de auxiliar en una URL específica
        # Recibir parámetros del feature principal
    * def targetUrl = __arg.targetUrl
    * def loginFeaturePath = __arg.loginFeaturePath
    * def rolName = __arg.rolName

    * karate.log('🔧 Helper Cambiar-Estado-Auxiliar - Ejecutando en:', targetUrl)
    * karate.log('🔧 Helper Cambiar-Estado-Auxiliar - Feature de login:', loginFeaturePath)
    * karate.log('🔧 Helper Cambiar-Estado-Auxiliar - Rol:', rolName)

        # Primero obtener la lista de auxiliares para conseguir un DNI válido
    * def auxiliaresResult = karate.call('classpath:helpers/single-obtener-auxiliares.feature', { targetUrl: targetUrl, loginFeaturePath: loginFeaturePath, rolName: rolName })

    * def token = auxiliaresResult.loginResult.token
    * def DNI_Auxiliar = auxiliaresResult.primerAuxiliarDNI

    * karate.log('🔧 Helper Cambiar-Estado-Auxiliar - Token obtenido:', token ? 'SÍ' : 'NO')
    * karate.log('🔧 Helper Cambiar-Estado-Auxiliar - DNI a modificar:', DNI_Auxiliar)

        # Verificar que tengamos un DNI válido
    * if (!DNI_Auxiliar) karate.fail('No se encontró ningún auxiliar para modificar estado')

        # Luego hacer request para cambiar estado usando sintaxis nativa de Karate
    * url targetUrl
    * path 'api/auxiliares/' + DNI_Auxiliar + '/estado'
    * header Authorization = 'Bearer ' + token
    * method patch
    * status 200

        # Validar respuesta básica
    * match response == '#present'
    * match response.data == '#present'
    * match response.data.Estado == '#boolean'

        # Extraer datos para retornar
    * def estadoCambiado = response.data
    * def nuevoEstado = response.data.Estado

    * karate.log('🔧 Helper Cambiar-Estado-Auxiliar - Estado cambiado exitosamente')
    * karate.log('🔧 Helper Cambiar-Estado-Auxiliar - DNI:', DNI_Auxiliar)
    * karate.log('🔧 Helper Cambiar-Estado-Auxiliar - Nuevo estado:', nuevoEstado)
