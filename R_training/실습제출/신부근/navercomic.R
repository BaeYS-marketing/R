site<-"https://comic.naver.com/genre/bestChallenge.nhn?&page="
comic<-NULL
i<-0
repeat{
  i=i+1
  url<-paste(site,i,sep="")
  text<-read_html(url)
  comicName<-html_text(html_nodes(text,".challengeTitle"),trim=TRUE)
  
  comicSummary<-html_text(html_nodes(text,".summary"))
  
  comicGrade<-html_text(html_nodes(text,".rating_type > strong"))
  
  num.page<-html_text(html_nodes(text,"#content > div.paginate > div > strong.page > em"))
  cat(i,":",num.page,"\n")
  page<-data.frame(comicName,comicSummary,comicGrade)
  comic<-rbind(comic, page)
  if(i>as.numeric(num.page))
    break()
}
write.csv(comic,"navercomic.csv")


