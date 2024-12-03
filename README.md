# Algoritmos de *Machine Learning* de Classificação no R

## Descrição

Este projeto implementa vários algoritmos de *machine learning* de classificação na linguagem R num *dataset* sobre condições de crédito de pessoas para explorar as funcionalidades da linguagem.

## Pré-processamento

A base de dados foi processada e submetida aos algoritmos em três cenários diferentes:

1.  **Cenário 1**

    -   Tratamento de dados inconsistentes, faltantes e escalonamento de atributos

2.  **Cenário 2**

    -   Tratamento de dados inconsistentes e faltantes

3.  **Cenário 3**

    -   Sem realizar pré-processamento

## Resultados

A seguir são listados os resultados obtidos para cada algoritmo e os cenários utilizados no *dataset,* utilizando 75% dos dados para treinamento e 25% para teste.

### Cenário 1

| Algoritmo           | Acurácia |
|---------------------|----------|
| Naive Bayes         | 0.936    |
| Árvore Decisão      | 0.964    |
| Random Forest       | 0.98     |
| CN2 (Regras)        | 0.924    |
| KNN                 | 0.978    |
| Regressão Logística | 0.95     |
| SVM                 | 0.99     |
| Redes Neurais       | 0.994    |

### Cenário 2

| Algoritmo           | Acurácia |
|---------------------|----------|
| Naive Bayes         | 0.936    |
| Árvore Decisão      | 0.964    |
| Random Forest       | 0.98     |
| CN2 (Regras)        | 0.924    |
| KNN                 | 0.866    |
| Regressão Logística | 0.95     |
| SVM                 | 0.99     |
| Redes Neurais       | 0.996    |

### Cenário 3

| Algoritmo           | Acurácia |
|---------------------|----------|
| Naive Bayes         | 0.932    |
| Árvore Decisão      | 0.964    |
| Random Forest       | 0.99     |
| CN2 (Regras)        | 0.924    |
| KNN                 | 0.866    |
| Regressão Logística | 0.9459   |
| SVM                 | \-       |
| Redes Neurais       | 0.994    |

## Código

-   **Linguagem:** R
-   **Bibliotecas:** rpart, caTools, carot, RoughSets, tsutils, caret, class, e1071, OneR, randomForest, h2o.

## Discussões

Alguns algoritmos como o *Naive Bayes* não necessitam de escalonamentos de atributos, pois não utilizam conceitos de cálculos de distância onde a escala pode ser relevante e trazer um viés para atributos com escalas diferentes, dispensando essa etapa do pré-processamento. Para o algoritmo de Random Forest, foram utilizadas 30 árvores, em ntree = 30. Para o SVM o parâmetro kernel = radial e cost = 5.0. Alguns algoritmos não puderem ser executados em todos os cenários devido a limitações como as suas propriedades e implementações das bibliotecas que foram utilizadas.

## Resultados com Validação Cruzada

A planilha "TestesEstatísticos.xlsx" mostra os resultados obtidos realizando validação cruzada para o cenário 1, com 30 iterações para cada algoritmo. O arquivo "Testes Estatísticos.pdf" (imagem a seguir) mostra os resultados para os testes de Friedman e Niemenyi, apontando que não houve diferença estatística considerável entre *Random Forest* e Regras, colocando-os como os mais promissores para a base de dados explorada.

![Testes Estatísticos](Testes%20Estatísticos%20Modelos.png)
