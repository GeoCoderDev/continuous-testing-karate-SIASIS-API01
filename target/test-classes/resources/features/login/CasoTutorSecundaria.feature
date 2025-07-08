@casoTutor
Feature: Prueba Directivo

    Background:
        * url baseUrl

    Scenario: Token de directivo
        Given path '/api/login/profesor-tutor-secundaria'
        And request { "Nombre_Usuario": "daniel_sanchez_1542", "Contraseña": "15420745" }
        When method post
        Then status 200
        * def token = response.data.token
        * def rol = response.data.Rol
        And print token
        And print rol

        