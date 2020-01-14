url <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"

text <-read_html(url, encoding="utf-8")

nodes <- html_nodes(text," #mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
평점 <- html_text(nodes)
평점


nodes <- html_nodes(text," #mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li> div > p")
리뷰<- html_text(nodes)

리뷰<-gsub("\t","",리뷰)
리뷰 <-gsub(" ","",리뷰)
리뷰<-gsub("\n","",리뷰)
리뷰

review <- data.frame(평점,리뷰)
review
write.csv(review,"daummovie1.csv")


