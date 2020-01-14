site<-"https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
movie.review<-NULL
for(i in 1:20){
  url<-paste(site,i,sep="")
  text<-read_html(url, encoding="UTF-8")
  nodes<-html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
  rank<-html_text(nodes)
  nodes<-html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p")
  comment<-html_text(nodes)
  review<-html_text(nodes, trim=TRUE)
  page<-data.frame(title,review)
  movie.review<-rbind(movie.review,page)
}
write.csv(movie.review,"daummovie2.csv")