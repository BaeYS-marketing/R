fruity = c("사과 포도 망고",
"포도 자몽 자두",
"복숭아 사과 포도",
"오렌지 바나나 복숭아",
"포도 바나나 망고",
"포도 귤 오렌지")

cps <- VCorpus(VectorSource(fruity))
dtm <- DocumentTermMatrix(cps,control=list(wordLengths = c(1, Inf))) 
m = as.matrix(dtm)
rownames(m) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")

colSums(m) # 가장 좋아하는 과일은 포도, 가장 덜 좋아하는 과일은 귤, 자두, 자몽

inspect(dtm)

com <- m %*% t(m) #행렬 곱
com

dist(com, method = "cosine")
dist(com, method = "Euclidean") #또치 듀크, 길동 듀크가 가장 유사