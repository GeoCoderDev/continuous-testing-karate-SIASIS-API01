@profesorPrimariaPrueba
Feature: Prueba Directivo

    Background:
        * url baseUrl

    Scenario: Token de directivo
        Given path '/api/login/profesor-primaria'
        And request { "Nombre_Usuario": "marisol_godoy_1537", "Contraseña": "15378317" }
        When method post
        Then status 200
        * def token = response.data.token
        * def rol = response.data.Rol
        And print token
        And print rol

        