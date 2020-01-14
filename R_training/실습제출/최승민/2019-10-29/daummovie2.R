site <-"https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="

movie.review <- NULL

for(i in 1:20){
  url <- paste(site, i, sep="")
  text <- read_html(url)
  score <- html_nodes(text, ".raking_grade > em")
  rating <- html_text(score)
  rating
  
  nodes <- html_nodes(text, ".desc_review")
  review <- html_text(nodes)
  review

  review <- html_text(nodes, trim=T)
  review
  review <- gsub("\t", "", review)
  review <- gsub("[\r\n]", "", review)
  review <- gsub("신고", "", review)
  
  page <- data.frame(rating, review)
  movie.review <- rbind(movie.review,page)
}

write.csv(movie.review, "daummovie2.csv")

