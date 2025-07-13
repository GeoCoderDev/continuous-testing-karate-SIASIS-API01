Feature: Helper para obtener personal administrativo en cualquier URL

  Scenario: Obtener personal administrativo en una URL específica
        # Recibir parámetros del feature principal
    * def targetUrl = __arg.targetUrl
    * def loginFeaturePath = __arg.loginFeaturePath
    * def rolName = __arg.rolName

    * karate.log('🔧 Helper Obtener-Personal-Admin - Ejecutando en:', targetUrl)
    * karate.log('🔧 Helper Obtener-Personal-Admin - Feature de login:', loginFeaturePath)
    * karate.log('🔧 Helper Obtener-Personal-Admin - Rol:', rolName)

        # Primero hacer login para obtener token
    * def loginResult = karate.call(loginFeaturePath, { baseUrl: targetUrl })
    * def token = loginResult.token

    * karate.log('🔧 Helper Obtener-Personal-Admin - Token obtenido:', token ? 'SÍ' : 'NO')

        # Luego hacer request para obtener personal administrativo usando sintaxis nativa de Karate
    * url targetUrl
    * path 'api/personal-administrativo'
    * header Authorization = 'Bearer ' + token
    * method get
    * status 200

        # Validar respuesta básica
    * match response == '#present'
    * match response.data == '#present'
    * match response.data == '#array'

        # Extraer datos para retornar
    * def personalAdmin = response.data
    * def primerPersonalAdminDNI = personalAdmin.length > 0 ? personalAdmin[0].DNI_Personal_Administrativo : null

    * karate.log('🔧 Helper Obtener-Personal-Admin - Personal Admin obtenido:', personalAdmin.length)
    * karate.log('🔧 Helper Obtener-Personal-Admin - Primer DNI:', primerPersonalAdminDNI)
    * karate.log('🔧 Helper Obtener-Personal-Admin - Rol del token:', loginResult.rol)
