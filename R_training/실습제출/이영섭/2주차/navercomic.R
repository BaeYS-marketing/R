library(dplyr)
library(rvest)

site <- 'https://comic.naver.com/genre/bestChallenge.nhn?page='
i=1
DataFrame = NULL

while (1) {
  i = i+1
  url <- paste0(site,i)
  comicName <- read_html(url) %>% html_nodes(".challengeInfo > .challengeTitle") %>% html_text()
  comicSummary <- read_html(url) %>% html_nodes(".challengeInfo > .summary") %>% html_text()
  comicGrade <- read_html(url) %>% html_nodes(".challengeInfo > .rating_type") %>% html_text()
  comicName <- gsub("\n","",comicName)
  comicName <- gsub("\r","",comicName)
  comicName <- gsub("  ","",comicName)
  comicGrade <- gsub("\n","",comicGrade)
  comicGrade <- gsub("\r","",comicGrade)
  comicGrade <- gsub("   ","",comicGrade)
  comicGrade <- gsub("평점","",comicGrade)
  tem <- data.frame(comicName,comicSummary,comicGrade)
  DataFrame <- rbind(DataFrame,tem)
  if (!length(read_html(url) %>% html_nodes("#content > div.paginate > div > a.next > span.cnt_page")%>% html_text())==1) break
}
write.csv(DataFrame,"navercomic.csv")