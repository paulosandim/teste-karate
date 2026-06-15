Feature: Metodo post para cadastrar usuarios

  Background:
    * url 'https://serverest.dev'

  @criausuario
  Scenario: Cadastrar usuario com sucesso com body no corpo do teste

    * def body = read('classpath:utils/usuario.json')
    * set body.nome = 'dani da silva'
    * set body.email = 'dani@qa.com.br'
    * set body.password = 'teste123'
    * set body.administrador = 'true'

    Given path '/usuarios'
    And request body
    When method Post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'