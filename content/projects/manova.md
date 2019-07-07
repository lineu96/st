+++
# Date this page was created.
date = "2018-07-01"

# Project title.
title = "Análise de Variância Multivariada para Dados Não Gaussianos via Teste Wald"

# Project summary to display on homepage.
summary = "Trabalho de Conclusão de Curso"

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "mcglm.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["MANOVA", "McGLM", "Múltiplas Respostas"]

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
[header]
image = ""
caption = ""

+++

<center>
{{< figure library="1" src="/img/mcglm.png" width="200px" height="200px" >}}
</center>

---

Este projeto foi o tema escolhido por mim e por minha colega de curso [Jhenifer Caetano Veloso][jheni], sob orientação do professor [Wagner Hugo Bonat][bonat], para nosso Trabalho de Conclusão de Curso da graduação de Estatística na Universidade Federal do Paraná.

---

No âmbito da Estatística aplicada, modelos de regressão são uma das principais e mais difundidas ferramentas utilizadas em diversas áreas do conhecimento, sendo que o caso mais conhecido é o modelo linear normal. 

Todavida, há casos em que são coletadas mais de uma resposta por unidade experimental e há o interesse de modelá-las em função de um conjunto de variáveis explicativas, para tal, uma alternativa são os modelos lineares multivariados. Porém, por maior que seja seu potencial de aplicação, essa classe apresenta limitações como a necessidade de normalidade multivariada, homogeneidade das matrizes de variâncias e covariâncias, além de independência entre as observações. Isto posto, uma alternativa para solucionar tais limitações são os Modelos Multivariados de Covariância Linear Generalizada, o qual permite lidar com múltiplas respostas e de diferentes naturezas e, de alguma forma, correlacionadas. 

Para esta classe de modelos, neste trabalho é proposto e implementado o teste de Wald para análise de variância multivariada para dados não gaussianos. Seu comportamento foi discutido através de estudos de simulação, a fim de verificar o poder do teste sob diferentes distribuições da variável resposta, diferentes tamanhos amostrais e diferentes valores para os parâmetros de regressão, apresentando, de forma geral, resultados satisfatórios para tamanhos amostrais maior que 250 em todas as distribuições de variável resposta simuladas. O emprego do teste proposto é ilustrado através de dois conjuntos de dados, um com respostas binárias e outro com respostas de contagem e proporção.

### Materiais produzidos:

- [Texto](/img/proj_manova/tcc.pdf)

- [Apresentação](/img/proj_manova/apresentacao.pdf)

<center>
{{< figure library="1" src="/img/proj_manova/defesa.jpg" width="600px" height="600px" >}}
</center>


---

<table><tr>
<td> <img src="/img/proj_manova/logo-pet.png" alt="Drawing" style="width: 200px;"/> </td>
<td> <img src="/img/proj_manova/leg.png" alt="Drawing" style="width: 150px;"/> </td>
<td> <img src="/img/proj_manova/ufpr.jpg" alt="Drawing" style="width: 200px;"/> </td>
</tr></table>

[bonat]: http://www.leg.ufpr.br/~wagner/
[jheni]: https://www.linkedin.com/in/jhecaetano/
