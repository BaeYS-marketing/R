url <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text <- read_html(url)
text
#영화리뷰
nodes<-html_nodes(text,".desc_review")
review<-html_text(nodes, trim=T)
review<-gsub("\t", "" ,review)
review<-gsub("[\r\n]", "" ,review)
review<-gsub("\n", "" ,review)
#영화평점
nodes<-html_nodes(text,".emph_grade")
grade<-html_text(nodes, trim=T)
grade<-gsub("\t", "" ,grade)
grade<-gsub("[\r\n]", "" ,grade)
grade<-gsub("\n", "" ,grade)
page <- data.frame(grade,review)
write.csv(page, "daummovie1.csv")
