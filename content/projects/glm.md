+++
# Date this page was created.
date = "2017-06-01"

# Project title.
title = "Modelos Lineares Generalizados"

# Project summary to display on homepage.
summary = "Monitoria da disciplina de Modelos Lineares Generalizados (CE225)"

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "gama.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["GLM", "Ensino", "Monitoria"]

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
<img src="/img/gama.png/"/>
</center>

---

No segundo semestre de 2017 assumi a monitoria da disciplina de Modelos Lineares Generalizados ([CE225][glm]) sob a orientação do professor [Cesar Augusto Taconeli][cesar], que também foi meu orientador no projeto intitulado [Análise Comportamental de Ovelhas Submetidas a Intervenção Humana Usando GAMLSS](/projects/gamlss). 

---

Os Modelos Lineares Generalizados, propostos por [Nelder e Wedderburn em 1972][artigo], são aplicáveis em casos nos quais a variável resposta pode ser representada por alguma distribuição pertencente à família exponencial. Exemplos de distribuições pertencentes a esta família são:

 - Bernoulli; 
 - Binomial; 
 - Poisson; 
 - Binomial Negativa; 
 - Normal; 
 - Gama;
 - Normal inversa.
 
Sendo assim, trata-se de uma classe de modelos de regressão para dados contínuos simétricos e assimétricos, contagens e ainda casos em que a variável resposta tenha apenas dois desfechos possíveis. Constitui portanto um framework para modelagem bem mais flexível do que o clássico modelo linear com erros normais.

---

Como aluno, esta disciplina foi, sem dúvidas, a que mais gostei do curso, e a monitoria foi uma das atividades mais interessantes e enriquecedoras que tive a oportunidade de participar. Na época eu ficava disponível dois dias da semana para atendimento aos alunos da disciplina e além disso, produzi uma série de materiais de apoio juntamente com o professor Cesar. 

A ideia destes materiais era auxiliar os alunos em como proceder a análise em R de um conjunto de dados utilizando o framework dos Modelos Lineares Generalizados. Ao todo, foram geradas 3 páginas no formato html cada um com uma análise de um dataset. São elas:

 - Vinheta 1: [Regressão Linear com Erros Normais](/img/proj_glm/v1.html)
 
 - Vinheta 2: [Regressão para Dados Binários](/img/proj_glm/v2.html)
 
 - Vinheta 3: [Regressão para Dados de Contagem](/img/proj_glm/v3.html)

---

<center>

<div style="float:left; width:33%"><img width="200px" height="200px" 
src="/img/logo-pet.png/"/></div>

<div style="float:left; width:33%"><img width="200px" height="200px" 
src="/img/ufpr.jpg/"/></div>

<div style="float:left; width:33%"><img width="150px" height="150px" 
src="/img/leg.png/"/></div>

</center>

<Table>
 
</Table> 

---

[glm]: https://docs.ufpr.br/~taconeli/CE22517/CE22517.html
[cesar]: https://docs.ufpr.br/~taconeli/
[artigo]: https://docs.ufpr.br/~taconeli/CE22517/artigo.pdf