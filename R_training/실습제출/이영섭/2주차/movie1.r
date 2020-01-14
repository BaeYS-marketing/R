#실습 1
url <- "https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen"
text <- read_html(url,encoding = "UTF-8")
score <- text %>% html_nodes(".emph_grade") %>% html_text()
review <- text %>% html_nodes(".desc_review") %>% html_text(trim = T)
review <- gsub("\r","",review)
movie <- data.frame(score, review)
write.csv(movie,"daummovie1.csv")

#실습 2
url2 <- "https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen&page="
movie_2 <- NULL

for (i in 1:20){
  site <- paste(url2,i,sep="")
  score_2 <- read_html(site,encoding = "UTF-8") %>% html_nodes(".emph_grade") %>% html_text()
  review_2 <- read_html(site,encoding = "UTF-8") %>% html_nodes(".desc_review") %>% html_text(trim=T)
  review_2 <- gsub("\r","",review_2)
  tem <- data.frame(score_2,review_2)
  movie_2 <- rbind(movie_2 ,tem)
}
write.csv(movie_2,"daummovie2.csv")
