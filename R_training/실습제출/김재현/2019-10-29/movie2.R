#문제2
set <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
daummovie2 <- NULL
for(i in 1:20) {
  url <- paste(set, i, sep="")
  text <- read_html(url)
  score <- html_text(html_nodes(text, ".emph_grade"))
  review <- html_text(html_nodes(text, ".desc_review"), trim = T)
  part <- data.frame(score, review)
  daummovie2 <- rbind(daummovie2, part)
}
write.csv(daummovie2,"daummovie2.csv")
