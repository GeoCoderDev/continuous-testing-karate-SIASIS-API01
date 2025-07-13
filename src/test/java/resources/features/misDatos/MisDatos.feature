@MisDatos
Feature: Prueba mis Datos
Background:
    * url baseUrl
@SIASIS-TC-24 @API01 @Obtener-Mis-Datos-Profesor-Primaria
Scenario: Obtener mis datos como Profesor Primaria
    * def loginResult = call read('../login/ProfesorPrimaria.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

@SIASIS-TC-25 @API01 @Obtener-Mis-Datos-Personal-Admin
Scenario: Obtener mis datos como Personal Admin
    * def loginResult = call read('../login/PersonalAdmin.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

@SIASIS-TC-26 @API01 @Obtener-Mis-Datos-Auxiliar
Scenario: Obtener mis datos como Auxiliar
    * def loginResult = call read('../login/Auxiliar.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

@SIASIS-TC-27 @API01 @Obtener-Mis-Datos-Directivo
Scenario: Obtener mis datos como Directivo
    * def loginResult = call read('../login/Directivo.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

@SIASIS-TC-28 @API01 @Obtener-Mis-Datos-Tutor-Secundaria
Scenario: Obtener mis datos como Tutor Secundaria
    * def loginResult = call read('../login/CasoTutorSecundaria.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200

@SIASIS-TC-29 @API01 @Obtener-Mis-Datos-No-Tutor
Scenario: Obtener mis datos como No Tutor
    * def loginResult = call read('../login/CasoNoTutor.feature')
    * def token = loginResult.token
    Given path '/api/mis-datos'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
