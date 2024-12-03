#Lê o arquivo da base de dados:
base = read.csv('credit_data.csv')
#Remove o atributo (variável) ID do cliente:
base$clientid = NULL
summary(base)

#Tratamento de valores inconsistentes:
idade_invalida = base[base$age < 0 & !is.na(base$age), ]
# 1ª apagar a coluna inteira
base$age = NULL

# 2ª Apagar somentes os registros com problema (idade negativa)

base = base[base$age > 0, ]

# 3º Preencher os dados manualmente:

# 4º Calcular a média da idade:
mean(base$age, na.rm = TRUE)
media_idades = mean(base$age[base$age > 0], na.rm = TRUE)
base$age = ifelse(base$age < 0, media_idades, base$age)

#Tratamento de valores faltantes:
#Captura os registros com idade NA:
base[is.na(base$age), ]
#Substitui os valores NA pela média:
base$age = ifelse(is.na(base$age), media_idades, base$age)

#Escalonamento de atributos: Colocá-los na mesma escala.
#Colocar os atributos income e age na mesma escala

#Padronização: mais robusta contra outliers e mais recomendada: x é variável a ser escalada:
# x = x - média(x) / desvio padrão (x)

#Padronização (Standardistaion): mais robusta contra outliers e mais recomendada: x é variável a ser escalada:
# x = (x - média(x)) / desvio padrão (x)

#Normalização (Normalization): x é variável a ser escalada:
# x = (x - mínimo(x)) / (máximo(x) - mínimo(x))
#Realiza o escalonamento em todos os atributos menos na variável alvo:
base[, 1:3] = scale(base[, 1:3])

install.packages('caTools')
library(caTools)
set.seed(1)
divisao = sample.split(base$default, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)
