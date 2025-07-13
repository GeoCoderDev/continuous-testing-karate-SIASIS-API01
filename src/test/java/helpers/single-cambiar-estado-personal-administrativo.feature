
Feature: Helper para cambiar estado de personal administrativo por DNI en cualquier URL

  Scenario: Cambiar estado de personal administrativo en una URL específica
        # Recibir parámetros del feature principal
    * def targetUrl = __arg.targetUrl
    * def loginFeaturePath = __arg.loginFeaturePath
    * def rolName = __arg.rolName

    * karate.log('🔧 Helper Cambiar-Estado-Personal-Admin - Ejecutando en:', targetUrl)
    * karate.log('🔧 Helper Cambiar-Estado-Personal-Admin - Feature de login:', loginFeaturePath)
    * karate.log('🔧 Helper Cambiar-Estado-Personal-Admin - Rol:', rolName)

        # Primero obtener la lista de personal admin para conseguir un DNI válido
    * def personalAdminResult = karate.call('classpath:helpers/single-obtener-personal-administrativo.feature', { targetUrl: targetUrl, loginFeaturePath: loginFeaturePath, rolName: rolName })

    * def token = personalAdminResult.loginResult.token
    * def DNI_Admin = personalAdminResult.primerPersonalAdminDNI

    * karate.log('🔧 Helper Cambiar-Estado-Personal-Admin - Token obtenido:', token ? 'SÍ' : 'NO')
    * karate.log('🔧 Helper Cambiar-Estado-Personal-Admin - DNI a modificar:', DNI_Admin)

        # Verificar que tengamos un DNI válido
    * if (!DNI_Admin) karate.fail('No se encontró ningún personal administrativo para modificar estado')

        # Luego hacer request para cambiar estado usando sintaxis nativa de Karate
    * url targetUrl
    * path 'api/personal-administrativo/' + DNI_Admin + '/estado'
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

    * karate.log('🔧 Helper Cambiar-Estado-Personal-Admin - Estado cambiado exitosamente')
    * karate.log('🔧 Helper Cambiar-Estado-Personal-Admin - DNI:', DNI_Admin)
    * karate.log('🔧 Helper Cambiar-Estado-Personal-Admin - Nuevo estado:', nuevoEstado)
