################################################################
############# ANALISE DADOS CORONA VIRUS NO PR/BR ##############
################################################################

# Dados de todo o Brasil a nível de município
# 'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-cities-time.csv'

#######################################################################

# Bibliotecas

library(tidyverse)    # programação eficiente
library(stringr)      # tratamento de strings
library(tabulizer)    # importação de tabelas em arquivos pdf
library(gifski)       # geração de gifs a partir de um conjunto de pngs
library(sp)           # classes e métodos para dados espaciais
library(maptools)     # ferramentas para lidar com objetos espaciais
library(RColorBrewer) # criação de paleta de cores para mapas temáticos
library(plotly)       # graficos dinamicos
library(gganimate)    # graficos animados

#######################################################################

# Dados por município do Brasil
dados_br <- read.csv('https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-cities-time.csv',
                     sep = ',', header = T)

dados_br$ibgeID <- as.character(dados_br$ibgeID)

#--------------------------------------------------------------
# Subset apenas do Paraná
dados_pr <- subset(dados_br, state == 'PR')

# Passando cada variável do formato longo para o largo
# em função da data e armazenando em um elemento de 
# uma lista.

newDeaths <- spread(dados_pr[,c(1:5,6)], date, newDeaths)
deaths <- spread(dados_pr[,c(1:5,7)], date, deaths)
newCases <- spread(dados_pr[,c(1:5,8)], date, newCases)
totalCases <- spread(dados_pr[,c(1:5,9)], date, totalCases)

covid <- list(NULL)

covid[[1]] <- newDeaths
covid[[2]] <- deaths
covid[[3]] <- newCases
covid[[4]] <- totalCases

names(covid) <- c('newDeaths', 'deaths', 'newCases', 'totalCases')

#-------------------------------------------------------------- 

# Mapa oficial do Paraná por municípios 
load('maps/prmu.RData')

# Gerando variavel para join
prmu@data$CD_GEOCMU <- as.character(prmu@data$CD_GEOCMU)

# gerando um shp para cada informação
prmu_totalCases <- prmu
prmu_deaths <- prmu

#--------------------------------------------------------------
# Concatenando os atributos a cada shp

prmu_totalCases@data <- dplyr::left_join(prmu_totalCases@data, 
                                         covid$totalCases, 
                                         by=c('CD_GEOCMU' = 'ibgeID'))

prmu_deaths@data <- dplyr::left_join(prmu_deaths@data, 
                                     covid$deaths, 
                                     by=c('CD_GEOCMU' = 'ibgeID'))
#--------------------------------------------------------------

# Ajustando o shapefile para usar o ggplot2

# prmu_totalCases_tidy <- broom::tidy(prmu_totalCases)
# prmu_totalCases$id <- row.names(prmu_totalCases)
# prmu_totalCases_tidy <- left_join(prmu_totalCases_tidy, 
#                               prmu_totalCases@data)
# 
# prmu_deaths_tidy <- broom::tidy(prmu_deaths)
# prmu_deaths$id <- row.names(prmu_deaths)
# prmu_deaths_tidy <- left_join(prmu_deaths_tidy, 
#                               prmu_deaths@data)

#--------------------------------------------------------------

# GRAFICO
# for (i in 13:(ncol(prmu_totalCases_tidy))) {
#   
#   g<-ggplot(prmu_totalCases_tidy, 
#             aes_string(x = 'long', y = 'lat', group = 'group', 
#                        #fill = prmu_conf_tidy[,11])) +
#                        fill = paste0("`",names(prmu_totalCases_tidy[,i]),"`"))) +
#     geom_polygon(color = "black", size = 0.1) +
#     coord_equal() +
#     theme_bw()+
#     labs(title = paste0('Casos confirmados \n', 
#                         substr(names(prmu_totalCases_tidy[,i]),9,10), '/',
#                         substr(names(prmu_totalCases_tidy[,i]),6,7), '/',
#                         substr(names(prmu_totalCases_tidy[,i]),1,4)))+
#     scale_fill_gradient2(low = "#FFFF00", 
#                          mid = "#FF8000",
#                          high = "#FF4000",
#                          midpoint = 250,
#                          na.value = "#FFFFFF",
#                          limits = c(1,500),
#                          breaks = seq(0,500, 100),
#                          labels = format(seq(0,500, 100)))+
#     theme(legend.title=element_blank(),
#           plot.title = element_text(size=22))+
#     theme(plot.title = element_text(hjust = 0.5))
#   
#   filename = paste0(i,'_',names(prmu_totalCases_tidy[i]),".png")
#   
#   ggsave(filename=filename, 
#          plot=g, device="png", 
#          path=paste0("continuo/confirmados/"),
#          dpi=500, height = 7, width = 7)
#   
#   #------------------------------------------------
#   
#   g<-ggplot(prmu_deaths_tidy, 
#             aes_string(x = 'long', y = 'lat', group = 'group', 
#                        #fill = prmu_obit_tidy[,11])) +
#                        fill = paste0("`",names(prmu_deaths_tidy[,i]),"`"))) +
#     geom_polygon(color = "black", size = 0.1) +
#     coord_equal() +
#     theme_bw()+
#     labs(title = paste0('Óbitos confirmados \n', 
#                         substr(names(prmu_deaths_tidy[,i]),9,10), '/',
#                         substr(names(prmu_deaths_tidy[,i]),6,7), '/',
#                         substr(names(prmu_deaths_tidy[,i]),1,4)))+
#     scale_fill_gradient2(low = "#FFFF00", 
#                          mid = "#FF8000",
#                          high = "#FF4000",
#                          midpoint = 5,
#                          na.value = "#FFFFFF",
#                          limits = c(1,10),
#                          breaks = seq(0,10, 2),
#                          labels = format(seq(0,10, 2)))+
#     theme(legend.title=element_blank(),
#           plot.title = element_text(size=22))+
#     theme(plot.title = element_text(hjust = 0.5))
#   
#   filename = paste0(i,'_',names(prmu_deaths_tidy[i]),".png")
#   
#   ggsave(filename=filename, 
#          plot=g, device="png", 
#          path=paste0("continuo/obitos/"),
#          dpi=500, height = 7, width = 7)
#   
#   
# }
# 
# #--------------------------------------------------------------
# # Gerando um gif
# 
# files <- list.files("continuo/confirmados", 
#                     pattern = ".*png$", 
#                     full.names = TRUE)
# 
# gifski(files, 
#        gif_file = "continuo/confirmados/conf_continuo.gif", 
#        width = 650, height = 650,
#        delay = 1)
# 
# #------------------------------------------------
# 
# files <- list.files("continuo/obitos", 
#                     pattern = ".*png$", 
#                     full.names = TRUE)
# 
# gifski(files, 
#        gif_file = "continuo/obitos/obit_continuo.gif", 
#        width = 650, height = 650,
#        delay = 1)
# #--------------------------------------------------------------

#--------------------------------------------------------------
# Armazenando os dados a serem catagorizados em novos objetos
# para não perder os antigos

prmu_totalCases_cat <- prmu_totalCases
prmu_deaths_cat <- prmu_deaths

#--------------------------------------------------------------

# Categorizando por faixa de valores
for (i in 1:length(names(covid$newDeaths)[5:length(covid$newDeaths)])) {
  prmu_totalCases_cat@data$aux <- ifelse(prmu_totalCases_cat@data[5+i] > 0 & prmu_totalCases_cat@data[5+i]<11, '1-10','-')
  prmu_totalCases_cat@data$aux <- ifelse(prmu_totalCases_cat@data[5+i] > 10 & prmu_totalCases_cat@data[5+i]<51, '11-50',prmu_totalCases_cat@data$aux)
  prmu_totalCases_cat@data$aux <- ifelse(prmu_totalCases_cat@data[5+i] > 50 & prmu_totalCases_cat@data[5+i]<251, '51-250',prmu_totalCases_cat@data$aux)
  prmu_totalCases_cat@data$aux <- ifelse(prmu_totalCases_cat@data[5+i] > 250, '>250',prmu_totalCases_cat@data$aux)
  prmu_totalCases_cat@data$aux <- ifelse(is.na(prmu_totalCases_cat@data[5+i]) == TRUE | prmu_totalCases_cat@data[5+i] == 0, 'Nenhum',prmu_totalCases_cat@data$aux)
  
  prmu_totalCases_cat@data[5+i] <- factor(prmu_totalCases_cat@data$aux, levels = c("Nenhum","1-10","11-50","51-250",">250"))
  
  #--------------------------------------------------------------
  
  prmu_deaths_cat@data$aux <- ifelse(prmu_deaths_cat@data[5+i] > 0 & prmu_deaths_cat@data[5+i]<6, '1-5','-')
  prmu_deaths_cat@data$aux <- ifelse(prmu_deaths_cat@data[5+i] > 5 & prmu_deaths_cat@data[5+i]<11, '6-10',prmu_deaths_cat@data$aux)
  prmu_deaths_cat@data$aux <- ifelse(prmu_deaths_cat@data[5+i] > 10 & prmu_deaths_cat@data[5+i]<16, '11-15',prmu_deaths_cat@data$aux)
  prmu_deaths_cat@data$aux <- ifelse(prmu_deaths_cat@data[5+i] > 15, '>15',prmu_deaths_cat@data$aux)
  prmu_deaths_cat@data$aux <- ifelse(is.na(prmu_deaths_cat@data[5+i]) == TRUE | prmu_deaths_cat@data[5+i] == 0, 'Nenhum',prmu_deaths_cat@data$aux)
  
  prmu_deaths_cat@data[5+i] <- factor(prmu_deaths_cat@data$aux, levels = c("Nenhum","1-5","6-10","11-15",">15"))
  
}

#--------------------------------------------------------------

# Ajustando o shapefile para usar o ggplot2

prmu_totalCases_cat_tidy <- broom::tidy(prmu_totalCases_cat)
prmu_totalCases_cat$id <- row.names(prmu_totalCases_cat)
prmu_totalCases_cat_tidy <- left_join(prmu_totalCases_cat_tidy, 
                                  prmu_totalCases_cat@data)

prmu_deaths_cat_tidy <- broom::tidy(prmu_deaths_cat)
prmu_deaths_cat$id <- row.names(prmu_deaths_cat)
prmu_deaths_cat_tidy <- left_join(prmu_deaths_cat_tidy, 
                              prmu_deaths_cat@data)

#--------------------------------------------------------------

# GRAFICO
for (i in 13:(ncol(prmu_totalCases_cat_tidy)-1)) {
  
  g<-ggplot(prmu_totalCases_cat_tidy, 
            aes_string(x = 'long', y = 'lat', group = 'group', 
                       #fill = prmu_conf_tidy[,11])) +
                       fill = paste0("`",names(prmu_totalCases_cat_tidy[,i]),"`"))) +
    geom_polygon(color = "black", size = 0.1) +
    coord_equal() +
    theme_bw()+
    labs(title = paste0('Casos confirmados \n', 
                        substr(names(prmu_totalCases_cat_tidy[,i]),9,10), '/',
                        substr(names(prmu_totalCases_cat_tidy[,i]),6,7), '/',
                        substr(names(prmu_totalCases_cat_tidy[,i]),1,4)))+
    scale_fill_manual(values = c("#FFFFFF", "#F7BE81", "#FF8000", 
                                 "#B45F04", "#61380B"),
                      labels = levels(prmu_totalCases_cat_tidy$`2020-03-12`),
                      drop = FALSE)+
    theme(legend.title=element_blank(),
          plot.title = element_text(size=22))+
    theme(plot.title = element_text(hjust = 0.5))
  
  filename =paste0(names(prmu_totalCases_cat_tidy[i]),".png")
  
  ggsave(filename=filename, 
         plot=g, device="png", 
         path=paste0("fig/gif_pr/casos"),
         dpi=500, height = 7, width = 7)
  
  #--------------------------------
  
  g<-ggplot(prmu_deaths_cat_tidy, 
            aes_string(x = 'long', y = 'lat', group = 'group', 
                       #fill = prmu_obit_tidy[,11])) +
                       fill = paste0("`",names(prmu_deaths_cat_tidy[,i]),"`"))) +
    geom_polygon(color = "black", size = 0.1) +
    coord_equal() +
    theme_bw()+
    labs(title = paste0('Óbitos confirmados \n', 
                        substr(names(prmu_deaths_cat_tidy[,i]),9,10), '/',
                        substr(names(prmu_deaths_cat_tidy[,i]),6,7), '/',
                        substr(names(prmu_deaths_cat_tidy[,i]),1,4)))+
    scale_fill_manual(values = c("#FFFFFF", "#F7BE81", "#FF8000", 
                                 "#B45F04", "#61380B"),
                      labels = levels(prmu_deaths_cat_tidy$`2020-03-12`),
                      drop = FALSE)+
    theme(legend.title=element_blank(),
          plot.title = element_text(size=22))+
    theme(plot.title = element_text(hjust = 0.5))
  
  filename =paste0(names(prmu_deaths_cat_tidy[i]),".png")
  
  ggsave(filename=filename, 
         plot=g, device="png", 
         path=paste0("fig/gif_pr/obitos"),
         dpi=500, height = 7, width = 7)
}

#--------------------------------------------------------------
# Gerando um gif

files <- list.files("fig/gif_pr/casos", 
                    pattern = ".*png$", 
                    full.names = TRUE)

gifski(files, 
       gif_file = "fig/gif_pr/casos/conf_faixa.gif", 
       width = 650, height = 650,
       delay = 0.5)

#--------------------------------------------------------------

files <- list.files("fig/gif_pr/obitos", 
                    pattern = ".*png$", 
                    full.names = TRUE)

gifski(files, 
       gif_file = "fig/gif_pr/obitos/obit_faixa.gif", 
       width = 650, height = 650, 
       delay = 0.5)
#--------------------------------------------------------------

remove(list = ls())

#--------------------------------------------------------------