
Feature: Helper para obtener personal administrativo específico por DNI en cualquier URL

  Scenario: Obtener personal administrativo específico en una URL específica
        # Recibir parámetros del feature principal
    * def targetUrl = __arg.targetUrl
    * def loginFeaturePath = __arg.loginFeaturePath
    * def rolName = __arg.rolName

    * karate.log('🔧 Helper Personal-Admin-Específico - Ejecutando en:', targetUrl)
    * karate.log('🔧 Helper Personal-Admin-Específico - Feature de login:', loginFeaturePath)
    * karate.log('🔧 Helper Personal-Admin-Específico - Rol:', rolName)

        # Primero obtener la lista de personal admin para conseguir un DNI válido
    * def personalAdminResult = karate.call('classpath:helpers/single-obtener-personal-administrativo.feature', { targetUrl: targetUrl, loginFeaturePath: loginFeaturePath, rolName: rolName })

    * def token = personalAdminResult.loginResult.token
    * def DNI_Admin = personalAdminResult.primerPersonalAdminDNI

    * karate.log('🔧 Helper Personal-Admin-Específico - Token obtenido:', token ? 'SÍ' : 'NO')
    * karate.log('🔧 Helper Personal-Admin-Específico - DNI a consultar:', DNI_Admin)

        # Verificar que tengamos un DNI válido
    * if (!DNI_Admin) karate.fail('No se encontró ningún personal administrativo para consultar')

        # Luego hacer request para obtener personal admin específico usando sintaxis nativa de Karate
    * url targetUrl
    * path 'api/personal-administrativo/' + DNI_Admin
    * header Authorization = 'Bearer ' + token
    * method get
    * status 200

        # Validar respuesta básica
    * match response == '#present'
    * match response.data == '#present'

        # Extraer datos para retornar
    * def personalAdminEspecifico = response.data

    * karate.log('🔧 Helper Personal-Admin-Específico - Datos obtenidos exitosamente')
    * karate.log('🔧 Helper Personal-Admin-Específico - DNI consultado:', DNI_Admin)
