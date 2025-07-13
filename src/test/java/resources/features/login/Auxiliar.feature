@PruebaAuxiliar
Feature: Prueba Directivo

    Background:
        * url baseUrl
    @SIASIS-TC-12 @API01 @Iniciar-Sesion-Auxiliar
    Scenario: Inicio de sesión auxiliar
        Given path '/api/login/auxiliar'
        And request { "Nombre_Usuario": "brigida_gonzales_1535", "Contraseña": "15357278" }
        When method post
        Then status 200
        * def token = response.data.token
        * def rol = response.data.Rol
        And print token
        And print rol

        