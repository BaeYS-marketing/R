
url2="https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen" #브라우저의 기능  R에서도 가능
text=read_html(url2)
text

nodes<-html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li> div > div.raking_grade > em")
rate<- html_text(nodes)
rate

nodes<- html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p")
review<-html_text(nodes, trim=T)
review

#gsub("없애고 싶은 것","바꾸고 싶은 것", 대상 )
review<- gsub("\t","",review)
review<- gsub("\t\n","",review)
review<- gsub("\n","",review)
review<- gsub("신고","",review)
review
page<-data.frame(title,review)
write.csv(page,"movie_reviews.csv3")




site="https://movie.naver.com/movie/point/af/list.nhn?&page=" #브라우저의 기능  R에서도 가능
movie.review=NULL
for (i in 1:100) {
  url<- paste(site,i,sep="")
  text=read_html(url, encoding = "CP949")
  nodes<-html_nodes(text, ".movie")
  title<- html_text(nodes)
  nodes<- html_nodes(text,".title")
  review<-html_text(nodes, trim=T)
  review<- gsub("\t","",review)
  review<- gsub("[\t\n]","",review)
  review<- gsub("신고","",review)
  page<-data.frame(title,review)
  movie.review<- rbind(movie.review,page)
}
write.csv(page,"movie_reviews2.csv")

getwd()

