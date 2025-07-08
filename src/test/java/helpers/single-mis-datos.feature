
Feature: Helper para obtener mis-datos en cualquier URL

  Scenario: Obtener mis-datos en una URL específica
        # Recibir parámetros del feature principal
    * def targetUrl = __arg.targetUrl
    * def loginFeaturePath = __arg.loginFeaturePath
    * def rolName = __arg.rolName

    * karate.log('🔧 Helper Mis-Datos - Ejecutando en:', targetUrl)
    * karate.log('🔧 Helper Mis-Datos - Feature de login:', loginFeaturePath)
    * karate.log('🔧 Helper Mis-Datos - Rol:', rolName)

        # Primero hacer login para obtener token
    * def loginResult = karate.call(loginFeaturePath, { baseUrl: targetUrl })
    * def token = loginResult.token

    * karate.log('🔧 Helper Mis-Datos - Token obtenido:', token ? 'SÍ' : 'NO')

        # Luego hacer request a mis-datos usando sintaxis nativa de Karate
    * url targetUrl
    * path 'api/mis-datos'
    * header Authorization = 'Bearer ' + token
    * method get
    * status 200

        # Validar respuesta básica
    * match response == '#present'

        # Extraer datos para retornar
    * def datosPersonales = response

    * karate.log('🔧 Helper Mis-Datos - Datos obtenidos exitosamente')
    * karate.log('🔧 Helper Mis-Datos - Rol del token:', loginResult.rol)
