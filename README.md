# Projeto de Automação de APIs com Karate

## Sobre o Projeto

Este projeto foi desenvolvido para automatizar testes de APIs REST utilizando o framework Karate, integrado com Maven e JUnit 5.

O objetivo é validar endpoints, status HTTP, estrutura de resposta, regras de negócio e fluxos completos de API de forma simples e legível.

---

## Tecnologias Utilizadas

* Java 17
* Maven 3.9.x
* Karate 1.4.1
* JUnit 5
* IntelliJ IDEA

---

## Estrutura do Projeto

```text
src
└── test
    ├── java
    │   ├── runners
    │   │   └── TestRunner.java
    │   ├── karate-config.js
    │   └── logback-test.xml
    └── resources
        └── features
            └── GetUsuarios.feature
            └── PostUsuario.feature
```

---

## Pré-requisitos

Antes de executar os testes, certifique-se de possuir:

* Java 17 instalado
* Maven instalado e configurado
* Variável JAVA_HOME configurada
* Variável MAVEN_HOME configurada

Verifique as instalações:

```bash
java -version
mvn -version
```

---

## Executando os Testes

Executar todos os testes:

```bash
mvn test
```

Limpar e executar novamente:

```bash
mvn clean test
```

---

## Execução por Tags

O Karate permite executar apenas cenários específicos utilizando tags.

### Exemplo de Tag

```gherkin
@smoke
Scenario: Consultar usuários
    Given url 'https://serverest.dev/usuarios'
    When method GET
    Then status 200
```

### Executar uma Tag Específica

```bash
mvn test -Dkarate.options="--tags @smoke"
```

### Executar Outra Tag

```bash
mvn test -Dkarate.options="--tags @regression"
```

### Ignorar uma Tag

```bash
mvn test -Dkarate.options="--tags ~@ignore"
```

### Boas Práticas de Tags

| Tag          | Objetivo                               |
| ------------ | -------------------------------------- |
| @smoke       | Validações críticas da aplicação       |
| @regression  | Testes completos de regressão          |
| @integration | Testes de integração                   |
| @ignore      | Cenários temporariamente desabilitados |

O uso de tags facilita a execução seletiva dos testes durante o desenvolvimento e em pipelines CI/CD.

---

## Runner

O projeto utiliza JUnit 5 para execução dos testes Karate.

Exemplo:

```java
package runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features/GetUsuarios.feature");
    }
}
```

---

## Exemplo de Cenário

```gherkin
Feature: Método GET para listar usuários cadastrados

Scenario: Consultar usuários
    Given url 'https://serverest.dev/usuarios'
    When method GET
    Then status 200
```

---

## Relatórios

Após a execução dos testes, os relatórios serão gerados automaticamente em:

```text
target/karate-reports
```

Abra o arquivo HTML gerado para visualizar os resultados detalhados da execução.

---

## Boas Práticas

* Organizar os arquivos `.feature` por domínio de negócio.
* Centralizar URLs e configurações no `karate-config.js`.
* Utilizar validações com `match`.
* Reutilizar cenários com `call`.
* Executar os testes via pipeline CI/CD.

---

## Autor

Projeto criado para estudos e prática de automação de testes de API utilizando Karate Framework.
