# 문제2
# 고객평점20페이지
site <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
movie.review <- NULL
for(i in 1:20) {
  url <- paste(site,i,sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, ".emph_grade")
  grade <- html_text(nodes)
  nodes <- html_nodes(text, ".desc_review")
  review <- html_text(nodes, trim=TRUE)
  movie_exit_20 <- data.frame(grade,review)
  movie.review <- rbind(movie.review, movie_exit_20)
}
write.csv(movie.review, "daum_movie2.csv")



site <- "http://movie.naver.com/movie/point/af/list.nhn?page="
movie.review <- NULL
for(i in 1:100) {
  url <- paste(site,i,sep="")
  text <- read_html(url, encoding="CP949")
  nodes <- html_nodes(text, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text, ".title")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\t","",review)
  review <- gsub("[\r\n]","",review)
  review <- gsub("신고","",review)
  page <- data.frame(title,review)
  movie.review <- rbind(movie.review, page)
}
write.csv(movie.review, "movie_reviews2.csv")