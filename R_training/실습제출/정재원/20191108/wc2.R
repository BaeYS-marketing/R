library(KoNLP)
library(wordcloud2)

yes24 = readLines('yes24.txt')

useSejongDic()
word_data <- extractNoun(yes24)
word_data = unlist(word_data)
word_data = gsub('[[:digit:]]',"",word_data)
word_data2 = Filter(function(x) {nchar(x) >= 2}, word_data )
word_data3 = table(word_data2)
word_data3 = sort(word_data3, decreasing = T)

result = wordcloud2(word_data3,fontFamily = '고딕', minSize = 2)

library("htmlwidgets") 
saveWidget(result,"wc.html",title="WORDCLOUD2 실습", selfcontained = F)
