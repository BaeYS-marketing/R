
#아고다 신라스테이 리뷰

#https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204'
remDr$navigate(url)
#나중에 하기 없애기
later<-remDr$findElement(using="css", "#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a")
later$clickElement()

# test<-NULL
# test<-remDr$findElement(using = 'css','#customer-reviews-panal>span')
# test

#스크롤 내리기
remDr$executeScript("scrollBy(0, 8400)")

#이용후기 클릭하기
Review<-remDr$findElement(using="css", "#navbar > div > ul > li:nth-child(3) > span")
Review$clickElement()



#첫페이지 담기
firstReviewNodes<-remDr$findElements(using ='css selector','p.Review-comment-bodyText')
agoda<-sapply(firstReviewNodes, function(x){x$getElementText()})
agoda=as.matrix(agoda)

for (i in 1:28) {
  
  nextPage<-remDr$findElement(using="css selector","#reviewSection > div:nth-child(6) > div > span:nth-child(3) > i")
  nextPage$clickElement()
  Sys.sleep(3)
  ReviewNodes2<-remDr$findElements(using = "css selector","p.Review-comment-bodyText")
  Review2<-sapply(ReviewNodes2, function(x){x$getElementText()})
  Review2=as.matrix(Review2)
  agoda=rbind(agoda,Review2)
}

write.table(agoda,"agoda.txt")  



#예스24
# http://www.yes24.com/Product/goods/40936880

