Feature: Metodo GET para listar usuarios cadastrados

  Background:
    * url 'https://serverest.dev'

  Scenario: Listar todos os usuarios cadastrados
    Given path '/usuarios'
    When method Get
    Then status 200