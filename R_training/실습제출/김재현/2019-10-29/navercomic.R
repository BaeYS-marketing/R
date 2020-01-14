#1page
url <- "https://comic.naver.com/genre/bestChallenge.nhn"
text <- read_html(url)
comicName <- html_text(html_nodes(text, "div.challengeInfo > h6 > a"), trim =T)
comicSummary <- html_text(html_nodes(text, "div.challengeInfo > div.summary"), trim =T)
comicGrade <- html_text(html_nodes(text, "div.challengeInfo > div.rating_type > strong"), trim =T)
n.comic.prac <- data.frame(comicName,comicSummary,comicGrade)
write.csv(n.comic.prac, "prac.csv")

# inf-page
rm(list=ls())
a <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
n.comic.prac = NULL
i <- 0
repeat {
  i = i+1
  url <- paste(a, i, sep="")
  text <- read_html(url)
  comicName <- html_text(html_nodes(text, "div.challengeInfo > h6 > a"), trim =T)
  comicSummary <- html_text(html_nodes(text, "div.challengeInfo > div.summary"), trim =T)
  comicGrade <- html_text(html_nodes(text, "div.challengeInfo > div.rating_type > strong"), trim =T)
  set <- data.frame(comicName,comicSummary,comicGrade)
  n.comic.prac <- rbind(n.comic.prac, set)
  if(length(comicName)<24){
    break;
  }
}
write.csv(n.comic.prac, "navercomic.csv")
View(n.comic.prac)
