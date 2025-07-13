@AuxiliarEspecificoDni
Feature: Obtener datos de un auxiliar específico DNI

    Background:
        * url baseUrl

    @SIASIS-TC-31 @API01 @Obtener-Datos-Auxiliar-Especifico
    Scenario: Obtener datos de auxiliar específico por DNI
        * def auxiResult = call read('classpath:resources/features/auxiliares/Todos.feature')
        * def DNI_Auxiliar = auxiResult.DNI
        Given path '/api/auxiliares/' + DNI_Auxiliar
        And header Authorization = 'Bearer ' + auxiResult.token
        When method get
        Then status 200