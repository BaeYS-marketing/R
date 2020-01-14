library(tm)
library(proxy)


fruit <- c("사과 포도 망고",
           "포도 자몽 자두",
           "복숭아 사과 포도",
           "오렌지 바나나 복숭아",
           "포도 바나나 망고",
           "포도 귤 오렌지"
)



cps <- VCorpus(VectorSource(fruit))
tdm <- TermDocumentMatrix(cps)  
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))

tdm
(m <- as.matrix(tdm))


colnames(m) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")

#문제1 
#유사값, 많이 선택된 과일 뽑을 수 있음.
com <- m %*% t(m)       
com

library(qgraph)
qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))

#유사성 측정 '유클리디안 거리'


#문제2

head(sort(rowSums(m), decreasing=T), 1)


#문제3

tail(sort(rowSums(m), decreasing=T), 3)





