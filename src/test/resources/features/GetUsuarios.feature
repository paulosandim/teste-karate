Feature: Metodo GET para listar usuarios cadastrados

  Background:
    * url 'https://serverest.dev'

  Scenario: Listar todos os usuarios cadastrados
    Given path '/usuarios'
    When method Get
    Then status 200

  Scenario: Listar usuarios por nome
    Given path '/usuarios'
    And param nome = 'narceja da silva'
    When method Get
    Then status 200

  Scenario: Listar usuarios por nome e email
    Given path '/usuarios'
    And params {nome: 'narceja da silva', email: 'narceja@qa.com.br'}
    When method Get
    Then status 200

  Scenario: Listar usuarios por nome, email e nome de usuario
    Given path '/usuarios'
    And params {nome: 'narceja da silva', email: 'narceja@qa.com.br'}
    When method Get
    Then status 200
    And match response.usuarios[*].nome contains "narceja da silva"