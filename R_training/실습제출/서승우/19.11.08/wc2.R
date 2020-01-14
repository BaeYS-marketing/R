library('htmlwidgets')

review<-readLines('data/yes24.txt')
review<-review[review!=""]
useSejongDic()
review1 <- extractNoun(review)
review1<-unlist(review1)
review2 <- Filter(function(x) {nchar(x) >= 2}, review1)
review3 <- table(review2)
final<-sort(review3, decreasing=T)
final<-as.data.frame(final)
head(final)

result<- wordcloud2(final, size=0.5,col="random-dark")
saveWidget(result,'wc2.html',title='WORLDCLOUD2 실습', selfcontained=F)