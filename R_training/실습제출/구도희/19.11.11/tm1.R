#학생들에게 제시된 선택 보기 : 사과 포도 망고 자몽 귤 오렌지 바나나 복숭아 자두

#듀크 : 사과 포도 망고
#둘리 : 포도 자몽 자두
#또치 : 복숭아 사과 포도
#도우너 : 오렌지 바나나 복숭아
#길동 : 포도 바나나 망고
#희동 : 포도 귤 오렌지 

library(tm)
library(proxy)

# 1
fruits <- c("사과 포도 망고", "포도 자몽 자두", "복숭아 사과 포도",
        "오렌지 바나나 복숭아", "포도 바나나 망고",
        "포도 귤 오렌지")


ff1 <- VCorpus(VectorSource(fruits))
ff_tdm <- DocumentTermMatrix(ff1, control=list(wordLengths = c(1, Inf)))
ff_tdm
(mm <- as.matrix(ff_tdm))
rownames(mm) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
mm

comm <- mm %*% t(mm)
comm
dist(comm)


 # 가장 유사한 친구들: 듀크-길동 / 또치 =듀크

# 2
ff2 <- VCorpus(VectorSource(fruits))
ff2_tdm <-TermDocumentMatrix(ff2, control=list(wordLengths = c(1, Inf)))
ff2_tdm
(mm2 <- as.matrix(ff2_tdm))
colnames(mm2) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
mm2
head(sort(rowSums(mm2),decreasing = T),1)

 # 가장 많이 선택된 과일: 포도

# 3
rowSums(mm2)
 # 가장 적게 선택된 과일: 귤, 자몽, 자두
tail(sort(rowSums(mm2),decreasing = T))
