url = "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text = read_html(url, encoding="CP949")
text
#영화제목
nodes = html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
grades = html_text(nodes)
grades

#영화리뷰
nodes = html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p")
review = html_text(nodes, trim = T)
review
review = gsub("\t","",review)  
review = gsub("\r\n","",review)
review = gsub("\n","",review)
page = data.frame(grades, review)
write.csv(page, "daummovie1.csv")
