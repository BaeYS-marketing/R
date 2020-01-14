library(dplyr)

gong = readLines('C:/Rstudy/공구.txt', encoding="UTF-8")

gong_n = gsub('[[A-z]',"",gong_n)
gong_n = gsub('[0-9]',"",gong_n)
gong_n = gsub('[[:punct:]]',"",gong_n)

add_words <- c("공구","쭈꾸뽕")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)


word_data = extractNoun(gong_n)
word_data = unlist(word_data)
word_data2 = gsub("[[:space:]]","",word_data)
word_data2 = gsub("해주","",word_data2)
word_data2 = gsub("공구","",word_data2)
word_data2 = gsub("원해","",word_data2)
word_data2 = gsub("부탁","",word_data2)
word_data2 = gsub("별을쏘","",word_data2)
word_data2 = gsub("안하","",word_data2)
word_data3 = Filter(function(x) {nchar(x) >= 2}, word_data2 )
word_data3 = table(word_data3)
sort(word_data3, decreasing = T)

wordcloud(names(word_data3),freq=word_data3,scale=c(3,0.5),
          rot.per=0.35,min.freq=2,
          random.order=F,random.color=T,colors=rainbow(20))


