## 실습1

url <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen"
text <- read_html(url)
text
# 고객 평점
nodes <- html_nodes(text,".emph_grade")
grade <- html_text(nodes)
grade
# 리뷰
nodes <- html_nodes(text,".desc_review")
review <- html_text(nodes, trim=TRUE)
review
review <- gsub("\t","",review)  
review <- gsub("\r\n","",review)
review <- gsub("\n","",review)
review <- gsub("신고","",review)

page <- data.frame(grade, review)
write.csv(page, "daummovie1.csv")

## 실습2
site <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
movie.review <-NULL
for(i in 1:20){
  url <- paste(site,i,sep="")
  text <- read_html(url)
  nodes <- html_nodes(text,".emph_grade")
  grade <- html_text(nodes)
  nodes <- html_nodes(text,".desc_review")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\t","",review)
  review <- gsub("[\r\n]","",review)
  review <- gsub("신고","",review)
  page <- data.frame(grade, review)
  movie.review <- rbind(movie.review,page)
}
write.csv(movie.review, "daummovie2.csv")