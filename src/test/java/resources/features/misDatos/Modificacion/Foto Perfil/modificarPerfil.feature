@ModificarPerfil
Feature: Modificar foto de perfil

    Background:
        * url baseUrl
    @SIASIS-TC-18 @API01 @Modificar-Foto-Perfil-Profesor-Primaria
    Scenario: Modificar foto de perfil Profesor Primaria
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/ProfesorPrimaria.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200

    @SIASIS-TC-19 @API01 @Modificar-Foto-Perfil-Auxiliar
        Scenario: Modificar foto de perfil Auxiliar
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/Auxiliar.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200

    @SIASIS-TC-20 @API01 @Modificar-Foto-Perfil-No-Tutor
        Scenario: Modificar foto de perfil No Tutor
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/CasoNoTutor.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200

    @SIASIS-TC-21 @API01 @Modificar-Foto-Perfil-Tutor-Secundaria
        Scenario: Modificar foto de perfil Tutor Secundaria
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/CasoTutorSecundaria.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200

    @SIASIS-TC-22 @API01 @Modificar-Foto-Perfil-Directivo
        Scenario: Modificar foto de perfil Directivo
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/Directivo.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200

    @SIASIS-TC-23 @API01 @Modificar-Foto-Perfil-Personal-Admin
        Scenario: Modificar foto de perfil Personal Admin
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/PersonalAdmin.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200
