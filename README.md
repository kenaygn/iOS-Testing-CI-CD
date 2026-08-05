# iOS-Testing-CI-CD — Estudos de Testes Automatizados e CI/CD

![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![XCTest](https://img.shields.io/badge/XCTest-4BC51D?style=for-the-badge)
![XCUITest](https://img.shields.io/badge/XCUITest-007ACC?style=for-the-badge)
![Xcode Cloud](https://img.shields.io/badge/Xcode_Cloud-0A84FF?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Estudo%20%2F%20Demonstra%C3%A7%C3%A3o-success?style=for-the-badge)

Repositório criado para estudos práticos de testes automatizados em iOS (XCTest, XCUITest, Swift Testing) e integração com CI/CD via Xcode Cloud. Contém exemplos, boas práticas e configurações para validar fluxos de teste locais e em pipeline.

---

## Visão geral
Objetivos principais:
- Demonstrar estratégias de testes unitários e de UI no ecossistema Apple.
- Mostrar integração de testes em pipelines com Xcode Cloud (exemplos e notas).
- Reunir padrões úteis para escrever testes confiáveis e reproduzíveis.

---

## O que tem neste repositório
- /App: exemplo simples de aplicação para testes.
- /Tests: exemplos de Unit Tests (XCTest).
- /UITests: exemplos de UI Tests (XCUITest).
- /Fixtures e /Mocks: utilitários para isolamento e injeção de dependências nos testes.
- /CI: exemplos e documentação de workflows para Xcode Cloud (onde aplicável).
- README com instruções rápidas para rodar os exemplos.

---

## Abordagens e boas práticas mostradas
- Testes unitários com XCTest e organização de suites.
- UI tests com XCUITest: configuração de targets, identificação de elementos e estabilidade.
- Estratégias de mocking e injeção de dependências para isolamento.
- Instrumentação mínima para melhorar observabilidade dos testes.

---

## CI/CD (Xcode Cloud)
- Contém exemplos e anotações sobre workflows de Xcode Cloud para:
  - Build do app
  - Execução de unidade e UI tests
  - Coleta de resultados e envio de relatórios
- Observação: configuração real do Xcode Cloud exige conta Apple Developer ligada ao repositório; os arquivos aqui servem como referência.

---

## Como executar os testes localmente
1. Abra o projeto/workspace no Xcode (recomendado: Xcode 14+ ou conforme notado nos arquivos).
2. Selecione o scheme apropriado (App / Tests / UITests).
3. Execute: Product → Test (Cmd+U) para Unit Tests.
4. Para UI Tests, selecione um simulador e execute o target UITests.
5. Consulte os testes específicos e instruções nas pastas /Tests e /UITests.

Pré-requisitos:
- macOS com versão compatível com a versão do Xcode usada.
- Xcode instalado (versão mínima indicada nos arquivos do projeto).

---

## Contribuições e uso
- Projeto de estudo/portfólio — sinta-se à vontade para abrir issues ou PRs com melhorias.
- Para discutir abordagens ou adicionar exemplos de pipelines, abra uma issue descrevendo o objetivo.

---

Status: Material de estudo / demonstração.  

---
