getwd()
data <- readLines('data/yes24.txt',encoding = 'CP949')



is.vector(data)


yesbook <- extractNoun(data)

yesbook <- unlist(yesbook)

yesdata<-sort(table(yesbook),decreasing = T)   #이걸 안하면 글자 크기 중앙에X

yesdata <- as.data.frame(yesdata)

yesdata



result<-wordcloud2(yesdata,
           rotateRatio = 1.5,
           fontFamily = '나눔바른고딕',
           col="random-dark"
           )



saveWidget(result,"wc2.html",title="WORDCLOUD2 실습", selfcontained = F)







