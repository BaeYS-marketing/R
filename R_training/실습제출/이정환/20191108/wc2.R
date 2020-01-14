myeong = readLines("yes24.txt")
head(myeong)

words = extractNoun(myeong)
words = unlist(words)
words = Filter(function(x) {nchar(x) >= 2}, words)
word_table = table(words)
real = sort(word_table, decreasing = T)

its_real = as.data.frame(real)
head(its_real)

result = wordcloud2(data = its_real, fontFamily = "궁서체")
result

saveWidget(result, "wc.html", title = "WORDCLOUD2 실습", selfcontained = F)
