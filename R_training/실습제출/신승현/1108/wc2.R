library(KoNLP)
library(wordcloud)
library(selectr)
library(wordcloud2)
library("htmlwidgets") 

data <- readLines("data/yes24.txt")
noun_list <- extractNoun(data)
noun_vec <- unlist(noun_list)
noun_vec <- noun_vec[nchar(noun_vec)>1]
table(noun_vec)

noun_df <- data.frame(sort(table(noun_vec),decreasing = T))
colnames(noun_df) <- c('keyword', 'freq')
noun_df


result <- wordcloud2(noun_df)

saveWidget(result,"wc2.html",title="WORDCLOUD2 실습", selfcontained = F)
