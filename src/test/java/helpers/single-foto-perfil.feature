Feature: Helper para modificar foto de perfil en cualquier URL

  Scenario: Modificar foto de perfil en una URL específica
        # Recibir parámetros del feature principal
    * def targetUrl = __arg.targetUrl
    * def loginFeaturePath = __arg.loginFeaturePath
    * def rolName = __arg.rolName
    * def fotoPath = __arg.fotoPath || 'classpath:data/fotosPerfil/prueba.jpeg'
    * def fotoFilename = __arg.fotoFilename || 'prueba.jpeg'

    * karate.log('🔧 Helper Foto-Perfil - Ejecutando en:', targetUrl)
    * karate.log('🔧 Helper Foto-Perfil - Feature de login:', loginFeaturePath)
    * karate.log('🔧 Helper Foto-Perfil - Rol:', rolName)
    * karate.log('🔧 Helper Foto-Perfil - Archivo:', fotoPath)

        # Primero hacer login para obtener token
    * def loginResult = karate.call(loginFeaturePath, { baseUrl: targetUrl })
    * def token = loginResult.token

    * karate.log('🔧 Helper Foto-Perfil - Token obtenido:', token ? 'SÍ' : 'NO')

        # Luego hacer request para subir foto usando sintaxis nativa de Karate
    * url targetUrl
    * path 'api/mis-datos/mi-foto-perfil'
    * header Authorization = 'Bearer ' + token
    * multipart file foto = { read: '#(fotoPath)', filename: '#(fotoFilename)' }
    * method put
    * status 200

        # Validar respuesta básica
    * match response == '#present'

        # Extraer datos para retornar
    * def fotoActualizada = response

    * karate.log('🔧 Helper Foto-Perfil - Foto actualizada exitosamente')
    * karate.log('🔧 Helper Foto-Perfil - Rol del token:', loginResult.rol)
