library(KoNLP)
library(dplyr)
library(stringr)

useSystemDic()
useSejongDic()
useNIADic()

word_data <- readLines("book/공구.txt")
word_data

getOption("encoding")
Encoding(word_data)<-'UTF-8'
head(word_data)

#word_data <- gsub("[[:punct:][:digit:][:lower:][:upper:]]","", word_data)
word_data <- str_replace_all(word_data, "[^[가-힣]]", "")
word_data <- str_replace_all(word_data, "//d", "")
word_data <- str_replace_all(word_data, "/d", "")
word_data <- str_replace_all(word_data, "공구", "")
word_data <- str_replace_all(word_data, "해주", "")
word_data <- str_replace_all(word_data, "세요", "")
word_data <- str_replace_all(word_data, "부탁", "")
word_data <- str_replace_all(word_data, "원해", "")
word_data <- str_replace_all(word_data, "요", "")
word_data <- word_data[word_data!=""]

head(word_data)

useSystemDic()
useSejongDic()
useNIADic()
?extractNoun

word_data2 <- extractNoun(word_data)
word_data2 %>%head()

undata <- unlist(word_data2)
undata %>% 
  head()

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)

final <- sort(word_table2, decreasing = T)

head(final, 10)

wordcloud(names(final), final, 
          min.freq = 2, # 2이상만 고르겠다. 
          random.order = FALSE, #큰건 큰대로 
          rot.per = 0.3, scale = c(4, 1), #전체의 10%는 회전,
          # 제일 많이 등장하면 4, 적은 건 1
          colors = palette(rainbow(7)))
#png("wc.png")

