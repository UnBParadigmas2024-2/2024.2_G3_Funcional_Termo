# Termo

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 03<br>
**Paradigma**: Funcional<br>

## Alunos
| Matrícula | Aluno                             |
| --------- | --------------------------------- |
| 190124997 | Amanda Nobre                      |
| 200017772 | Fellipe Pereira da Costa Silva    |
| 190028122 | Gabriel Sabanai Trindade          |
| 200037994 | Guilherme Barbosa Ferreira        |
| 190029731 | Ingrid da Silva Carvalho          |
| 190046848 | Laís Portela de Aguiar            |
| 221007653 | Luciano Ricardo da Silva Junior   |
| 190033681 | Luiz Henrique Fernandes Zamprogno |
| 200025449 | Natan Tavares Santana             |
| 200042416 | Pablo Christianno Silva Guedes    |

## Sobre 
Descreva o seu projeto em linhas gerais. 
Use referências, links, que permitam conhecer um pouco mais sobre o projeto.
Capriche nessa seção, pois ela é a primeira a ser lida pelos interessados no projeto.

## Screenshots
Adicione 2 ou mais screenshots do projeto em termos de interface e/ou funcionamento.

## Instalação 
**Linguagens**: Haskell<br>
**Tecnologias**: Cabal<br>

Para jogar é necessário entrar no diretório `termo`:

```bash
cd termo
```

E subir a aplicação:

```bash
make
```

Ao rodar esse comando, é iniciado o processo de criação e execução da imagem docker, permitindo que o usuário interaja com o jogo pelo terminal.


O comando `make` só precisa ser executado uma única vez para incializar o container, caso o projeto não tenha sido modificado, nas próximas execuções basta rodar:

```bash
make run
```

Este comando apenas executará a imagem já criada.

Ao final, caso não queira mais jogar, basta rodar o seguinte comando para limpar a imagem Docker:

```bash
make clean
```

---

Também é possível usar o Cabal para executar o projeto:

```bash
cabal build

cabal run
```

### **TO-DO**: Prints do menu do jogo e dos comandos.

## Uso 
Explique como usar seu projeto.
Procure ilustrar em passos, com apoio de telas do software, seja com base na interface gráfica, seja com base no terminal.
Nessa seção, deve-se revelar de forma clara sobre o funcionamento do software.

## Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min

## Participações
Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) | Comprobatórios (ex. links para commits)
| -- | -- | -- | -- |
| Luciano  |  Coordenação do grupo, divisão das tasks e contribuição em código | Excelente | [Função runGame Inicial] (https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/13)
| Amanda  |  Configuração do ambiente de desenvolvimento, contribuição em código | Excelente | [Configuração Inicial] (https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/12), [Menu do Jogo](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/14)
| Natan  | Contribuição em código | Boa | [Processamento do input] (https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/15)
| Felipe  | Contribuição em código | Boa | [Feedback com cores nas palavras] (https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/17)
| Lais  | Contribuição em código | Boa | [Configuração das cores e tentativas de acerto] (https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/16)
| Luiz Henrique  | Contribuição em código | Boa | [Gerencimento da escolha aleatória de palavras] (https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/23)


## Outros 
Quaisquer outras informações sobre o projeto podem ser descritas aqui. Não esqueça, entretanto, de informar sobre:
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros.

## Fontes
- [Jogo Termo](https://term.ooo)
- [Cabal User Guide](https://cabal.readthedocs.io/en/stable/)
- [Docker](https://www.docker.com)
- [ANSI Terminal](https://hackage.haskell.org/package/ansi-terminal-0.5.0/docs/System-Console-ANSI.html)
