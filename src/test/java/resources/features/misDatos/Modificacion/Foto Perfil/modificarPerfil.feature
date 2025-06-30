@modificarPerfil
Feature: Modificar foto de perfil

    Background:
        * url baseUrl

    Scenario: Modificar foto de perfil
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/ProfesorPrimaria.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200

        Scenario: Modificar foto de perfil
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/Auxiliar.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200

        Scenario: Modificar foto de perfil
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/CasoNoTutor.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200

        Scenario: Modificar foto de perfil
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/CasoTutorSecundaria.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200
        
        Scenario: Modificar foto de perfil
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/Directivo.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200
        
        Scenario: Modificar foto de perfil
        Given path '/api/mis-datos/mi-foto-perfil'
        * def loginResult = call read('classpath:resources/features/login/PersonalAdmin.feature')        
        * def token = loginResult.token
        And header Authorization = 'Bearer ' + token
        And multipart file foto = { read: 'classpath:resources/features/misDatos/Modificacion/Foto Perfil/prueba.jpeg', filename: 'prueba.jpeg' }
        When method put
        Then status 200
