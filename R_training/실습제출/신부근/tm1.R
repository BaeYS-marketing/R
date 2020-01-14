install.packages("tm")
library(tm)
f<- c("사과 포도 망고",
           "포도 자몽 자두",
           "복숭아 사과 포도",
           "오렌지 바나나 복숭아",
           "포도 바나나 망고",
           "포도 귤 오렌지"
)

f1 <- VCorpus(VectorSource(f))
f2 <- TermDocumentMatrix(f1, 
                          control=list(wordLengths = c(1, Inf)))
f2
(fm <- as.matrix(f2))
colnames(fm) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
rowSums(fm)


fcom <- t(fm) %*% (fm) #행렬곱
fcom
dist(fcom, method = "cosine")

library(qgraph)
qgraph(fcom, labels=rownames(fcom), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(fcom)*800))

