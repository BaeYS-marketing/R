url<-"https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text<-read_html(url, encoding="UTF-8")
nodes<-html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
rank<-html_text(nodes)
rank

nodes<-html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p")
comment<-html_text(nodes)
comment
review<-html_text(nodes,trim=TRUE)
review

page<-data.frame(rank, review)
write.csv(page, "daummovie1.csv")