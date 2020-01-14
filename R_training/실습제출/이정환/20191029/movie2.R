# 실습2
site = "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
daummovie2 = NULL
for (i in 1:20) {
  url = paste(site, i, sep='')
  text = read_html(url)
  grade = html_nodes(text, '#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em')
  grade = html_text(grade)
  review = html_nodes(text, '#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p')
  review = html_text(review, trim=T)
  df = data.frame(grade, review)
  daummovie2 = rbind(daummovie2, df)
}
write.csv(daummovie2, 'daummovie2.csv', row.names = F)
