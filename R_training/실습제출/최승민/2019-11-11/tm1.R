library(tm)

a <- readLines("tm2.txt")

Encoding(a) <- "UTF-8"

cps <- VCorpus(VectorSource(a))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))

tdm
as.matrix(tdm)
rst<-as.matrix(tdm)

rowSums(rst)

library(proxy)

cps <- Corpus(VectorSource(a))
dtm <- DocumentTermMatrix(cps)  #문서와 문서간의 유사도, 문서가 메인이다. 
as.matrix(dtm)
inspect(dtm)  #
# term frequency 알고리즘을 썻다 
(m <- as.matrix(dtm))
com <- m %*% t(m)
com

dist(com, method = "cosine")
# cos각도로 유사도 파악. 
dist(com, method = "Euclidean")

#(1) 1번, 3번/ 1번, 5번이 가장 유사
#(2) 가장 많이 선택 과일: 포도
#(3) 가장 적게 선택 과일: 귤, 자두, 자몽