library(KoNLP)
library(wordcloud)
useSejongDic()
# install.packages("tm")
library(tm)
library(proxy)
library(dplyr)
library(qgraph)


fruit <- c("사과 포도 망고", 
           "포도 자몽 자두",
           "복숭아 사과 포도",
           "오렌지 바나나 복숭아",
           "포도 바나나 망고",
           "포도 귤 오렌지")

cps <- VCorpus(VectorSource(fruit))
tdm <- TermDocumentMatrix(cps, control=list(wordLengths = c(1, Inf)))
m <- as.matrix(tdm)
colnames(m) <- c('듀크','둘리','또치','도우너','길동','희동')

com <-  t(m) %*% m
com


# 문제 1
dist(com, method = "Euclidean")
min(dist(com, method = "Euclidean"))

qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))
#듀크와 또치, 듀크와 길동이 가장 유사하다.

# 문제 2
fruit_sum <- apply(m,1,sum)
fruit_sum[fruit_sum==max(fruit_sum)]

# 문제 3
fruit_sum[fruit_sum==min(fruit_sum)]

