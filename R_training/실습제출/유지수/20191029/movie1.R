url <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text <- read_html(url, encoding = "utf-8")

nodes <- html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
score <- html_text(nodes)

nodes <- html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p")
review <- html_text(nodes)
review <- gsub("\n","",review)
review <- gsub(" ","",review)
review

d_page <- data.frame(score,review)
write.csv(d_page, "daummovie1.csv")
