@ObtenerTodosPersonalAdmin
Feature: Prueba Todos Datos Auxiliares

    Background:
        * url baseUrl

    @SIASIS-TC-35 @API01 @Ver-Todos-Personal-Admin-Directivo
    Scenario: Obtener todos los datos de los personales Administrativos
        * def loginResult = call read('classpath:resources/features/login/Directivo.feature')
        * def token = loginResult.token
        Given path '/api/personal-administrativo'
        And header Authorization = 'Bearer ' + token
        When method get
        Then status 200
        * def DNI = response.data[0].DNI_Personal_Administrativo
        And print DNI