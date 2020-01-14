
#학생들에게 제시된 선택 보기 : 사과 포도 망고 자몽 귤 오렌지 바나나 복숭아 자두

#듀크 : 사과 포도 망고
#둘리 : 포도 자몽 자두
#또치 : 복숭아 사과 포도
#도우너 : 오렌지 바나나 복숭아
#길동 : 포도 바나나 망고
#희동 : 포도 귤 오렌지 


#tm 패키지와 proxy 패키지를 이용하여 다음에 제시된 결과를 R 코드로 해결해 본다.

#(1) 좋아하는 과일이 가장 유사한 친구들을 찾아본다.   
#(2) 학생들에게 가장 많이 선택된 과일을 찾아본다.
#(3) 학생들에게 가장 적게 선택된 과일을 찾아본다.

library(tm)
library(proxy)


fruit <- c("사과 포도 망고",
           "포도 자몽 자두",
          "복숭아 사과 포도",
          "오렌지 바나나 복숭아",
          "포도 바나나 망고",
          "포도 귤 오렌지")


#(1)번
dm <- DocumentTermMatrix(cps,control=list(wordLengths = c(1, Inf)))
dm

(m <- as.matrix(dm))
com <- m %*% t(m)
rownames(com) <-c("듀크","둘리","또치","도우너","길동","희동")
com
dist(com, method = "cosine")



cps <- VCorpus(VectorSource(fruit))
cps
tdm <- TermDocumentMatrix(cps,control=list(wordLengths = c(1, Inf)))
tdm
(m <- as.matrix(tdm))
df <- data.frame(m)

apply(df, 1, sum, na.rm=TRUE)

#(2),#(3)번
sort(apply(df, 1, sum, na.rm=TRUE))









