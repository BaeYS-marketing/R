#실습1
url <- "https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen"
text <- read_html(url)

html_text(html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li.fst > div"))

#영화평점
nodes <- html_nodes(text, ".emph_grade")
grade <- html_text(nodes)
grade
#영화리뷰
nodes <- html_nodes(text, ".desc_review")
review <- html_text(nodes, trim=TRUE)
review <- gsub("\t", "", review)
review <- gsub("\r\n", "", review)
review <- gsub("\n","", review)
review <- gsub("\r", "", review)
review

page <- data.frame(grade, review)
write.csv(page, "c:/Rstudy/daummovie1.csv")
