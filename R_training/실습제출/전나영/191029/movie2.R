site <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
movie.review <- NULL
for (i in 1:20) {
  url <- paste(site, i, sep = "")
  text <- read_html(url, encoding = "UTF-8")
  # 고객평점
  nodes <- html_nodes(text, ".emph_grade")
  ranking_grade <- html_text(nodes)
  # 리뷰글
  nodes <- html_nodes(text, ".desc_review")
  review <- html_text(nodes)
  review
  review <- gsub("\n", "", review)
  page <- data.frame(ranking_grade, review)
  movie.review <- rbind(movie.review, page)
}

write.csv(movie.review, "daummovie2.csv")