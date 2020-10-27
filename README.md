# README

* Ruby version
  2.7.0 (RVM é recomendade)

* System dependencies
  Este projeto usa o sqlite3 tanto quanto possível, mesmo tendo um [deploy no heroku](https://desolate-everglades-72918.herokuapp.com/) que usa postgres, para rodar o projeto localmente não é necessário nada além de um sistema operacional unix-like e uma instalação do [rvm](http://rvm.io/), este projeto usa versão 2.7.0 do ruby, para instalar use o comando $`rvm install 2.7.0`, também é necessária a instalação do yarn e do node.js em versões estaveis

* Configuration
  Apenas execute $`bundle install` and $`bin/setup` e você estará pronto

* Development
  Para executar em ambiente de desenvolvimento basta executar $`rails s` e acessar [localhost:3000](http://localhost:3000/)

* How to run the test suite
  Este projeto usa o rspec como ferramenta de testes, após executar a configuração, basta rodar $`rspec` para executar todos os testes, além disso também possui rubocop habilitado como analisador de código, para verificar basta executar $`rubocop`

# Nexoos Challenge
A Nexoos é uma plataforma online sem burocracia e sem taxas abusivas que conecta empresas
que necessitam de empréstimos a investidores pessoa Física tornando este processo mais rápido, eficiente e justo no modelo marketplace lending.
## Desafio
Cenário: Um empréstimo de R$ 100.000,00 pode ser financiado por até 200 pessoas e cada um recebe uma fatia das parcelas pagas.
Simulando uma taxa de 1.5% a.m. em 12x, teríamos 12 parcelas de R$ 9.168,00.
O valor da parcela é calculado usando a fórmula `pmt`:
```
PMT = valor_presente X ((((1 + taxa) ^ numero_de_periodos) X taxa) / (((1 + taxa) ^ numero_de_periodos) - 1))
```
Exemplo:
```
100000 * ((((1.015) ** 12) * 0.015) / (((1.015) ** 12) - 1)) = 9167.999290622945
```
Construa uma aplicação web, utilizando a linguagem e frameworks de sua preferência, que seja capaz de:
- Cadastrar um solicitante(razão social, cnpj, endereço(s) e telefone(s));
- Criar uma solicitação de crédito(valor);
- Calcular prazo e taxa de juros.
- Gerar automaticamente as respectivas parcelas com intervalos regulares de um mês entre os vencimentos. 
## Requisitos:
- O código no repositório público do GitHub;
- Utilizar Postgres, MySQL ou o banco de dados de sua preferência ;
- Testes unitários.
- Inglês técnico(desejável);
Ao finalizar, faça um Pull Request neste repositório e avise-nos por email
