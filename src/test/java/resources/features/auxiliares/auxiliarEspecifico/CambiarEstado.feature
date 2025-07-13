@CambiarEstadoAuxiliarEspecifico
Feature: Cambiar estado de un auxiliar específico por DNI

    Background:
        * url baseUrl

    @SIASIS-TC-30 @API01 @Cambiar-Estado-Auxiliar-Especifico
    Scenario: Cambiar estado de un auxiliar específico por DNI
        * def auxiResult = call read('classpath:resources/features/auxiliares/Todos.feature')
        * def DNI_Auxiliar = auxiResult.DNI
        Given path '/api/auxiliares/' + DNI_Auxiliar + '/estado'
        And header Authorization = 'Bearer ' + auxiResult.token
        When method patch
        Then status 200
        * def estado = response.data.Estado
        And print estado
        * match estado == '#boolean'