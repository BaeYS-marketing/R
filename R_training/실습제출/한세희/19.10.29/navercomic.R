# 문제4
#comicname, comicSummary, comicGrade -> data.frame 만들기
#navercomic.csv / navercomic.R
#모든페이지 크롤링, 스크래핑

site <- "https://comic.naver.com/genre/bestChallenge.nhn"
text <- read_html(site)
text
nodes <- html_nodes(text, "h6.challengeTitle > a")  #크롬에서 알려준대로 했는데 안되면...부모의 클래스속성 > a
comicName <- html_text(nodes, trim=T)
comicName
nodes <- html_nodes(text, ".summary")
comicSummary <- html_text(nodes, trip=T)
comicSummary
nodes <- html_nodes(text, "#content div.challengeInfo > div.rating_type > strong")
nodes
comicGrade <- html_text(nodes)
comicGrade
navercomic <- data.frame(comicName, comicSummary, comicGrade)
write.csv(navercomic, "navercomic.csv")


site <- "https://movie.daum.net/moviedb/grade?movieId=121137&type=netizen&page="
movie.review <- NULL
for(i in 1:*) {
  url <- paste(site,i,sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, ".emph_grade")
  grade <- html_text(nodes)
  nodes <- html_nodes(text, ".desc_review")
  review <- html_text(nodes, trim=TRUE)
  movie_exit_20 <- data.frame(grade,review)
  movie.review <- rbind(movie.review, movie_exit_20)
}
write.csv(movie.review, "daum_movie2.csv")