library(KoNLP)
library(dplyr)

word_data <- readLines("C:/Rstudy/book/공구.txt",encoding="UTF-8")
word_data

useSejongDic()
word_data3 <- extractNoun(word_data)
word_data3

add_words <- c("파쉬", "공동구매","해주","에어워셔","진공포장", "두유", "리큅", "쭈꾸뽕", "주세", "필립스", "다이", "캠프", "진공포장","단시","소이","우반","주물","에어","프라","롱기","보이","캠프","세트","워머","프라이")#분류 되지 않은 단어들을 딕셔너리에 추가하는 함수 #책참고
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

word_data3 <- extractNoun(word_data)
word_data3

undata <- unlist(word_data3)

undata=gsub("[[:digit:]]","",undata)
undata=gsub("[[:punct:]]","",undata)
undata=gsub("[[:punct:]]","",undata)
undata=gsub("공구","",undata)
undata=gsub("해주","",undata)
undata=gsub("필요해요","",undata)

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)#글자수 2개 이상만 !!


word_table2 <- table(undata2)

final <- sort(word_table2, decreasing = T)
final=data.frame(final)
final

library(wordcloud)
setwd('C:/Rstudy/3주차-다양한 함수 패키지와 시각화/11월 7일')

png(filename="wc.png", height=400, width=700, bg="black") 

wordcloud(final$undata2, final$Freq, 
          random.order = FALSE, #큰 순서로 적용
          min.freq = 2, 
          rot.per = 0.1, #전체에서 10프로는 회전
          scale = c(4, 1),
          random.color=T,#제일 많이 등장한 폰트4 적게1
          colors = rainbow(40))#컬러 선택

dev.off()


