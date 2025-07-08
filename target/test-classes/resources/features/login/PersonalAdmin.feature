@personalAdmin
Feature: Prueba Directivo

    Background:
        * url baseUrl

    Scenario: Token de directivo
        Given path '/api/login/personal-administrativo'
        And request { "Nombre_Usuario": "jose_centeno_4180", "Contraseña": "41809910" }
        When method post
        Then status 200
        * def token = response.data.token
        * def rol = response.data.Rol
        And print token
        And print rol

        