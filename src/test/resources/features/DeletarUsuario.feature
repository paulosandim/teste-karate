Feature: Metodo GET para listar usuarios cadastrados

  Background:
    * url 'https://serverest.dev'

  @smoke
  Scenario: Deletar usuarios com sucesso
    Given path '/usuarios/id'
    When method Delete
    Then status 200
    And match response.message == "Registro excluído com sucesso | Nenhum registro excluído"
