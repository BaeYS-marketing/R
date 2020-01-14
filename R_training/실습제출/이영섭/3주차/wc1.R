library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(dplyr)

windowsFonts(lett=windowsFont("함초롱바탕"))

basic <- readLines("data/공구.txt", encoding = "UTF-8")
# basic <- gsub("[[:punct:]]|[[:cntrl:]]|[[:digit:]]|[[:space:]]","",basic)
word_data <- sapply(basic, extractNoun, USE.NAMES = F)
word_data1 <- unlist(word_data)
word_data1 <- gsub("[[:punct:]]|[[:cntrl:]]|[[:digit:]]|[[:space:]]","", word_data1)
word_data1 <- Filter(function(x) {nchar(x) >= 2}, word_data1)
word_data2 <- gsub("공구해주세요","", word_data2)
word_data2 <- gsub("공구해주세","", word_data2)
word_data2 <- gsub("공구요","", word_data2)
word_data2 <- gsub("공구","", word_data2)
word_data2 <- gsub("[A-Za-z]","", word_data2)
word_data2 <- gsub("","", word_data2)

word_data3 <- as.data.frame(table(word_data2),stringsAsFactors = F)

colnames(word_data3) <- c('word','fre')

png(filename="wc.png ", height=400, width=700, bg="white")
wordcloud(word_data3$word, freq =word_data3$fre, 
          min.freq = 2, 
          random.order = F, 
          rot.per = 0.35, scale = c(4, 1), 
          random.color =T,
          colors=rainbow(20),
          family="lett"
)
dev.off()
# 
# 
# basic <- readLines("data/공구.txt", encoding = "UTF-8")
# # basic <- gsub("[[:punct:]]|[[:cntrl:]]|[[:digit:]]|[[:space:]]","",basic)
# word_data <- sapply(basic, extractNoun, USE.NAMES = F)
# word_data1 <- gsub("[[:punct:]]|[[:cntrl:]]|[[:digit:]]|[[:space:]]","", word_data)
# word_data1 <- Filter(function(x) {nchar(x) >= 2}, word_data1)
# word_data2 <- gsub("공구해주세요","", word_data2)
# word_data2 <- gsub("공구해주세","", word_data2)
# word_data2 <- gsub("공구요","", word_data2)
# word_data2 <- gsub("공구","", word_data2)
# word_data2 <- gsub("[A-Za-z]","", word_data2)
# 
# write(unlist(word_data2), "temp.txt")
# wordcount <- read.table("temp.txt")
# wordcount <- table(wordcount)
# final <- sort(wordcount, decreasing = T)
# head(final)
#   # word_data3 <- as.data.frame(table(wordcount),stringsAsFactors = F)
# 
# colnames(word_data3) <- c('word','fre')
# 
# png(filename="wc.png ", height=400, width=700, bg="white")
# wordcloud(names(wordcount), freq=wordcount,
#           min.freq = 2,
#           random.order = F,
#           rot.per = 0.35, scale = c(4, 1),
#           random.color =T,
#           colors=rainbow(20),
# )
# dev.off()
# 
# 
