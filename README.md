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

## Uso 

### Utilizando os comandos da sessão anterior, é possível subir e rodar o jogo:

![image](https://github.com/user-attachments/assets/62f3392e-4da1-4224-af34-11d35c90341e)

### As opções iniciais do jogo aparecerão da seguinte forma, e o jogador poderá interagir através de inputs no terminal:

![image](https://github.com/user-attachments/assets/2ae6b80f-75f1-484a-9fe0-fe2990978d73)

### Visualizando as regras:

![image](https://github.com/user-attachments/assets/3e284aa7-0fd0-48c1-9d9c-8326e4794380)

### Jogando:

#### Ganhando 😁

![image](https://github.com/user-attachments/assets/9c775d66-c8a9-44c8-84a5-b1355600b8bd)

#### Perdendo 😞

![image](https://github.com/user-attachments/assets/b7f1f25e-e73e-4a11-b059-b0fa31f0afae)

### Saindo do jogo:
![image](https://github.com/user-attachments/assets/acf34010-2f38-45e8-bc52-fd6d602daf9a)

### Após ter buildado o jogo pela primeira vez com o `make`, é possível utilizar o comando `make run` para jogar novamente!

![image](https://github.com/user-attachments/assets/ab1f62e3-6e2d-47f5-bd8a-7eb37e5a171c)

![image](https://github.com/user-attachments/assets/e0aef641-a927-4733-a7f7-fb6e666949ca)

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

Aqui está a tabela com os nomes em ordem alfabética:

| Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) | Comprobatórios (ex. links para commits) |
| -- | -- | -- | -- |
| Amanda | Configuração do ambiente de desenvolvimento, contribuição em código | Excelente | [Configuração Inicial](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/12), [Menu do Jogo](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/14), [Padronização de cores](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/29), [Documentação](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/27) |
| Felipe | Contribuição em código | Boa | [Feedback com cores nas palavras](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/17) |
| Guilherme | Programação da atualização da interface, exibição do jogo e revisões de código | Boa | [Atualização da Interface e Exibição de Jogo](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/26) |
| Ingrid Carvalho | Contribuição em código | Boa | [Configuração da mensagem de feedback da tentativa](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/19) |
| Lais | Contribuição em código | Boa | [Configuração das cores e tentativas de acerto](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/16) |
| Luciano | Coordenação do grupo, divisão das tasks e contribuição em código | Excelente | [Função runGame Inicial](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/13) |
| Luiz Henrique | Contribuição em código e documentação | Boa | [Gerenciamento da escolha aleatória de palavras](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/23), [Documentação](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/27) |
| Natan | Contribuição em código | Boa | [Processamento do input](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/15), [Documentação](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/27) |
| Pablo Christianno | Contribuição em código | Boa | [Leitura e validação da palavra de entrada (input)](https://github.com/UnBParadigmas2024-2/2024.2_G3_Funcional_Termo/pull/24) |


## Informações 
<!-- Quaisquer outras informações sobre o projeto podem ser descritas aqui. Não esqueça, entretanto, de informar sobre:
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros. -->

### Lições Aprendidas

Durante a execução do projeto, a equipe aprendeu:
- A importância de estruturar o código funcional para garantir clareza e manutenibilidade.
- A aplicabilidade do paradigma funcional, suas vantagens e desvatagens.
- Como enfrentar desafios de colaboração em equipe, especialmente ao trabalhar em um novo paradigma.

### Percepções

#### **TO-DO**

### Contribuições e Fragilidades

#### Contribuições

Cada membro da equipe contribuiu com incrementos específicos nos módulos e na implementação de novas funcionalidades. Essas atividades foram organizadas por meio de issues, que foram priorizadas levando em consideração as dependências necessárias para sua realização.

#### Fragilidades

Alguns pontos a melhorar incluem o fato jogo não reiniciar automaticamente após o término de uma partida e pequenas despadronizações no uso das cores.

### Trabalhos Futuros

- Melhorar a mecânica do jogo para que ele reinicie automaticamente após uma partida, oferecendo uma experiência contínua para os usuários.
- Garantir uma padronização de cores e elementos visuais para melhorar a identidade visual e a consistência do projeto.
- Explorar novas funcionalidades e integrações que possam expandir o escopo do projeto, oferecendo mais opções aos usuários.
- Realizar otimizações técnicas para melhorar a performance e garantir uma execução mais suave e eficiente.

## Fontes
- [Jogo Termo](https://term.ooo)
- [Cabal User Guide](https://cabal.readthedocs.io/en/stable/)
- [Docker](https://www.docker.com)
- [ANSI Terminal](https://hackage.haskell.org/package/ansi-terminal-0.5.0/docs/System-Console-ANSI.html)
