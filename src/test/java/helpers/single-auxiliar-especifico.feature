Feature: Helper para obtener auxiliar específico por DNI en cualquier URL

  Scenario: Obtener auxiliar específico en una URL específica
        # Recibir parámetros del feature principal
    * def targetUrl = __arg.targetUrl
    * def loginFeaturePath = __arg.loginFeaturePath
    * def rolName = __arg.rolName

    * karate.log('🔧 Helper Auxiliar-Específico - Ejecutando en:', targetUrl)
    * karate.log('🔧 Helper Auxiliar-Específico - Feature de login:', loginFeaturePath)
    * karate.log('🔧 Helper Auxiliar-Específico - Rol:', rolName)

        # Primero obtener la lista de auxiliares para conseguir un DNI válido
    * def auxiliaresResult = karate.call('classpath:helpers/single-obtener-auxiliares.feature', {targetUrl: targetUrl, loginFeaturePath: loginFeaturePath, rolName: rolName})

    * def token = auxiliaresResult.loginResult.token
    * def DNI_Auxiliar = auxiliaresResult.primerAuxiliarDNI

    * karate.log('🔧 Helper Auxiliar-Específico - Token obtenido:', token ? 'SÍ' : 'NO')
    * karate.log('🔧 Helper Auxiliar-Específico - DNI a consultar:', DNI_Auxiliar)

        # Verificar que tengamos un DNI válido
    * if (!DNI_Auxiliar) karate.fail('No se encontró ningún auxiliar para consultar')

        # Luego hacer request para obtener auxiliar específico usando sintaxis nativa de Karate
    * url targetUrl
    * path 'api/auxiliares/' + DNI_Auxiliar
    * header Authorization = 'Bearer ' + token
    * method get
    * status 200

        # Validar respuesta básica
    * match response == '#present'
    * match response.data == '#present'

        # Extraer datos para retornar
    * def auxiliarEspecifico = response.data

    * karate.log('🔧 Helper Auxiliar-Específico - Datos obtenidos exitosamente')
    * karate.log('🔧 Helper Auxiliar-Específico - DNI consultado:', DNI_Auxiliar)
