@ObtenerTodosAuxiliares
Feature: Prueba Todos Datos Auxiliares

    Background:
        * url baseUrl

    @SIASIS-TC-32 @API01 @Ver-Todos-Auxiliares-Directivo
    Scenario: Obtener todos los datos de los auxiliares
        * def loginResult = call read('classpath:resources/features/login/Directivo.feature')
        * def token = loginResult.token
        Given path '/api/auxiliares'
        And header Authorization = 'Bearer ' + token
        When method get
        Then status 200
        * def DNI = response.data[0].DNI_Auxiliar
        And print DNI