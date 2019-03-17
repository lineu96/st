+++
# Date this page was created.
date = "2018-01-01"

# Project title.
title = "MANOVA para dados não gaussianos"

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

Este projeto foi o tema escolhido por mim e por minha colega de curso AUTOR2, sob orientação do professor [Wagner Hugo Bonat][bonat], para nosso Trabalho de Conclusão de Curso da graduação de Estatística na Universidade Federal do Paraná.

---

No âmbito da Estatística aplicada, modelos de regressão são uma das principais ferramentas utilizadas e difundidas em diversas áreas do conhecimento. No caso univariado, esta metodologia associa uma variável resposta, também chamada de variável dependente, a uma ou mais variáveis explicativas, conhecidas como variáveis independentes. Os objetivos gerais das técnicas de modelagem são: descrever a relação entre variável resposta e variáveis explicativas, e utilizar o modelo proposto para realizar predições.

De forma geral, um modelo de regressão é uma expressão matemática que relaciona a média da variável resposta Y às variáveis preditoras X. Além disso, considera-se que Y segue uma certa distribuição de probabilidade condicional a X em que a média está associada a um preditor linear.

Dentre as classes de modelos univariados existentes, a mais famosa e difundida nas últimas décadas são os modelos lineares generalizados (GLM) propostos por Nelder e Wedderburn em 1972. Dentre os casos especiais de distribuições possíveis na classe dos modelos lineares generalizados estão a Normal, gamma, Poisson, Binomial, entre outras. Trata-se portanto, de uma forma de modelagem univariada para dados de diferentes naturezas, tais como: dados contínuos simétricos e assimétricos, contagens, proporções discretas, e assim por diante. Tais características tornam esta classe uma flexível ferramenta de modelagem aplicável a diversos tipos de problema.

Todavia, por mais flexível e difundido que sejam os modelos lineares generalizados, estes apresentam duas principais restrições: a incapacidade de lidar com respostas dependentes e/ou múltiplas respostas. Com o objetivo de solucionar este problema, foi proposta uma estrutura geral para análise de dados não normais e com múltiplas respostas chamada modelos lineares multivariados de covariância generalizada McGLM propostos por Bonat. Esta estrutura foi proposta para lidar com respostas multivariadas de diferentes naturezas e, de alguma forma, correlacionadas; em que esta correlação é estruturada em termos de uma função de ligação de covariância com um preditor linear matricial que envolve matrizes conhecidas. Portanto, o McGLM é uma forma geral para modelagem de dados de diferentes naturezas e estruturas de covariância com extensões multivariadas para medidas repetidas, séries temporais, dados longitudinais, espaciais e espaço-temporais

No entanto, considerando um cenário em que se aplica um McGLM, isto é, um problema em que há múltiplas respostas, de diferentes naturezas, associadas a um conjunto de covariáveis e têm-se interesse em realizar uma análise multivariada, não há uma grande discussão na literatura a respeito de testes de hipóteses para modelos lineares multivariados com respostas não Gaussianas, mais especificamente da análise de variância multivariada (MANOVA). 

Quando se trata de modelos multivariados para dados Gaussianos em que se deseja testar a hipótese de nulidade dos parâmetros de regressão, os quatro testes multivariados mais disseminados são: o lambda de Wilk's, traço de Hotelling-Lawley, traço de Pillai e maior raiz de Roy. Para o caso de múltiplas respostas não Gaussianas não existem sequer testes correspondentes a estes 4 testes mais propagados.

Por conseguinte, neste trabalho, nosso objetivo é propor a análise de variância multivariada para dados não Gaussianos com foco em sugerir análogos aos testes já existentes para dados Gaussianos e, além disso, realizar a implementação computacional destes testes e um consistente estudo a respeito das propriedades e comportamento dos testes propostos com base em estudos de simulação e aplicação a conjuntos de dados reais.

---

### Confira alguns dos materiais produzidos:

---

<table><tr>
<td> <img src="/img/logo-pet.png" alt="Drawing" style="width: 200px;"/> </td>
<td> <img src="/img/leg.png" alt="Drawing" style="width: 150px;"/> </td>
<td> <img src="/img/ufpr.jpg" alt="Drawing" style="width: 200px;"/> </td>
</tr></table>

[bonat]:link.com