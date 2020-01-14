library(KoNLP)
useSejongDic()
library(wordcloud2)
library(htmlwidgets)

word_data <- readLines("yes24.txt")

word_data <- extractNoun(word_data)
undata <- unlist(word_data)
undata <- Filter(function(x) {nchar(x) >= 2}, undata)

word_table <- table(undata)
word_table

final <- sort(word_table, decreasing = TRUE)
final <- as.data.frame(final)
final

result <- wordcloud2(final, fontFamily = "휴먼옛체")
saveWidget(result,"wc.html",title="WORDCLOUD2 실습", selfcontained = F)
