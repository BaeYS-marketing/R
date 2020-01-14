#실습1

url <- read_html("https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen")
score <- html_text(html_nodes(url, ".emph_grade"))
review <- html_text(html_nodes(url, ".desc_review"), trim = T)
daummovie1 <- data.frame(score, review)

write.csv(daummovie1,"daummovie1.csv")