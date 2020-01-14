url <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
navercomic <- NULL
i <- 0
repeat{
  i <- i + 1
  site <- paste(url,i,sep = "")
  text <- read_html(site, encoding = "utf-8")
  page_next <- html_nodes(text, "#content > div.paginate > div > a.next")
  node1 <- html_nodes(text,"#content  h6 > a")
  comicName <- html_text(node1,trim=T)
  comicName <- gsub("\r\n","",comicName)
  comicName <- gsub(" ","",comicName)
  node2 <- html_nodes(text,"#content div.challengeInfo > div.summary")
  comicSummary <- html_text(node2)
  node3 <- html_nodes(text,"#content div.challengeInfo > div.rating_type > strong")
  comicGrade <- html_text(node3)
  all_df <- data.frame(comicName,comicSummary,comicGrade)
  navercomic <- rbind(navercomic,all_df)
  if (is.na(page_next)==TRUE)
    break;
}
write.csv(navercomic,"navercomic2.csv")
