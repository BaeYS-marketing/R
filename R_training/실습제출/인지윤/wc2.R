library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(dplyr)

word <- readLines("c:/Rstudy/data/yes24.txt")
head(word)

word_data <- extractNoun(word)
head(word_data)

undata <- unlist(word_data)
undata <- gsub("[[:punct:]]","",undata)
undata <- gsub("[0-9]","",undata)
undata <- gsub("[A-z]","",undata)
undata <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <=5}, undata)
word_table <- table(undata)
final <- sort(word_table, decreasing = T)
final2 <- as.data.frame(final)

png(filename="wc.png", height=400, width=700, bg="white")

windowsFonts(lett=windowsFont("휴먼옛체"))
wordcloud2(final2)
