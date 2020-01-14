library(rvest)

site1 <- "https://comic.naver.com/genre/bestChallenge.nhn?&page=" 
navercomic <- NULL

i <- 0
repeat {
  i = i+1 
  url8 <- paste(site1, i, sep="")
  read <- read_html(url8)
  page_next <- html_nodes(read, "#content > div.paginate > div > a.next")
  tags <- html_nodes(read, "div.challengeInfo > h6 > a") 
  comicName <- html_text(tags)
  tags1 <- html_nodes(read,"div.challengeInfo > div.summary" )
  comicSummary <- html_text(tags1, trim=T)
  tags2 <- html_nodes(read, "div.challengeInfo > div.rating_type > strong")
  comicGrade <- html_text(tags2)
  comic <- data.frame(comicName, comicSummary,comicGrade)
  navercomic <- rbind(navercomic, comic)
  if(is.na(page_next)==TRUE){
    break;
  }
}

write.csv(navercomic, "navercomic3.csv")

