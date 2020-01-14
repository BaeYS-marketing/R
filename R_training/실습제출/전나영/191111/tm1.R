# 문제 1
library(tm)
library(proxy)
ss <- NULL
듀크 <- c("사과 포도 망고")
둘리 <- c("포도 자몽 자두")
또치 <- c("복숭아 사과 포도")
도우너 <- c("오렌지 바나나 복숭아")
길동<- c("포도 바나나 망고")
희동 <- c("포도 귤 오렌지")
ss <- c(듀크, 둘리, 또치, 도우너, 길동, 희동)
cps <- VCorpus(VectorSource(ss))
dtm <- DocumentTermMatrix(cps, control = list(wordLengths = c(1, Inf)))
as.matrix(dtm)
rownames(dtm) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
dist(com, method = "cosine")
## 좋아하는 과일이 가장 유사한 친구들은 듀크와 또치, 듀크와 길동 (0.1097)


# 문제2, 3
colSums(m)
## 학생들에게 가장 많이 선택된 과일은 포도 (5)
## 학생들에게 가장 적게 선택된 과일은 귤, 자두 ,자몽 (1)
