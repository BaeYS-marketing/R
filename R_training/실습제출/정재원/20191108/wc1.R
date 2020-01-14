library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(dplyr)

windowsFonts(lett=windowsFont("휴먼둥근헤드라인"))

words <- readLines("yes24.txt", encoding = "UTF-8")
words <- sapply(words, extractNoun, USE.NAMES = F)
words <- unlist(words)
word_data <- gsub("[[:punct:][:cntrl:][:digit:][:space:]]","", words)
word_data <- Filter(function(x) {nchar(x) >= 2}, word_data)
word_data <- gsub("공구.*","", word_data)
word_data <- gsub("공구","", word_data)
word_data <- gsub("[A-Za-z]","", word_data)
word_data <- gsub("","", word_data)
word_data_c <- as.data.frame(table(word_data),stringsAsFactors = F)
wordcloud(word_data_c$word_data , freq =word_data_c$Fre, 
          min.freq = 2, 
          random.order = F, 
          rot.per = 0.35, scale = c(4, 1), 
          random.color =T,
          colors=rainbow(20),
          family="lett"
)