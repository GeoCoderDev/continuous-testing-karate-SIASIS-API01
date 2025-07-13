@PruebaCasoTutor
Feature: Prueba Directivo

    Background:
        * url baseUrl

    @SIASIS-TC-14 @API01 @Iniciar-Sesion-Caso-Tutor
    Scenario: Inicio de sesión caso tutor secundaria
        Given path '/api/login/profesor-tutor-secundaria'
        And request { "Nombre_Usuario": "daniel_sanchez_1542", "Contraseña": "15420745" }
        When method post
        Then status 200
        * def token = response.data.token
        * def rol = response.data.Rol
        And print token
        And print rol

        