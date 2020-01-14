library("htmlwidgets")

text <- readLines("yes24.txt")
ex_text <- extractNoun(text)

ex_text_un <- unlist(ex_text)


#data1 <- ifelse(nchar(ex_text_un) > 1, ex_text_un, NA)
#data2 <- data1[is.na(data1) == 0]
#data3 <- data.frame(data2)

#result <- data3 %>% group_by(data2) %>% summarise(count = n())

#windowsFonts(lett=windowsFont("휴먼옛체"))

#wordcloud(result$data2, result$count, 
 #         random.order = FALSE, 
  #        rot.per = 0.2,
   #       family = "lett",
    #      colors = rainbow(7), 
     #     random.color = T,
      #    )

x <- Filter(function(x) {nchar(x) >= 2} ,ex_text_un)
y <- table(x)
z <- sort(y, decreasing = T)
t <- wordcloud2(z, size=0.5, col="random-dark", fontFamily = "휴먼옛체", minSize = 1)

saveWidget(t,"wc.html",title="WORDCLOUD2 실습", selfcontained = F)

  