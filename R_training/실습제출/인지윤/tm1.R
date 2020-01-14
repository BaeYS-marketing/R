library(proxy)
fruit <- NULL
듀크 <- c("사과 포도 망고")
둘리 <- c("포도 자몽 자두")
또치 <- c("복숭아 사과 포도")
도우너 <- c("오렌지 바나나 복숭아")
길동 <-c("포도 바나나 망고")
희동 <- c("포도 귤 오렌지")
fruit <- c(듀크,둘리,또치,도우너,길동,희동)

fruit <- c("사과 포도 망고",
           "포도 자몽 자두",
           "복숭아 사과 포도",
           "오렌지 바나나 복숭아",
           "포도 바나나 망고",
           "포도 귤 오렌지")


cps <- VCorpus(VectorSource(fruit))
dtm <- DocumentTermMatrix(cps,
                          control=list(wordLengths = c(1, Inf)))
m <- as.matrix(dtm)
rownames(m) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")


# (1) -------------------------------------------
# 좋아하는 과일이 가장 유사한 친구들을 찾아본다.
com <- m %*% t(m)
com
rownames(com) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")

dist(com, method = "cosine") #거리가 가까울 수록 유사도 높음
# dist(com, method = "Euclidean") #거리가 가까울 수록 유사도 높음

library(qgraph)
qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))

# 결과: 듀크-또치, 듀크-길동 가 유사함


# (2) -------------------------------------------
# 학생들에게 가장 많이 선택된 과일을 찾아본다.

head(sort(colSums(m), decreasing=T), 1)

# 결과 : 포도


# (3) -------------------------------------------
# 학생들에게 가장 적게 선택된 과일을 찾아본다.

sort(colSums(m))

# 결과 : 귤,자두,자몽
