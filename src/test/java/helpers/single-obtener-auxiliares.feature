Feature: Helper para obtener auxiliares en cualquier URL

  Scenario: Obtener auxiliares en una URL específica
        # Recibir parámetros del feature principal
    * def targetUrl = __arg.targetUrl
    * def loginFeaturePath = __arg.loginFeaturePath
    * def rolName = __arg.rolName

    * karate.log('🔧 Helper Obtener-Auxiliares - Ejecutando en:', targetUrl)
    * karate.log('🔧 Helper Obtener-Auxiliares - Feature de login:', loginFeaturePath)
    * karate.log('🔧 Helper Obtener-Auxiliares - Rol:', rolName)

        # Primero hacer login para obtener token
    * def loginResult = karate.call(loginFeaturePath, { baseUrl: targetUrl })
    * def token = loginResult.token

    * karate.log('🔧 Helper Obtener-Auxiliares - Token obtenido:', token ? 'SÍ' : 'NO')

        # Luego hacer request para obtener auxiliares usando sintaxis nativa de Karate
    * url targetUrl
    * path 'api/auxiliares'
    * header Authorization = 'Bearer ' + token
    * method get
    * status 200

        # Validar respuesta básica
    * match response == '#present'
    * match response.data == '#present'
    * match response.data == '#array'

        # Extraer datos para retornar
    * def auxiliares = response.data
    * def primerAuxiliarDNI = auxiliares.length > 0 ? auxiliares[0].DNI_Auxiliar : null

    * karate.log('🔧 Helper Obtener-Auxiliares - Auxiliares obtenidos:', auxiliares.length)
    * karate.log('🔧 Helper Obtener-Auxiliares - Primer DNI:', primerAuxiliarDNI)
    * karate.log('🔧 Helper Obtener-Auxiliares - Rol del token:', loginResult.rol)
