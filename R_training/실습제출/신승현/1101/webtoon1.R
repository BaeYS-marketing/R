#네이버 웹툰 댓글에서 베스트댓글, 전체댓글 10페이지를 읽어서 webtoon1.txt 저장
#네이버 웹툰 페이지 네비게이팅
#베스트댓글을 읽어서 변수에 저장
#전체댓글 보기 링크 클릭
#첫페이지 댓글 내용 읽어서 변수에 추가
#2,3,4~10 페이지까지 이동하여 댓글내용 읽어서 변수에 추가
#변수의 내용을 webtoon1.txt에 저장해서 
#webtoon1.txt, webtoon1.R 제출


library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr
str(remDr)
remDr$open()

remDr$navigate("https://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")


more <- remDr$findElements(using = 'css', 'span.u_cbox_contents')
h<-sapply(more,function(x){x$getElementText()})
h=as.matrix(h)

more <- remDr$findElements(using = 'css', 'span.u_cbox_in_view_comment')
sapply(more,function(x){x$clickElement()})
result<-NULL


for(i in 4:12){
  totalReviewNodes<-remDr$findElements(using="css selector", 'span.u_cbox_contents')
  
  hh<-sapply(totalReviewNodes,function(x){x$getElementText()})
  hh=as.matrix(hh)
  result<-rbind(result,hh)
  
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div>a:nth-child(",i,")>span")
  nextPage <- remDr$findElement(using='css',nextCss)
  
  nextPage$clickElement()
  
  Sys.sleep(3)
}



final<-rbind(h, result)
write.table(final, "webtoon1.txt")