Feature: Cambiar estado de un auxiliar específico por DNI

    Background:
        * url baseUrl

    @CambiarEstadoPersonalAdmin
    Scenario: Cambiar estado de un auxiliar específico por DNI
        * def adminResult = call read('classpath:resources/features/personalesAdmin/Todos.feature')
        * def DNI_Admin = adminResult.DNI
        Given path '/api/personal-administrativo/' + DNI_Admin + '/estado'
        And header Authorization = 'Bearer ' + adminResult.token
        When method patch
        Then status 200
        * def estado = response.data.Estado
        And print estado
        * match estado == '#boolean'