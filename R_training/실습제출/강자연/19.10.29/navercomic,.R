# 박스로 표시된 내용을 추출하고 “comicName,  comicSummary, comicGrade” 열명으로 DataFrame을 생성하여
# navercomic.csv로 저장하고 소스는 navercomic.R로 저장한다. 
# 모든 페이지를 크롤링하고 스크래핑한다.


site="https://comic.naver.com/genre/bestChallenge.nhn?&page=" #브라우저의 기능  R에서도 가능
comic=NULL
pagesNum=NULL
repeat {
  url2<- paste(site,i,sep="")
  text1=read_html(url2, encoding =  "UTF-8")

  nodes4<-html_nodes(text1, ".num_page")
  pageNum<- html_text(nodes4, trim = T)
  as.numeric(pageNum)
  pagesNum=c(pagesNum,pageNum)

   url<- paste(site,k,sep="")
  text=read_html(url, encoding =  "UTF-8")
  
  nodes1<-html_nodes(text, "h6.challengeTitle")
  comicName<- html_text(nodes1, trim = T)
 
  nodes2<- html_nodes(text,"div.summary")
  comicSummary<-html_text(nodes2, trim=T)
  
  nodes3<- html_nodes(text,"div.rating_type > strong")
  comicGrade<-html_text(nodes3, trim=T)

  page<-data.frame(comicName,comicSummary,comicGrade)
 
  comic<- rbind(comic,page)
  if(max(pageNum)==max(pagesNum))
    break;
}
write.csv(comic,"navercomic.csv")

#동적태그의 경우 크롬을 사용할 수 없음.

getwd()
