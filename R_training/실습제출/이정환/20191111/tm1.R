fruit = c("사과 포도 망고",
          "포도 자몽 자두",
          "복숭아 사과 포도",
          "오렌지 바나나 복숭아",
          "포도 바나나 망고",
          "포도 귤 오렌지")

cps = VCorpus(VectorSource(fruit))
tdm = TermDocumentMatrix(cps,
                          control=list(wordLengths = c(1, Inf)))
m = as.matrix(tdm)
colnames(m) = c("듀크", "둘리", "또치", "도우너", "길동", "희동")

# (1)
com = t(m) %*% m
dist(com, method = "Euclidean")
 # 듀크랑 또치, 듀크랑 길동

# (2)
rowSums(m)
 # 포도 : 5명

# (3)
rowSums(m)
 # 귤, 자두, 자몽 : 1명