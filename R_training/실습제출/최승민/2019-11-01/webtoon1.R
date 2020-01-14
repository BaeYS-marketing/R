library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
bestReviewNodes<-remDr$findElements(using ='css selector','ul.u_cbox_list span.u_cbox_contents')
webtoon1<-sapply(bestReviewNodes, function(x){x$getElementText()})
webtoon1=as.matrix(webtoon1)
totalReview<-remDr$findElement(using="css", "span.u_cbox_in_view_comment")
totalReview$clickElement()
totalReviewNodes<-remDr$findElements(using = "css selector","ul.u_cbox_list span.u_cbox_contents")
total<-sapply(totalReviewNodes, function(x){x$getElementText()})
total=as.matrix(total)
webtoon1=rbind(webtoon1,total)

for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
  totalReviewNodes2<-remDr$findElements(using = "css selector","ul.u_cbox_list span.u_cbox_contents")
  total2<-sapply(totalReviewNodes2, function(x){x$getElementText()})
  total2=as.matrix(total2)
  webtoon1=rbind(webtoon1,total2)
  
}
getwd()
write.table(webtoon1,"webtoon1.txt")

