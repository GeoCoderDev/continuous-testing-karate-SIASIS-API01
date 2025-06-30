@misDatos
Feature: Prueba mis Datos
Background:
    * url baseUrl

Scenario: Token de profesor primaria
    * def loginResult = call read('../login/ProfesorPrimaria.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

Scenario: Token de personal admin
    * def loginResult = call read('../login/PersonalAdmin.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

Scenario: Token de auxiliar
    * def loginResult = call read('../login/Auxiliar.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

Scenario: Token de directivo
    * def loginResult = call read('../login/Directivo.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

Scenario: Token de tutor secundaria
    * def loginResult = call read('../login/CasoTutorSecundaria.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

Scenario: Token de no tutor
    * def loginResult = call read('../login/CasoNoTutor.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
