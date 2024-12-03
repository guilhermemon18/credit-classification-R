# Leitura da base de dados
base = read.csv('credit_data.csv')

# Apaga a coluna clientid
base$clientid = NULL

# Valores inconsistentes
base$age = ifelse(base$age < 0, 40.92, base$age)

# Valores faltantes
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

# Escalonamento
base[, 1:3] = scale(base[, 1:3])

#Enconde da classe alvo:
#transforma a classse alvo em fatores,
#aparentemente na versão mais recente do R (4.0+) já faz sozinho.
base$default =  factor(base$default, levels = c(0,1))

# Divisão entre treinamento e teste
library(caTools)
set.seed(1)
divisao = sample.split(base$income, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)

#Biblioteca com o algoritmo Naive Bayes:
library(e1071)

#Criando o classificador:
classificador = naiveBayes(x = base_treinamento[-4], y = base_treinamento$default)
print(classificador)

#fazendo as previsões:
previsoes = predict(classificador, newdata = base_teste[-4])
matriz_confusao = table(base_teste[, 4], previsoes)
print(matriz_confusao)
# install.packages('caret')
library(caret)
confusionMatrix(matriz_confusao)
