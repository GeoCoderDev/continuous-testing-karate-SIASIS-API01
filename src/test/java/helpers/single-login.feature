Feature: Helper para login individual en cualquier URL

  Scenario: Login en una URL específica
        # Recibir parámetros del feature principal
    * def targetUrl = __arg.targetUrl
    * def username = __arg.username
    * def password = __arg.password
    * def endpoint = __arg.endpoint

    * karate.log('🔧 Helper - Ejecutando login en:', targetUrl)
    * karate.log('🔧 Helper - Endpoint:', endpoint)
    * karate.log('🔧 Helper - Usuario:', username)

        # Ejecutar login usando sintaxis nativa de Karate
    * url targetUrl
    * path endpoint
    * request
        """
        {
          "Nombre_Usuario": "#(username)",
          "Contraseña": "#(password)"
        }
        """
    * method post
    * status 200

        # Validar respuesta
    * match response.success == true
    * match response.data.token == '#present'
    * match response.data.Rol == '#present'

        # Extraer datos para retornar
    * def token = response.data.token
    * def rol = response.data.Rol

    * karate.log('🔧 Helper - Login exitoso')
    * karate.log('🔧 Helper - Token obtenido:', token ? 'SÍ' : 'NO')
    * karate.log('🔧 Helper - Rol:', rol)