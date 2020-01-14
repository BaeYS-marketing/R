site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
navercomic <- NULL
i <- 1
repeat{

url <- paste(site, i, sep="")
text <- read_html(url, encoding="UTF-8")


#만화 제목
nodes <- html_nodes(text,"div.challengeInfo > h6 > a")
comicName <- html_text(nodes)
comicName <- html_text(nodes, trim=TRUE)
comicName <- gsub("\n","",comicName)
comicName <- gsub("\t","",comicName)
comicName <- gsub("[\r\n]","",comicName)
comicName <- gsub("신고","",comicName)


#만화 요약
nodes <- html_nodes(text, "div.challengeInfo > div.summary")
comicSummary <- html_text(nodes)


#만화 등급
nodes <- html_nodes(text, " div.challengeInfo > div.rating_type > strong")
comicGrade <- html_text(nodes)

#만화

page <- data.frame(comicName, comicSummary, comicGrade)
navercomic <- rbind(navercomic, page)
i <- i+1
if(length(comicName)< 24){
  break
  
 }
}
write.csv(navercomic,"navercomic.csv")



