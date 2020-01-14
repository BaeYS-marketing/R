url <- "https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen&page="
movie.review <- NULL

for(i in 1:20){
  url <- paste(url, i, sep="")
  text <- read_html(url, encoding="UTF-8")
  nodes <- html_nodes(text, "em.emph_grade")
  title <- html_text(nodes)
  nodes <- html_nodes(text, "p.desc_review")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\t", "",review)
  review <- gsub("[\r\n]","",review)
  review <- gsub("신고","",review)
  page <- data.frame(title, review)
  movie.review <- rbind(movie.review, page)
}

write.csv(movie.review, "daummovie2.csv")



