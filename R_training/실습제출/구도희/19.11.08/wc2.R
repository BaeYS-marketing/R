library("htmlwidgets") # 없으면 설치
library(KoNLP)
library(wordcloud2)
useSystemDic()
useSejongDic()
useNIADic()

yes <- readLines("yes24.txt")
yyes <- unlist(extractNoun(yes))
yyes
yyes2 <- Filter(function(x) {nchar(x) >= 2}, yyes)

yyes_table <- table(yyes2)

yfinal <- sort(yyes_table, decreasing = T)
wordcloud2(yfinal, size=0.5, col="random-dark",fontFamily = "HY견고딕", minSize=1)
result <- wordcloud2(yfinal, size=0.5, col="random-dark",fontFamily = "HY견고딕", minSize=1)
saveWidget(result,"wc.html",title="WORDCLOUD2 실습", selfcontained = F)