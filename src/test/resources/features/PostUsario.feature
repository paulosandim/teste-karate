Feature: Metodo post para cadastrar usuarios

  Background:
    * url 'https://serverest.dev'

  @criausuario
  Scenario: Cadastrar usuario com sucesso com body no corpo do teste

    * def body =
    """
    {
      "nome": "preta da silva",
      "email": "preta@qa.com.br",
      "password": "teste123",
      "administrador": "true"
    }
    """

    Given path '/usuarios'
    And request body
    When method Post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'