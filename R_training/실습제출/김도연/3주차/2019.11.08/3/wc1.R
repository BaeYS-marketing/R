#제공된 “공구.txt” 파일의 내용을 읽고 명사만 뽑아낸 많이 등장한 단어 순으로 다음과 같이 워드클라우딩 하는 
#R 코드를 작성하여 wc1.R 로 그리고 워드 클라우딩 결과는 wc.png 로 저장하여 제출하시오. 이미지이므로 
#기본 그래프를 저장하는 방법과 동일하다. 가장 많이 등장한 단어의 크기가 가장 크게 처리하고 점점 작아지게 하면 되며 칼라나 폰트의 종류 그리고 크기는 다르게 하더라도 출력되는 단어의 구성은 최대한 맞춰본다. 

library(KoNLP)

words= NULL
useSejongDic()
words <- readLines("data/공구.txt")
words
Encoding(words)<-'UTF-8'
words
words = gsub("[^[가-힣]]", "", words)
words = gsub("[[:digit:]]", "", words)
words = gsub("[[:punct:]]", "", words)
words
word_data2 <- extractNoun(words)
word_data2
undata <- unlist(word_data2)
word_data3 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_data3
word_table <- table(word_data3)
word_table

png(filename="wc.png", height=200, width=400, bg="white") # 출력을 png파일로 설정
wordcloud(names(word_table), word_table, 
          min.freq = 2, # 2번 중복 된 것만 wordcloud하겠다. 
          random.order = FALSE, 
          rot.per = 0.1, scale = c(5, 1), #빈도에 비례해서 4~1 크기로
          colors = rainbow(7))


dev.off()
