Feature: Metodo GET para listar usuarios cadastrados

  Background:
    * url baseUrlDev

  @deletar
  Scenario: Deletar usuarios com sucesso
    Given path '/usuarios/'+id.usuarioId
    When method Delete
    Then status 200
    And match response.message == "Registro excluído com sucesso | Nenhum registro excluído"
