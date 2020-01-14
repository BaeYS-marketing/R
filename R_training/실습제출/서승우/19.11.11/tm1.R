듀크<-c('사과 포도 망고')
둘리 <- c('포도 자몽 자두')
또치 <- c('복숭아 사과 포도')
도우너 <- c('오렌지 바나나 복숭아')
길동 <- c('포도 바나나 망고')
희동 <- c('포도 귤 오렌지')

fruit<-c(듀크, 둘리, 또치, 도우너, 길동, 희동)

cps <- VCorpus(VectorSource(fruit))
tdm <- DocumentTermMatrix(cps,
                          control=list(wordLengths = c(1, Inf)))
m<-as.matrix(tdm)
com <- m %*% t(m)
dist(com, method = "Euclidean")
#문제1 : 듀크&또치, 듀크&길동



cps <- VCorpus(VectorSource(fruit))
tdm <- TermDocumentMatrix(cps,
                          control=list(wordLengths = c(1, Inf)))
(m<-as.matrix(tdm))
rowSums(m)
#문제2 : 포도
#문제3 : 귤, 자두, 자몽



