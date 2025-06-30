Feature: Obtener datos de un auxiliar específico DNI

    Background:
        * url baseUrl

    @AdminEspecificoDNI
    Scenario: Ver datos de auxiliar específico por DNI
        * def adminResult = call read('classpath:resources/features/personalesAdmin/Todos.feature')
        * def DNI_Admin = adminResult.DNI
        Given path '/api/personal-administrativo/' + DNI_Admin
        And header Authorization = 'Bearer ' + adminResult.token
        When method get
        Then status 200