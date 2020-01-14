url <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text <- read_html(url, encoding = "UTF-8")
text

# 고객평점
nodes <- html_nodes(text, ".emph_grade")
ranking_grade <- html_text(nodes)
ranking_grade

# 리뷰글
nodes <- html_nodes(text, ".desc_review")
review <- html_text(nodes)
review
review <- gsub("\n", "", review)

page <- data.frame(ranking_grade, review)
write.csv(page, "daummovie1.csv")