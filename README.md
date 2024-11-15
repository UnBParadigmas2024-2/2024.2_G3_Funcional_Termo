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
Este projeto implementa o jogo Termo em Haskell, proporcionando uma experiência interativa e textual. O objetivo do jogador é adivinhar uma palavra secreta de cinco letras em até seis tentativas, utilizando feedback fornecido após cada palpite.

### Funcionalidades:

1. Seleção de Palavra Secreta:
    - Uma palavra aleatória de cinco letras é escolhida a partir de uma lista pré-definida de palavras válidas.
2. Interface Textual:
    - O jogador interage com o jogo através do terminal, inserindo palpites e recebendo feedback.
3. Feedback para o Jogador:
    - Letras corretas na posição certa são destacadas com a cor verde.
    - Letras corretas, mas em posições erradas, recebem a cor amarelo.
    - Letras incorretas não são destacadas.
4. Validação de Entradas:
    - Apenas palavras válidas (cinco letras e pertencentes ao dicionário) são aceitas.
    - O jogador é solicitado a tentar novamente em caso de entrada inválida.
5. Condição de Vitória ou Derrota:
    - O jogo termina com vitória se o jogador adivinhar a palavra dentro do limite de tentativas.
    - Caso contrário, a palavra secreta é revelada ao final do jogo.

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

## Vídeo

![Gif](docs/gameplay.gif)

## Uso 

### Utilizando os comandos da sessão anterior, é possível subir e rodar o jogo:

![image](docs/config.png)

### As opções iniciais do jogo aparecerão da seguinte forma, e o jogador poderá interagir através de inputs no terminal:

![image](docs/menu.png)

### Visualizando as regras:

![image](docs/regras.png)

### Jogando:

#### Ganhando 😁

![image](docs/vitoria.png)

#### Perdendo 😞

![image](docs/derrota.png)

### Saindo do jogo:
![image](docs/saindo.png)

### Após ter buildado o jogo pela primeira vez com o `make`, é possível utilizar o comando `make run` para jogar novamente!

![image](docs/make.png)


<!-- ## Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min -->

## Participações

Aqui está a tabela com os nomes em ordem alfabética:

| Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) | Comprobatórios |
| -- | -- | -- | -- |
| Amanda Nobre| Configuração do ambiente de desenvolvimento, contribuição em código | Excelente | [Configuração Inicial](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/12), [Menu do Jogo](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/14), [Padronização de cores](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/29), [Documentação](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/27) |
| Felipe Pereira | Contribuição em código | Boa | [Feedback com cores nas palavras](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/17) |
| Gabriel Sabanai| Contribuição em código | Boa | [Estado do Jogo](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/18) |
| Guilherme Barbosa| Programação da atualização da interface, exibição do jogo e revisões de código | Boa | [Atualização da Interface e Exibição de Jogo](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/26) |
| Ingrid Carvalho | Contribuição em código | Boa | [Configuração da mensagem de feedback da tentativa](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/19) |
| Lais Portela | Contribuição em código | Boa | [Configuração das cores e tentativas de acerto](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/16) |
| Luciano Ricardo| Coordenação do grupo, divisão das tasks e contribuição em código | Excelente | [Função runGame Inicial](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/13) |
| Luiz Henrique | Contribuição em código e documentação | Boa | [Gerenciamento da escolha aleatória de palavras](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/23), [Documentação](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/27),  [Filtro Base](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/issues/31) |
| Natan Tavares | Contribuição em código | Boa | [Processamento do input](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/15), [Documentação](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/27) |
| Pablo Christianno | Contribuição em código | Boa | [Leitura e validação da palavra de entrada (input)](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/24) |


## Informações 

### Lições Aprendidas

Durante a execução do projeto, a equipe aprendeu:
- A importância de estruturar o código funcional para garantir clareza e manutenibilidade.
- A aplicabilidade do paradigma funcional, suas vantagens e desvatagens.
- Como enfrentar desafios de colaboração em equipe, especialmente ao trabalhar em um novo paradigma.

### Percepções

Observamos que implementar algoritmos em um ambiente funcional exige uma abordagem distinta dos paradigmas imperativos, tornando o desenvolvimento um desafio estimulante. Haskell, apesar de ser uma linguagem com uma sintaxe complexa e desafiadora para compreensão e leitura, oferece um grande benefício: seu paradigma funcional altamente modularizado facilita a organização e o desenvolvimento do código. Embora a compilação de arquivos em Haskell seja trabalhosa, a linguagem nos incentiva a adotar uma nova perspectiva, priorizando soluções elegantes e expressivas, o que é uma vantagem valiosa para escrever código conciso e otimizado.

#### Contribuições

Cada membro da equipe contribuiu com incrementos específicos nos módulos e na implementação de novas funcionalidades. Essas atividades foram organizadas por meio de issues, que foram priorizadas levando em consideração as dependências necessárias para sua realização.

#### Fragilidades

Alguns pontos a melhorar incluem o fato jogo não reiniciar automaticamente após o término de uma partida e pequenas despadronizações no uso das cores.

### Trabalhos Futuros

- Garantir uma padronização de cores e elementos visuais para melhorar a identidade visual e a consistência do projeto.
- Explorar novas funcionalidades e integrações que possam expandir o escopo do projeto, oferecendo mais opções aos usuários.
- Realizar otimizações técnicas para melhorar a performance e garantir uma execução mais suave e eficiente.
- Selecionar melhor as palavras pois há algumas que são difíceis de acertar (Ex: verbos conjugados, nomes próprios, regionalismos, gírias, etc)

## Fontes
- [Jogo Termo](https://term.ooo)
- [Cabal User Guide](https://cabal.readthedocs.io/en/stable/)
- [Docker](https://www.docker.com)
- [ANSI Terminal](https://hackage.haskell.org/package/ansi-terminal-0.5.0/docs/System-Console-ANSI.html)
