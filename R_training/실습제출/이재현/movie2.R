site <- "https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen&page="
movie.review <- NULL
for(i in 1:20){
  url <- paste(site, i, sep="")
  text <- read_html(url, encoding="UTF-8")
  nodes <- html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
  point <- html_text(nodes)
  nodes <- html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\t","",review)
  review <- gsub("[\r\n]","",review)
  review <- gsub("신고","",review)
  page <- data.frame(point, review)
  movie.review <- rbind(movie.review, page)
}
write.csv(movie.review, "daummovie2.csv")