library(tm)
#(1)
names=c("듀크","둘리","또치","도우너","길동","희동")
fruit <- c("사과 포도 망고",
           "포도 자몽 자두",
           "복숭아 사과 포도",
           "오렌지 바나나 복숭아",
           "포도 바나나 망고",
           "포도 귤 오렌지"
)
cps <- VCorpus(VectorSource(fruit))
dtm <- DocumentTermMatrix(cps,control=list(wordLengths = c(1, Inf)))
m=as.matrix(dtm)
rownames(m) <- names
com = m %*% t(m) 
com
dist(com, method = "cosine")
dist(com, method = "Euclidean")
#듀크와 또치의 유사성, 길동과 듀크의 유사성이 높은 것으로 나타남
#(2)
m=t(m) #과일을 비교하기위해 형열 전환
m
com1= m %*% as.matrix(rep(1,6))
com1
#포도가 가장 많이 선택된 것을 확인 가능
#(3)
com
#귤 자두 자몽이 각 1회씩 선택되어 가작 적게 선택 됨