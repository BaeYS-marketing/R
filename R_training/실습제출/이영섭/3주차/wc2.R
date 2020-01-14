
yes <- readLines("data/yes24.txt")
word <- sapply(yes, extractNoun, USE.NAMES = F)
word <- unlist(word)
word <- table(word)

result <- wordcloud2(word,size=0.7,col="random-light",rotateRatio = 1)

library("htmlwidgets") # 없으면 설치
saveWidget(result,"wc2.html",title="WORDCLOUD2 실습", selfcontained = F)
