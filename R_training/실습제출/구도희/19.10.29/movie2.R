

site <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
daum.movie.reviews <- NULL
for(i in 1:20){
  url6 <- paste(site, i, sep="")
  txt1 <- read_html(url6)
  nodes2 <- html_nodes(txt1, ".emph_grade")
  title2 <- html_text(nodes2)
  nodes2 <- html_nodes(txt1, ".desc_review")
  review3 <- html_text(nodes2, trim=T)
  page2 <- data.frame(title2, review3)
  daum.movie.reviews <- rbind(daum.movie.reviews, page2)
}
write.csv(daum.movie.reviews, "daummovie2.csv")

