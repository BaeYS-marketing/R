


site <-"https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen?page="
movie.review <-NULL
for(i in 1:20){
  url <-paste(site, i, sep="")
  text <- read_html(url, encoding="utf-8")
  nodes<- html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
  평점<-html_text(nodes)
  nodes <- html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li> div > p")
  리뷰 <-html_text(nodes,trim=TRUE)
  리뷰 <-gsub("\t","",리뷰)
  리뷰 <-gsub(" ","",리뷰)
  리뷰<-gsub("[\r\n]","",리뷰)
  page <-data.frame(평점,리뷰)
  movie.review <-rbind(movie.review, page)}
write.csv(movie.review, "daummovie2.csv")
