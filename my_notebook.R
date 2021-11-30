#CIENCIA DE DADOS COM R - PRATICA DE ESTUDOS

# BOAS PR?TICAS P/ PUBLICAR D?VIDAS NA COMUNIDADE STACK OVERFLOW
    # Vers?o do R que est? usando; 
        R.Version()
    # Sistema operacional;
    # Forne?a um exemplo replic?vel;
    # Veja se a sua d?vida j? n?o foi abordada em outro t?pico.

install.packages("readr")
library(readr)
        
#(re)carregar a BASE ancorada no PROJETO
data("rockroll")
        
help(package = "datasets") #Documentation for package ‘datasets’
        
# Para carregar uma base de dados chamada `employees`
data("employees")
        
# Selecionando, na base de dados `employees`
employees[which(employees$name == "John" & employees$surname == "Insecure"), ]$login

#------------------------------------------------------------------------------------        
#CRIACAO DE DATA.FRAME EM R

        bandas <- c("Black Sabbath", "Sisters", "Iggy Pop", "Fields")
        integrantes <- c(4,3,1,5)
        origem <- c("Birmingham","Leeds","Detroit","London")
        fundacao <- c(68,77,71,83)
        on_tour <- c(F,T,T,F)
        
length(bandas)
        
        bandas
        integrantes
        origem
        fundacao
        
        rockroll <- data.frame(bands = bandas,
                               city = origem,
                               year = fundacao,
                               members = integrantes,
                               tour = on_tour)
glimpse(rockroll)

#------------------------------------------------------------------------------------
#CRIACAO DE VARIAVEL (COM SELECT E EVERYTHING)

variavel <- "hello world"
variavel_num <- 666

new_rockroll <- rockroll %>% select(bands, city, everything(), -members)

names(new_rockroll)

#------------------------------------------------------------------------------------
#VARIAVEIS DO TIPO "DATA"
#Para criar um objeto "Date" em R, a sequência de caracteres deve obedecer
#a um formato que pode ser definido por meio de um conjunto de símbolos.

# [%Y]: 4-digit year (1980)
# [%y]: 2-digit year (80)
# [%m]: 2-digit month (11)
# [%d]: 2-digit day of the month (28)
# [%A]: weekday (saturday)
# [%a]: abbreviated weekday (Sat)
# [%B]: month (November)
# [%b]: abbreviated month (Nov)

data_1 = as.Date("1980-11-28")
data_2 = as.Date("Nov-11-80", format = "%b-%d-%y")
data_3 = as.Date("28/11/1980", format = "%d/%m/%Y")

agora <- Sys.time()
hoje <- Sys.Date()

format_hoje <- format(Sys.Date(), format = "%d %B, %Y")
msg_atualizacao <- format(Sys.Date(), format = "Atualização mais recente: %b-%d-%y")

library(lubridate) #https://rpubs.com/JamisonCrawford/datetime

now()
my_datetime <- Sys.time()
ymd_hms(my_datetime)


#EXTRIAR DE DATE & TIME
year(hoje)
month(agora)
day(my_datetime)
weekdays(hoje)
hour(agora)
minute(agora)

#DATEDIFF
birthday <- mdy("November 28, 1980")
age <- today() - birthday
print(age)
class(age)

#EXEMPLO
admissao <- data.frame(admissao = c("Joaquim", "Laura", "Donna"),
                     date = c("2018-04-03", "2018-04-19", "2018-05-11"))
admissao$date <- ymd(admissao$date)
print(admissao)

#ARREDONDAR DATA DE ADMISSAO
round_date() #arredondar
floor_date() #mais baixa
ceiling_date() #mais alta

admissao$date <- floor_date(x = admissao$date, unit = "month")
print(admissao)

#------------------------------------------------------------------------------------        
#SALVANDO SCRIPTS 

save(rockroll, file = "rockbands.RData")
save(rockroll, file = "rockbands.csv")
        
rockbands <- write.csv(rockroll, row.names = TRUE)
        
library(writexl)
        
write_xlsx(rockroll, "rockroll.xlsx")

rockroll <- read.delim(file = "rockbands.csv",
                               delim = ";",
                               escape_double = FALSE,
                               trim_ws = TRUE)

#------------------------------------------------------------------------------------        
#FUNCOES DE MANIPULACAO DE VARIAVEIS 

rockroll$hallfame <- c(T,F,T,F) #ADICIONAR VARIAVEL
rockroll$hallfame <- NULL #EXCLUIR VARIAVEL
head(rockroll)
        
rockroll$BANDS #SELECIONAR A VARIAVEL
        
attach(rockroll) #ANEXAR A BASE DE DADOS NO SCRIPT
city
detach(rockroll)
        
#NAVEGAR PELAS POSIÇÕES. EXEMPLOS:

rockroll[2,1] #organização da função [OBSERVACOES,COLUNA] - DEIXAR O LADO ESQUERDO EM BRANCO VAI RETORNAR TODO EIXO (X/Y)
rockroll[2,"city"]
rockroll[ ,c("city","hallfame")]
rockroll[1:3,"year"]
        
rockroll[which(bands != "Fields"),] #SELECT COM WHICH (OBS: C/ ATTACH ATIVO)

rockroll[which(rockroll$year != 77 & 71),] #condicional para numéricos

rockroll[which(rockroll$year <= 71),] #condicional para numéricos
        
#g-sub - SUBSTITUIR UM PADRAO DE DADOS NA VARIAVEL DESEJADA
        
        rockroll$year <- gsub(rockroll$year,
                              pattern = 83,
                              replacement = 86)
        
        View(rockroll)
        
rockroll <- edit(rockroll) #JANELA DE EDIÇÃO DE VALORES MANUALMENTE
        
#COMPILAR PARTE DA BD
        exemplo <- rockroll[1:2,1:3]
        View(exemplo)
        
#FUNCAO UNIQUE - FILTRAR DADOS ÚNICOS (simular a repetição das observações)
        exemplo_unique = rbind(exemplo,
                               exemplo)
        unique(exemplo_unique)
        View(exemplo_unique)
        
#------------------------------------------------------------------------------------
#operadores lógicos em que o resultado é TRUE ou FALSE (tipo logic).
#   == igual a
#   != diferente
#   | (ou)
#   & (e)
#   >, >=, <, <= (grandeza)
        
#------------------------------------------------------------------------------------        
#FUNCOES MATEMATICAS 
        
valor <- 10
valor

raiz.quadrada <- sqrt(2)
raiz.quadrada

round(3.141621, 2)
# o mesmo que:
round(digits = 2, x=3.141621)

?log # procurar ajuda
log(10)

??inner_join # procurar ajuda de funcoees que nao estao "instaladas" ainda

#--------------------------------------------------------------------------------------
#Rounding of Numbers

?round

ceiling(raiz.quadrada)
#recebe um ?nico argumento num?rico X e retorna um vetor num?rico contendo os menores inteiros n?o menores do que os elementos correspondentes de x.

floor(raiz.quadrada)
#recebe um ?nico argumento num?rico x e retorna um vetor num?rico contendo os maiores inteiros n?o maiores que os elementos correspondentes de x.

trunc(raiz.quadrada)
#recebe um ?nico argumento num?rico x e retorna um vetor num?rico contendo os inteiros formados pelo truncamento dos valores em x em dire??o a 0 (ZERO).
# pode ocorrer qdo um n?mero decimal sofre uma convers?o de tipos para um INTEIRO; neste caso, para zero casas decimais pq as vari?veis inteiras n?o podem armazenar n?meros reais n?o inteiros.

signif(raiz.quadrada)
signif (raiz.quadrada, 2 -trunc(raiz.quadrada))
#arredonda os valores em seu primeiro argumento para o n?mero especificado de d?gitos significativos. Para signif (x, dig) ? o mesmo que round.

#--------------------------------------------------------------------------------------
#ESTATISTICAS BASICAS no R:

sum(x) #Soma de valores
mean(x) #M?dia
var(x) #Vari?ncia
median(x) #mediana
summary(valor) #resumo estat?stico
quantile(valor) #quartil (0-100%)

#--------------------------------------------------------------------------------------
#PACOTES e BIBLIOTECAS (FUNDAMENTAIS)

library(tidyverse)
install.packages("dplyr") #pacote de manipula??o de dados (pacotes instalados na aba "packages", na janela de Funcionalidades)

#------------------------------------------------------------------------------------        
#PACOTE DPLYR (contido no pacote tidyverse)
library(dplyr) #anexar o pacote em R
?dplyr
??dplyr

#---------------------------------------------------------------------------------------
#FUNCOES ADICIONAIS
data("starwars")

table(starwars$skin_color) #gera a visualização de frequencia de dados (contagem) na variavel

unique(starwars$sex) #selecao distinta da variavel

#--------------------------------------------------------------------------------------
#GERAR E EXCLUIR OBSERVACOES E VARIAVEIS NA BASE DE DADOS

data("starwars")
names(starwars)

parcial_starwars <- starwars[1:50,10:13]
view(parcial_starwars)

#EXCLUIR
valores <- valores[c(-1),] #em linha
valores <- valores[,c(-3)] #em coluna

valores
#--------------------------------------------------------------------------------------
#Indentacao de codigos

install.packages("styler") #https://styler.r-lib.org/
install.packages("lintr") #https://github.com/jimhester/lintr

#Tidyverse (por Hadley Wickham): cole??o de pacotes para atuarem no workflow: importa??o, manipula??o, explora??o e visualiza??o de dados.

#--------------------------------------------------------------------------------------
#Funcoes de distribuicao

dnorm(valor, mean = 0, sd = 1) #densidade
qnorm(valor, mean = 0, sd = 1) #quantil #sd = desvio padr?o
rnorm(valor, mean = 0, sd = 1) #gera??o aleat?ria
qnorm(valor, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) #quantile

#--------------------------------------------------------------------------------------
#Remover objetos do ambiente (pode ser combinado p cadeias de caracteres, ou na lista de vetores)
?rm()

rm (..., list = character(), pos = -1,
       envir = as.environment(pos), inherits = FALSE)

#--------------------------------------------------------------------------------------
#ESTRUTURA DE DADOS - LEITURA DE DADOS

getwd() #get Working Directory
setwd('D:/caminho/do/arquivo/arquivo.csv') #set working directory

head(rockbands)
tail(rockbands)
str(rockbands)
class(rockbands)

?read.csv()
#importar um CSV
    rockbands <- read_csv("rockbands.csv")

?read.delim()
#lendo arquivo com delimitador #
    read_delim('caminho/do/arquivo/arquivo_separado.txt', delim = ';')

?read.fwf().
#lendo arquivo de coluna fixa: coluna tamanho 5, coluna 2 de tamanho 2 e coluna 3 de tamanho 10
    read_fwf('D:/caminho/do/arquivo/arquivo.csv', 
         col_positions = fwf_widths(c(5, 2, 10)))

read_excel()
#readxl package to read xls and xlsx files
    rock <- read_excel("rockroll.xlsx")    
    head(rock)
    
# Specify sheet by its name
    my_data <- read_excel("my_file.xlsx", sheet = "data")
    
# Specify sheet by its index
    my_data <- read_excel("my_file.xlsx", sheet = 2)

#Case of missing values: NA (not available)  
    my_data <- read_excel("my_file.xlsx", na = "---")
    
#--------------------------------------------------------------------------------------
#VETORES: sequ?ncias unidimensionais de valores de um mesmo tipo. Cada coluna de um data frame ? um vetor.
# Para a cria??o de vetores, usamos a fun??o de combina??o de valores c() (combine).
    
vetor.chr <- c('tipo1', 'tipo2', 'tipo3', 'tipo4')
vetor.num <- c(1, 2, 5, 8:20)
vetor.num.repetidos <- c(rep(2, 10)) #usando func?o para repetir n?meros
vetor.num.sequencia <- c(seq(from=0, to=50, by=5)) #usando fun??o para criar sequ?ncias
vetor.logical <- c(TRUE, TRUE, TRUE, FALSE, FALSE)
    
#Convers?es de tipos de vari?veis
as.character(vetor.num)

?vector() #tds os elementos do mesmo tipo (+info: http://www.estatisticacomr.uff.br/?p=564)
    vec <- data.frame(x=1:3, y=5:7)
    vec
    view(vec)
    is.vector(vec)
    class(vec)
    as.vector(vec)
    
?array() #tds os elementos do mesmo tipo, mas multidimensional [+info: ]
    my.array <- array(1:24, dim=c(3,4,2)) #dim=c(linhas,colunas,qtd vector)
    my.array 

?matrix() #tds os elementos do tipo ARRAY, mas bidimensional
    teste.matrix <- matrix(1:3,nrow = 3,ncol = 5)
    teste.matrix
    teste.matrix +4
    teste.matrix2 <- matrix(NA,nrow = 2,ncol = 3)
    teste.matrix2

?list() #criar uma matriz c/ elementos de diferentes tipos
    mylist <- list(teste.matrix, "2015-2020") #unnamed list
    view(mylist)
    mylist <- list(numbers= 1:3, year= "2015-2020")
    names(mylist)

?data.frame() #transforma vetores em colunas (tyde)
#Um data.frame pode ser considerado um conjunto de vetores nomeados, todos do mesmo tamanho e com a mesma qtde de registros.
    
    employee <- c('John Doe','Peter Gynn','Jolie Hope')
    salary <- c(21000, 23400, 26800)
    startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14'))
    mystaffs <- data.frame(employee,salary,startdate)
    str(mystaffs)

    #Por padr?o, R transforma vetores de caracteres em FACTOR. Isso pode causar erros no c?digo.
    #portanto, sempre especificar o argumento stringsAsFactors como solu??o!!!
    mystaffs <- data.frame(employee,salary,startdate, stringsAsFactors = FALSE)
    str(mystaffs)
    
    
?factor() #tipo especial de vetor com categorias e levels. N?o ? poss?vel criar categorias sem criar um level.
    
    directions <- c("North", "East", "South", "South")
    factor(directions) #os n?veis do seu novo fator n?o cont?m o valor "WEST"
    regiao <- factor(directions, 
                  levels= c("North", "East", "South", "West"), 
                  labels=c("N", "E", "S", "W"))
    str(regiao)
    
#-------------------------------------------------------------------------------------
#DADOS NA - NOT AVAILABLE
#A funcao summary() pode ser usada para averiguar a ocorroncia de NA.

?summary()
    
    vec <- data.frame(x=1:3, y=5:7, z=NA)
    vec
    cat("The summary() of vector is", "\n")
    summary(vec)
    
#realiza um teste para saber se a vari?vel possui um valor NA. 
#Retorna TRUE se for NA ou FALSE.
    is.na(vec)

#retorna TRUE para as LINHAS em que todas as colunas possuem valores v?lidos (preenchidos)
    #e FALSE para as LINHAS em que, em alguma coluna, existe um NA.
    complete.cases() 

data("airquality")
summary(airquality)
is.na(airquality$Ozone)
complete.cases(airquality)

#--------------------------------------------------------------------------------------
#IF - ELSE - ELSE IF (CONDICIONAIS)

#Existe uma diferen?a entre as duas formas de "if else": a estrutura if() {} else {} s? opera vari?veis,
#uma por uma, j? a estrutura ifelse() opera vetores, ou seja, consegue fazer a compara??o para todos os
#elementos. Isso faz com que a forma if() {} else {} seja mais utilizada para compara??es fora dos dados,
#com vari?veis avulsas. J? a estrutura ifelse() ? mais usada para compara??es dentro dos dados, com
#colunas, vetores e linhas.

#IF/ELSE
x <- 10
teste <- if(x >= 10 ) {y <- "sim"} else {y <- "nao"}
teste

teste <- if(x > 10 ) {y <- "sim"} else if (x == 10) {y <- "igual"} else {"n?o"}
teste

a <- 839
c <- ifelse(a >= 10000, 'VALOR ALTO', ifelse(a < 10000 & a >= 1000, 'VALOR MEDIO', 'VALOR BAIXO'))
c

#------------------------------------------------------------------------------------
#EXEMPLO 02

vetor <- 5

if(vetor > 5){
  print("oi!")
} else {
  print("voltei!")
}

# O RESULTADO DA ANALISE SEMPRE RETORNARÁ O RESULTADO DO PRIMEIRO "TRUE" DA CONDICIONAL

#------------------------------------------------------------------------------------
#ELSE IF

if(vetor > 8){
  print("O objeto é maior do que 8")
}else if(vetor > 7){
  print("O objeto é maior do que 7")
}else if(vetor > 6){
  print("O objeto é maior que 6")
}else if(vetor > 5){
  print("O objeto é maior do 5")
} else {
  print("O objeto é maior do que 4")
}

#ifelse() - exemplo SEM ANINHAMENTO:

ifelse(vetor == 7, 
       yes = "o objeto é igual a 7", 
       no = "o objeto é diferente de 7")


#FUNÇÃO PARA (FOR)------------------------------------------------------------------

y <- 10

for(i in 1:5){  # VARIAVEL "I" = declarada apenas para servir esta função. 
  print(y + i)
}

#EXEMPLO PARA STRINGS
vetor_regioes <- c("norte", "noroeste", "nordeste", "sudeste", "sul", "centro-oeste")

for(regiao in vetor_regioes){
  print(regiao)}

#--------------------------------------------------------------------------------------
#FOR (LOOPS)

for(i in c(1:5)) {
  print(i^2)
}

#lista todos os arquivos de uma pasta
lista.de.arquivos <- list.files('dados/dados_loop') 
is.vector(lista.de.arquivos)

for(i in lista.de.arquivos) {
  print(paste('Leia o arquivo:', i))
  #exemplo: read_delim(i, delim = "|")
}

#Tamb?m ? poss?vel utilizar loop com if. No exemplo a seguir, queremos ver todos os n?meros de 1 a 1000
#que s?o divis?veis por 29 e por 3 ao mesmo tempo. Para isso, utilizaremos o operador %%, que mostra o resto
#da divis?o. Se o resto for zero, ? divis?vel.
for(i in 1:1000){
  if((i %% 29 == 0) & (i %% 3 == 0)){
    print(i)
  }
}

#------------------------------------------------------------------------------------
#WHILE

z <- 0

while(z <= 10){
  print(z)
  
  z <- z + 1
}

#WHILE (LOOPS - enquanto for...)

i <- 1
while(i <= 5){
  print(i)
  i <- i + 1}

#Enquanto essa pasta estiver vazia estar? em execu??o.

automatico <- list.files('/teste')
length(automatico) == 0

#Usamos a função "Sys.sleep(5)" para que o codigo espere por 05-sec antes prx loop.

while (length(automatico) == 0) {
  automatico <- list.files('/Meu Drive/Data Science and Machine Learning/Introdução R/myproject/teste/')
  if(length(automatico) > 0) {
    print('O arquivo chegou!')
    print('Inicia a leitura dos dados')
    print('Faz a manipulação')
    print('Enviando email informando conclusão dos cálculos')
  } else {
    print('aguardando arquivo...')
    Sys.sleep(5)
  }
}

#-------------------------------------------------------------------------------------
#REPEAT()

w <- 3

repeat{
  print(w)
  w <- w + 2
  if(w > 15) break()
}

#--------------------------------------------------------------------------------------
#CASE WHEN

case_when()
# Uma variável que não consta na lista é o time vencedor do jogo
# Vamos criar usando o mutate e a função case_when para definir a fórmula
# O case_when funciona como um "se -> então"

jogos <- jogos %>% mutate(time_vencedor = case_when(
  c(jogos$team_home_score-jogos$team_away_score)==0 ~ "empate",
  c(jogos$team_home_score-jogos$team_away_score)>0 ~ team_name_home,
  c(jogos$team_home_score-jogos$team_away_score)<0 ~ "visitante")) %>% 
  relocate(time_vencedor, .after = team_away_score)

table(jogos$time_vencedor)

# Vamos gerar um gráfico para visualizar melhor a informação resultante

ggplot(jogos) + 
  geom_bar(aes(x = time_vencedor)) + 
  labs(x = "Vencedor",
       y = "Contagem") + 
  theme_light()

#-------------------------------------------------------------------------------------
#MANIPULACAO DE DATAFRAME

class(airquality$Ozone)
#Informa o tipo da coluna

is.vector(airquality$Ozone) 
#Apenas para verificar que a coluna é um vector. Cada coluna de um data.frame é um vetor.

unique(airquality$Ozone)
#Função que retorna apenas os valores únicos, sem repetição, de um vetor.

vetor <- c(seq(from=0, to=100, by=15)) #vetor de 0 a 100, de 15 em 15.
vetor[4] #mostra apenas o elemento na posição
vetor[c(2,7)] #selecionando mais de um elemento
vetor[2, ] #linha 2, todas as colunas
senado[c(100, 200), c(2,3,4)] # selecionando mais de uma linha e coluna
senado[1:10, c('Senador', 'Partido', 'UF')] #selecionar o item desejado utilizando o próprio nome da coluna
head(senado[senado$Partido == 'PV', ]) #selecao condicional

#--------------------------------------------------------------------------------------
#Operador %>% (pipe)

#usando "pipe" estará informando que um resultado da operação anterior será a entrada
#para a nova operação, sem precisar atribuir resultados ou criar novos objetos.

library(readxl)
rock <- read_excel("rockroll.xlsx")    
head(rock)

?select()
selecao <- rock %>% select(bands, tour)
selecao

selecao <- rock %>% select(-tour)
selecao

#--------------------------------------------------------------------------------------
?filter() #retem todas as linhas que atendem às suas condições.
          #Qdo a condição é avaliada como NA, a linha será eliminada.

filtro <- rock %>% select("bands", "city", "tour") %>%
              filter(tour == TRUE)
filtro

#--------------------------------------------------------------------------------------
?distinct()
distinto <- rock %>% select(tour) %>%
                    filter(tour == FALSE) %>%
                      distinct()
distinto

#--------------------------------------------------------------------------------------
?n_distinct()

x <- sample(1:10, 1e5, rep = TRUE)
length(unique(x))
n_distinct(x)
x


#----------------------------------------------------------------------------------
arrange() #organizar 



#----------------------------------------------------------------------------------
?mutate() #modificar ou adicionar as variavies

valor_1 <- c(1:5)
valores <- data.frame(valor_1)
str(valores)

valor_2 = c(6:10)
tempo_novo = valor_2*2

valores <- mutate(valores, valor_2, tempo_novo)
print(valores)

#EXEMPLO 02

mutar <- mutate(rock, record = "interscope") #criar novo campo "record"
mutar
xmutar <- transmute(rock, record = "emi")
xmutar

#--------------------------------------------------------------------------------------
?transmute() #ao contrário do MUTATE, a variavel é substituida

tipo_valor <- c("impar","par","impar","par","impar")
trx_valores <- transmute(valores,
                         valor_1, tipo_valor, tempo_novo) #selecao de variaveis
trx_valores

#----------------------------------------------------------------------------------
rename() #renomear a variavel

nova_base_stwars <- starwars %>% rename(veiculos = vehicles,
                                        filmes = films,
                                        sexo = sex)

nova_base_stwars <- starwars %>% rename(nome = 1, peso = 2, massa =3)

names(nova_base_stwars)

#--------------------------------------------------------------------------------------
?replace() #substituir o valor da observacao

novo_valor  <-  mutate(valores, 
                       tempo_novo = replace(tempo_novo, tempo_novo == 12, "doze"),
                       tempo_novo = replace(tempo_novo, tempo_novo == 20, "vinte"),)
print(novo_valor)

#----------------------------------------------------------------------------------
?recode() #criar uma nova variavel mantendo uma variavel existente

novo_valor  <-  mutate(valores,
                       nova_var = recode(tempo_novo,
                                         "12" = "par",
                                         "14" = "par",
                                         "16" = "par",
                                         "18" = "par",
                                         "20" = "par"))

#modificando o conteúdo da variavel sem criar uma nova variavel

novo_valor  <-  mutate(valores,
                       tempo_novo = recode(tempo_novo,
                                           "12" = "par",
                                           "14" = "par",
                                           "16" = "par",
                                           "18" = "par",
                                           "20" = "par"))

print(novo_valor)

#classificar para cada categoria
nova_valor_dummy <- mutate(valores, perfil_1 = recode(valor_2,
                                                      "6" = 0,
                                                      "7" = 1,
                                                      "8" = 0,
                                                      "9" = 1,
                                                      "10" = 0),
                           perfil_2 = recode(valor_2,
                                             "6" = 1,
                                             "7" = 0,
                                             "8" = 1,
                                             "9" = 0,
                                             "10" = 1))


print(nova_valor_dummy)

#----------------------------------------------------------------------------------
relocate() #reordenar as posições das variavies na base

head(parcial_starwars)

parcial_starwars %>% relocate(films, .before = homeworld)
parcial_starwars %>% relocate(species, .after = homeworld)

#----------------------------------------------------------------------------------
slice() #cortar uma faixa da bd


#--------------------------------------------------------------------------------------
?cut() #divide um agrupamento de valores com base em intervalos, por exemplo, percentual (quartil)

novo_valores <- valores %>% mutate(grupos = cut(valor_1,
                                                c(-Inf,quantile(valores$valor_1, 
                                                                type=5,
                                                                probs= c(0.25,0.50,0.75), TRUE),Inf),
                                                c("Q1","Q2","Q3","Q4")))

novo_valores   

#--------------------------------------------------------------------------------------
?pull() - #extrair um VETOR do banco, similar ao SELECT - pode ser util na exportacao entre tabelas 
  
vetor_star <- parcial_starwars %>% pull(var = 1) #digitar no CONSOLE

#--------------------------------------------------------------------------------------
#FUNCOES DE AGRUPAMENTO E SUMARIZACAO
#O group_by() e o summarise() são operações que trabalham na agregação dos dados

install.packages("nycflights13")
library(nycflights13)
data("flights")
str(flights)
head(flights)

#obter a média de atraso da chegada para cada mês
med_atraso <- flights %>%
                group_by(month) %>%
                summarise(arr_delay_media = mean(arr_delay, na.rm=TRUE))

med_atraso                  

?mean #media aritmetica
?na.rm #Argumento "na.rm" remove os valores em falta ou codificados como "NA".


#ordenar os meses pelas menores médias de decolagem (ordem decrescente usar o sinal de menos -)
head(flights)

decolar <- flights %>%
                group_by(month) %>%
                summarise(arr_delay_media = mean(arr_delay, na.rm=TRUE),
                          dep_delay_media = mean(dep_delay, na.rm=TRUE)) %>%
                arrange(dep_delay_media)
decolar

#--------------------------------------------------------------------------------------

?tally()
#é um agrupamento p/ resumir "n" ou "sum (n)", dependendo se vc está contando pela
#primeira vez ou recontando. O count () é semelhante, mas também faz o group_by.

data("starwars")
head(starwars)
home_per_sex <-  starwars %>% 
                    group_by(homeworld, gender) %>%
                      tally(sort = TRUE) #largest groups at the top.

view(home_per_sex)

#--------------------------------------------------------------------------------------
#FUNCTION (sequência de comandos e instruções)

fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}

#ponto de ebulição da agua
fahrenheit_to_celsius(212)
#ponto de congelamento da agua
fahrenheit_to_celsius(32)

#FUNCAO PARA FORMARTAR EM MAIUSCULOS
uppercase <- function(palavra) {
  retorno <- NULL
  for(i in 1:nchar(palavra)) {
    if(i %% 1 == 0) {
      retorno <- paste0(retorno, toupper(substr(palavra, i, i)))
    } else {
      retorno <- paste0(retorno, tolower(substr(palavra, i, i)))
    }
  }
  return(retorno)
}
uppercase('TESTE DE função: Letras Maiúsculas e Minúsculas')
uppercase('conseguiu entender?')
uppercase('João da Silva')


#FUNCAO PARA FORMARTAR EM MINUSCULAS
lowercase <- function(palavra) {
  retorno <- NULL
  for(i in 1:nchar(palavra)) {
    if(i %% 1 == 0) {
      retorno <- paste0(retorno, tolower(substr(palavra, i, i)))
    } else {
      retorno <- paste0(retorno, toupper(substr(palavra, i, i)))
    }
  }
  return(retorno)
}
lowercase('TESTE DE função: Letras Maiúsculas e Minúsculas')
lowercase('CONSEGUIU ENTENDER?')
lowercase('João da Silva')

---------------------------------------------------------------------------------------
#EXERCICIOS

#Qtas especies há em Starwars?
species <- starwars %>% count(species, sort = TRUE)
species

data("flights")
str(flights)
head(flights)

#Verifique a existência de registros NA em DEP_DELAY.
summary(is.na(flights$dep_delay))

#crie um novo data.frame "voos" sem registros NA
voos <- data.frame(flights %>% filter(dep_delay == FALSE))
str(voos)
summary(is.na(voos$dep_delay))

#Quantos voos foram realizados? Demonstre os maiores grupos no topo.
tot_fly <- voos %>% count(flight, sort = TRUE)
head(tot_fly)

#Quantos voos partiram da origem "JFK"?
jfk <- voos %>% select(origin) %>%
                  filter(origin == 'JFK') %>%
                  count(origin)
head(jfk)

#Exibir a distância total percorrida por aeronave. 
kms <- aggregate(voos$distance, by=list(tail_number = voos$tailnum), FUN=sum)
head(kms)

#------------------------------------------------------------------------------------
#AVALIACAO-01 #######################################################################
#------------------------------------------------------------------------------------

library(tidyverse)
library(readxl)

#QUESTAO 01 --------------------------------------------------------------------------

#Se quisermos selecionar em um dataset_antigo as variáveis “var1” e “var5” #e gerar um
#novo dataset contendo apenas as duas variáveis podemos escrever o comando da seguinte forma:

novo_dataset <- select(dataset_antigo, everything(), -var1, -var5)
#Nao se aplica. Retorna as vars 2:4, exceto a var1 e 5

novo_dataset <- select(dataset_antigo, var1:var5)
#Nao se aplica. Retorna todas as vars

novo_dataset <- select(dataset_antigo, var1, var5)
#CORRETO. Retorna apenas as vars 1 e 5

novo_dataset <- select(novo_dataset, starts_whit(“var”))
#INCORRETO. comando inválido.

var1 <- 1
var2 <- 2
var3 <- 3
var4 <- 4
var5 <- 5
dataset_antigo <- data.frame(var1,var2,var3,var4,var5)
str(dataset_antigo)

#QUESTAO 02 --------------------------------------------------------------------------

#Para ALTERAR o nome de uma coluna e, no mesmo comando, REORGANIZAR as posições 
#das colunas no dataset precisaremos usar em conjunto os seguintes elementos:

novo_dataset <- select(dataset_antigo, var1:var5)
novo_dataset

#A) rename, pipe, select.
      #CORRETO!
   
dataset_antigo <- novo_dataset %>% rename(new_var1 = var1,
                                          new_var2 = var2,
                                          new_var3 = var3,
                                          new_var4 = var4,
                                          new_var5 = var5) %>%
      select(new_var5,new_var4,new_var3,new_var2,new_var1)
glimpse(dataset_antigo)

#B) rename, recode, pipe.
      #INCORRETO. A ordem dos elementos não se aplica, além do elemento RECODE.

#C) rename, pipe, mutate.
      #INCORRETO. RENAME é realizado, porem, o comando MUTATE não reorganiza as variaveis 
      #e ainda substitui o valor da nova_var=1 para "o texto desejado".

dataset_antigo <- novo_dataset %>% rename(new_var1 = var1,
                                          new_var2 = var2,
                                          new_var3 = var3,
                                          new_var4 = var4,
                                          new_var5 = var5) %>%
    mutate(new_var2,new_var1 = "mutate",new_var5,new_var4,new_var3)
glimpse(dataset_antigo)

rename(dataset_antigo, "nome" = 4)

#D) glimpse, pipe, select.
      #INCORRETO. O elemento glimpse nao se aplica 

#MAIS INFORMACOES SOBRE OS ELEMENTOS ACIMA DESCRITOS:

#pipe %>% (operador)
library(magrittr)

#rename() RENOMEAR VARIAVEIS usando: new_name = old_name

#select() SELECIONAR (e opcionalmente RENOMEAR) VARIAVEIS, usando referência as variáveis com base em seus nomes. (por exemplo, a: f). 
          #As LINHAS NAO são afetadas.
          #Também pode usar funções de como is.numeric para selecionar variáveis com base em suas propriedades.

#recode() Versão vetorizada de switch(): SUBSTITUIR valores numéricos POR posição ou
          #nome, e valores de caracter ou fator apenas por seu nome, preservar a ordem
          #existente dos níveis enquanto altera os VALORES.
          #Pode ser usada para ADICIONAR (ou não) uma nova variavel.

#mutate() ADICIONA novas variáveis e PRESERVA as existentes;

#transmute() ADICIONA novas variáveis e ELIMINA as existentes.

#glimpse() similar PRINT(). Torna possível ver todas as colunas em um quadro de dados.
           #É um pouco como str (), mas tenta mostrar o máximo de dados possível.

#QUESTAO 03 ----------------------------------------------------------------------------

#Pode-se considerar que duas utilidades principais para a função “mutate” são:
  
#A) adicionar novas variáveis ao dataset, preservando as existentes; modificar o conteúdo das variáveis.
    #CORRETO

#B) excluir variáveis do dataset, mas selecionado as que ficam; gerar novas variáveis como função de outras existentes.

#C) reposicionar variáveis no dataset; excluir variáveis do dataset com base em critérios comuns a todas elas.

#D) adicionar novas variáveis ao dataset, excluindo as existentes; mudar os nomes das variáveis em conjunto.
    #TRANSMUTE()

#QUESTAO 04 ----------------------------------------------------------------------------

#Qual das funções a seguir permite verificar quais são as CATEGORIAS de uma #variável
#categórica “var1”, pertencente a um “dataset”, e a CONTAGEM observada em cada categoria?

glimpse(starwars$homeworld) #INCORRETO. tenta mostrar o máximo de dados possível.

View(starwars$homeworld) #INCORRETO. NÃO REALIZA A CONTAGEM.

table(starwars$homeworld) #CORRETO.
#Usa os fatores de classificação para construir uma tabela de contagens em cada categoria.

unique(starwars$homeworld) #INCORRETO. Retorna uma matriz com elementos/linhas duplicados removidos.

#QUESTAO 05 ----------------------------------------------------------------------------

# A função SELECT pode ser utilizada primordialmente para:
  
#A) incluir variáveis selecionadas ao dataset; reposicionar a ordem das observações
      #INCORRETO. Argumentos: mutate() ou transmute()

#B) selecionar observações com base em critérios; criar objetos selecionados.
      #INCORRETO. Não seleciona observações apenas variavies. P/ observações: filter()

#C) extrair variáveis selecionadas do dataset; reposicionar variáveis no dataset.
      #CORRETO.

#D) extrair observações do dataset; reposicionar variáveis no dataset.
      #INCORRETO. Não manipula observacoes.

#QUESTAO 06 ----------------------------------------------------------------------------

#Assinale o comando a seguir que pode ser utilizado para reposicionar a última variável
#do dataset (“ultima”) para o início:
  
novo_dataset

#A) select(dataset, ultima, everything())
select(novo_dataset, var5, everything())

#B) select(everything(), ultima, dataset)
#INCORRETO. COMANDO INVALIDO.

#C) mutate(dataset, ultima, everything())
#INCORRETO. COMANDO INVALIDO.
mutate(novo_dataset, var5, everything())

#D) select(dataset, everything(), ultima)
#INCORRETO. Sem alteracao de reposicionamento
select(novo_dataset, everything(), var5)

#QUESTAO 07 ----------------------------------------------------------------------------
# Dentre as funções listadas a seguir, pode-se considerar que a mais adequada para
#visualizar as informações gerais sobre o dataset é:

?rename
?recode
?mutate

glimpse(novo_dataset)

#QUESTAO 08 ----------------------------------------------------------------------------
#Se temos uma variável do tipo “caracteres (chr)” em que são identificadas 3 categorias 
#para as observações do dataset e queremos transformá-la para variáveis binárias, 
#os comandos que podem ser utilizados em conjunto para realizar esta tarefa são:
  
#A) mutate e rename
#INCORRETO. ADICIONA novas variáveis e PRESERVA as existentes, depois RENOMEIA.

#B) rename e cut 
#INCORRETO. cut() ira dividir os valores com base em intervalos, como, faixa percentual.

#C) mutate e recode
dataset_dummy <- mutate(novo_dataset,
                 var1 = recode(var1, "1" = 0),
                 var2 = recode(var2, "2" = 1),
                 var3 = recode(var3, "3" = 0),
                 var4 = recode(var4, "4" = 1),
                 var5 = recode(var5, "5" = 0),)

dataset_dummy

#D) mutate e transmute.
#INCORRETO. ADICIONA novas variáveis e PRESERVA ou ELIMINA as existentes.

#QUESTAO 09 ----------------------------------------------------------------------------
# Assinale a alternativa em que a função “rename” está corretamente utilizada:
  
#A) rename(dataset, novo_nome = nome_antigo)
#CORRETO
rename(dataset_dummy, var1_dummy = var1)

#B) rename(dataset, novo_nome = novo_nome)
#INCORRETO.
rename(dataset_dummy, var1_dummy = var1_dummy)

#C) rename(nome_antigo = novo_nome, dataset)
#INCORRETO
rename(var1_dummy = var1_dummy, dataset_dummy)

#D) rename(novo_nome = nome_antigo, dataset)
#INCORRETO
rename(var1_dummy = var1_dummy, dataset_dummy)

#QUESTAO 10 ----------------------------------------------------------------------------
# Se quisermos verificar quantas linhas e quantas colunas existem no dataset e, 
# no mesmo comando, verificar os nomes das variáveis, a melhor opção dentre os comandos
# a seguir é:
  
dim(starwars)
#somente dimensoes

names(starwars)
#somente nome das variaveis

group(starwars)
#could not find function

str(starwars)
#CORRETO. Exibe a estrutura interna de um objeto, funcoes, e listas.

#------------------------------------------------------------------------------------
#####################################################################################
#------------------------------------------------------------------------------------


