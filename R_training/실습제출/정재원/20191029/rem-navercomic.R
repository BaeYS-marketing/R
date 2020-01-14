site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
#마지막페이지 알아내기
countPage = 0
while (pageNum>countPage) {
  url<-paste(site,i,sep="")
  text <- read_html(url)
  nodes<-html_nodes(text, "#content > div.paginate > div > strong.page > em")
  pageNum<-as.numeric(html_text(nodes, trim=T))
  countPage<-countPage+1
}
bestpage <- NULL
#크라울링
for(i in 1:countPage){
  url<-paste(site,i,sep="")
  text <- read_html(url)
  text
  nodes<-html_nodes(text, ".challengeInfo > h6 > a")
  comicName<-html_text(nodes, trim=T)
  comicName<-gsub("\t", "" ,comicName)
  comicName<-gsub("[\r\n]", "" ,comicName)
  comicName<-gsub("\n", "" ,comicName)

  nodes<-html_nodes(text, ".summary")
  comicSummary<-html_text(nodes, trim=T)
  comicSummary<-gsub("\t", "" ,comicSummary)
  comicSummary<-gsub("[\r\n]", "" ,comicSummary)
  comicSummary<-gsub("\n", "" ,comicSummary)

  nodes<-html_nodes(text, ".rating_type")
  comicGrade<-html_text(nodes, trim=T)
  comicGrade<-gsub("평점", "" ,comicGrade)
  comicGrade<-gsub(" ", "" ,comicGrade)
  comicGrade<-gsub("\t", "" ,comicGrade)
  comicGrade<-gsub("[\r\n]", "" ,comicGrade)
  comicGrade<-gsub("\n", "" ,comicGrade)
  comicpage  <- data.frame(comicName,comicSummary,comicGrade)
  bestpage <-rbind(bestpage,comicpage)
}

write.csv(bestpage, "navercomic.csv")