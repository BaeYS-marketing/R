library(KoNLP)
library(dplyr)

word_data <- readLines("C:/Rstudy/3주차-다양한 함수 패키지와 시각화/11월 8일/yes24.txt",encoding="CP949")

useSejongDic()
word_data3 <- extractNoun(word_data)

undata <- unlist(word_data3)

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)#글자수 2개 이상만 !!

word_table2 <- table(undata2)

final <- sort(word_table2, decreasing = T)
final=data.frame(final)
final

library(wordcloud2)
setwd('C:/Rstudy/3주차-다양한 함수 패키지와 시각화/11월 8일')

# png(filename="wc.png", height=400, width=700, bg="black") 


wordcloud2(final)
# wordcloud2(final$undata2, final$Freq, 
#           random.order = FALSE, #큰 순서로 적용
#           min.freq = 2, 
#           rot.per = 0.1, #전체에서 10프로는 회전
#           scale = c(10, 1),
#           random.color=T,#제일 많이 등장한 폰트4 적게1
#           colors = rainbow(40),
#           word=circle)#컬러 선택
# 
# dev.off()
