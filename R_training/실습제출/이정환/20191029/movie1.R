# 실습1
url = "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text = read_html(url)
grade = html_nodes(text, '#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em')
grade = html_text(grade)

review = html_nodes(text, '#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p')
review = html_text(review, trim=T)
review

daummovie1 = data.frame(grade, review)
write.csv(daummovie1, 'daummovie1.csv', row.names = F)
