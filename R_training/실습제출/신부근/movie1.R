url<-"https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text<-read_html(url)
text
#영화평점
html_text(html_nodes(text,"#mArticle > div.detail_movie.detail_rating > div.movie_detail > div.main_detail > ul > li.fst > div"))
grade<-html_text(html_nodes(text,".emph_grade"))
#영화리뷰
nodes<-html_nodes(text,".desc_review")
review<-html_text(nodes,trim=TRUE)
review
review<-gsub("\t","",review)
review<-gsub("\r\n","",review)
review<-gsub("\n","",review)
review<-gsub("신고","",review)

page<-data.frame(grade,review)
write.csv(page,"daummovie1.csv")
