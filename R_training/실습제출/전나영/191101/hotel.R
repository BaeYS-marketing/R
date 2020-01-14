remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204")

laterAction <- NULL
laterAction <- remDr$findElement(using = "css", "div.Popup__container.Popup__container--garage-door a")
if(length(laterAction) != 0){
  laterAction$clickElement()
}

remDr$executeScript("scrollBy(0, 8400)")

# 1페이지
reviewNodes <- remDr$findElements(using ="css selector","p.Review-comment-bodyTitle")
review <- sapply(reviewNodes,function(x){x$getElementText()})
review

# 2부터 마지막페이지
repeat {
  nextPage <- remDr$findElement(using = "css", "#reviewSection > div:nth-child(4) > div > span:nth-child(3)")
  nextPage$clickElement()
  Sys.sleep(1)
  
  reviewNodes <- remDr$findElements(using ="css selector","p.Review-comment-bodyTitle")
  reviews <- sapply(reviewNodes,function(x){x$getElementText()})
  review <- c(review, reviews)
  
  if(length(nextPage) == 0)  break;
}

cat(length(review), "개의 댓글 추출")

write(unlist(review), "hotel.txt")