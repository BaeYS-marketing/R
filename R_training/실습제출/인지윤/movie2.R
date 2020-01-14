site <- "https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen&page="
grade.review <- NULL

for (i in 1:20) {
  url <- paste(site, i, sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, ".emph_grade")
  grade <- html_text(nodes)
  nodes <- html_nodes(text, ".desc_review")
  review <- html_text(nodes, trim=TRUE)
  review <- gsub("\t", "", review)
  review <- gsub("\r\n", "", review)
  review <- gsub("\n","", review)
  review <- gsub("\r", "", review)
  page <- data.frame(grade, review)
  grade.review <- rbind(grade.review, page)
}
write.csv(grade.review, "c:/Rstudy/daummovie2.csv")
