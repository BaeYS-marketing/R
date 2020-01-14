url<-'https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204'
remDr$open()
remDr$navigate(url)
agoda<-remDr$findElement(using='css',
                         '#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
agoda$clickElement()
remDr$executeScript("scrollBy(0, 8400)")
agoda<-remDr$findElement(using='css',
                         '#customer-reviews-panel > button > div > span')
agoda$clickElement()
agodaReviewNodes<-remDr$findElements(using = 'css selector',
                                     "div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body")
agodaReviewText<-sapply(agodaReviewNodes,function(x){x$getElementText()})
agodaReviewText
a=2
b=5
while (a<b) {
  bCss<-remDr$findElement(using='css', '#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span:nth-child(5)')
  b<-bCss$getElementText()
  nextCss <- "#reviewSection > div:nth-child(4) > div > span:nth-child(3)"
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
  agodaReviewNodes<-remDr$findElements(using = 'css selector',
                                       "div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body")
  agodaReviewText<-list(agodaReviewText,sapply(agodaReviewNodes,function(x){x$getElementText()}))
  a+1
}
agodaReviewText<-gsub("[[:cntrl:]]","",unlist(agodaReviewText))
cat(length(agodaReviewText),"개의 댓글 추출\n")
write(agodaReviewText, "hotel.txt")
