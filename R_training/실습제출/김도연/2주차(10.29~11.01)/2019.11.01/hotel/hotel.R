
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

url<-'https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204'
remDr$navigate(url)
next_time = remDr$findElement(using = "css",
                                'div.Popup__container.Popup__container--garage-door a')
next_time$clickElement()


if(length(next_time) != 0){
  next_time$clickElement()
}

test = NULL
test = remDr$findElement(using = 'css', '#customer-reviews-panel > span')
test

remDr$executeScript("scrollBy(0,8400)")
pageLink = NULL
pageLink = remDr$findElement(using)



http://www.yes24.com/Product/goods/40936880


remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204'
remDr$navigate(url)

#나중에 하기 클릭하여 팝업메뉴 없애기
laterAction<-remDr$findElement(using='css',
                               '#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
if(length(laterAction) != 0){
  laterAction$clickElement()
} 

test<-NULL
test<-remDr$findElement(using='css',
                        '#customer-reviews-panel > span')
test

remDr$executeScript("scrollBy(0, 8400)")
a=NULL
repeat{
ReviewNodes = remDr$findElements(using = "css selector", "p.Review-comment-bodyTitle")
reviews = sapply(ReviewNodes, function(x){x$getElementText()})
reviews
a = c(a, reviews)

nextreviews = remDr$findElement(using = "css", '#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i')
nextreviews$clickElement()
Sys.sleep(1)
if(length(reviews)!=20) break;
}
a
write(unlist(a), "hotel.txt")

cat(paste(length(a), "개의 댓글 추출"))