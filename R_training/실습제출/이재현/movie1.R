url <- "https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen"
text <- read_html(url, encoding="UTF-8")

#영화 평점
nodes <- html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
point <- html_text(nodes)
point

#영화 리뷰
nodes <- html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p")
review <- html_text(nodes, trim=TRUE)
review <- gsub("\t","",review)
review <- gsub("\r\n","",review)
review <- gsub("\n","",review)
review <- gsub("신고","",review)

page <- data.frame(point, review)
write.csv(page,"movie1.csv")