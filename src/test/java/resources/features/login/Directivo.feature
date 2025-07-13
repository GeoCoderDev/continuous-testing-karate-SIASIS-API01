@PruebaDirectivo
Feature: Prueba Directivo

    Background:
        * url baseUrl

    @SIASIS-TC-15 @API01 @Iniciar-Sesion-Directivo
    Scenario: Inicio de sesión directivo
        Given path '/api/login/directivo'
        And request { "Nombre_Usuario": "director.asuncion8", "Contraseña": "15430124" }
        When method post
        Then status 200
        * def token = response.data.token
        * def rol = response.data.Rol
        And print token
        And print rol