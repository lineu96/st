+++
# Date this page was created.
date = "2017-06-02"

# Project title.
title = "Análise comportamental de ovelhas submetidas à intervenção humana usando GAMLSS"

# Project summary to display on homepage.
summary = "Projeto de Pesquisa Individual PET"

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "pesq.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["GAMLSS", "Comportamento animal", "Efeitos aleatórios"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
[header]
image = ""
caption = ""

+++

---

<center>
{{< figure library="1" src="/img/gamlss.jpg" width="400px" height="400px" >}}
</center>

---

Este projeto refere-se ao meu trabalho de pesquisa individual conduzido no [Programa de Educação Tutorial do Curso de Estatística][pet] da [Universidade Federal do Paraná][ufpr], sob a orientação dos professores [Cesar Augusto Taconeli][cesar] e [José Luiz Padilha da Silva][padilha].

---


Trata-se de um experimento sobre comportamento de ovelhas descrito em
ARTIGO PRISCILA. O experimento foi conduzido na fazenda experimental INRA La Fage, Roqueford, França, em setembro de 2015 com o objetivo de verificar o efeito de linhagem genética, escovação e isolamento nas respostas comportamentais dos animais. Na ocasião, vinte ovelhas classificadas como reativas ou não reativas ao isolamento social temporário foram submetidas à escovação por um humano familiar. As ovelhas tinham 15 meses de idade, eram não gestantes e não amamentavam
quando foram observadas. 

O experimento foi conduzido em três sessões experimentais: na primeira tinha-se uma grade de metal separando o animal testado dos demais animais, sem distância entre eles; na segunda havia duas grades de metal separando os animais a uma distância de 1,7 metros, ou seja, nesta sessão foi imposta a condição de isolamento social; e na terceira sessão, os animais voltaram a ser separados por apenas uma grade. 

As sessões de testes ocorreram dois dias após a fase de adaptação dos
animais ao equipamento e aos humanos e, em cada sessão, as ovelhas foram
observadas em 3 momentos distintos, fase de pré escovação, com duração
de 2 minutos e 30 segundos; fase de escovação, com duração de 3 minutos;
e pós escovação, com duração de 2 minutos e 30 segundos.

Os dados coletados dizem respeito ao número de mudanças de postura dos
animais e à proporção do tempo em que os animais permaneceram em determinadas posturas, tratando-se, portanto, de um conjunto de respostas de natureza discreta, que configuram contagens, e um segundo conjunto de respostas que configuram proporções.

Sendo assim, foram avaliados os efeitos de:

  - sessão: um fator de três níveis em que foi imposta a condição de isolamento social, 
  
  - momento: um fator de três níveis em que foi imposta a intervenção humana (escovação),
  
  - linhagem: um fator de dois níveis que classifica os animais como reativos ou não reativos ao isolamento social temporário nas respostas.

Trata-se de um conjunto de dados em que não há observações independentes, já que cada animal contribui com nove medidas ao conjunto de dados. Há portanto, a necessidade de incorporar as correlações entre as medidas num mesmo animal e do animal dentro de cada sessão experimental. 

No presente estudo considerou-se a modelagem usando GAMLSS. Esta metodologia permite não só a modelagem da média como há a possibilidade de incluir efeitos aleatórios e de modelar os demais parâmetros da distribuição em função de covariáveis. 

Duas respostas foram analisadas: o número de mudanças de postura de orelha e a proporção do tempo em que o animal permaneceu com as orelhas em posição neutra.

---

<center>
{{< figure library="1" src="/img/animais.png" width="700px" height="700px" >}}
</center>

---

O trabalho foi dividido em três etapas:

 - A primeira delas referente à resposta de contagem, apresentada na sessão pôster da 63ª Reunião Anual da Região Brasileira da Sociedade Internacional de Biometria (**RBras**).

 - A segunda, referente à resposta de proporção, apresentada na sessão pôster do 23º Simpósio Nacional de Probabilidade e Estatística (**SINAPE**).

 - O trabalho completo foi apresentado no 17º Encontro das Atividades Formativas (**ENAF**), evento componente da 10ª Semana Integrada de Ensino, Pesquisa e Extensão (**SIEPE**), como comunicação oral.

---

<center>
{{< figure library="1" src="/img/sinape.jpg" width="300px" height="200px" >}}
</center>


---

### Confira alguns dos materiais produzidos:

 - [Abstract Rbras](/img/proj_gamlss/abstract_LINEU.pdf)
 
 - [Resumo Rbras](/img/proj_gamlss/resumo_simples_LINEU.pdf)
 
 - [Pôster Rbras](/img/proj_gamlss/posterRBras.pdf)
 
 - [Resumo Simples SINAPE](/img/proj_gamlss/resumo_simples.pdf)
 
 - [Resumo Expandido SINAPE](/img/proj_gamlss/resumo_expandido_lineu3.pdf)
 
 - [Pôster SINAPE](/img/proj_gamlss/posterSINAPE.pdf)
 
 - [Análise Completa](/img/proj_gamlss/siepe.html)
 
 - [Slides](/img/proj_gamlss/pi_pres.pdf)

---

<table><tr>
<td> <img src="/img/logo-pet.png" alt="Drawing" style="width: 200px;"/> </td>
<td> <img src="/img/leg.png" alt="Drawing" style="width: 150px;"/> </td>
<td> <img src="/img/ufpr.jpg" alt="Drawing" style="width: 200px;"/> </td>
</tr></table>


[cesar]: https://docs.ufpr.br/~taconeli/
[lea]: http://www.lea.ufpr.br/
[padilha]: https://docs.ufpr.br/~jlpadilha/
[pet]: https://pet-estatistica.github.io/site/
[ufpr]: http://www.ufpr.br/portalufpr/