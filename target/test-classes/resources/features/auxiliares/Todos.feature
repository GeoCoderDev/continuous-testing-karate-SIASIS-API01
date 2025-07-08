Feature: Prueba Todos Datos Auxiliares

    Background:
        * url baseUrl

    @TodosAuxiliares
    Scenario: Ver todos los auxiliares con Directivo
        * def loginResult = call read('classpath:resources/features/login/Directivo.feature')
        * def token = loginResult.token
        Given path '/api/auxiliares'
        And header Authorization = 'Bearer ' + token
        When method get
        Then status 200
        * def DNI = response.data[0].DNI_Auxiliar
        And print DNI