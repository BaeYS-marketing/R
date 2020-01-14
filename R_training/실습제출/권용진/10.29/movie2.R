site = "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
daummovie.review = NULL
for(i in 1:20){
  url = paste(site, i, sep="")
  text = read_html(url, encoding="utf-8")
  nodes = html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > div.raking_grade > em")
  grades = html_text(nodes)
  
  nodes = html_nodes(text, "#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li > div > p")
  review = html_text(nodes, trim = T)
  review = gsub("\t","",review)  #탭문자를 없애라
  review = gsub("\r\n","",review)
  review = gsub("\n","",review)
  page = data.frame(grades, review)
  daummovie.review = rbind(daummovie.review,page)
}
write.csv(daummovie.review, "daummovie2.csv")
