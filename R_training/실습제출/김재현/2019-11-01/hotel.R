#실습2
remDr$open()    
remDr$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204")

later <- remDr$findElements(using = "css", "div > div > div.AlertMessage.CalendarAlertMessage > a")
sapply(later, function(x){x$clickElement()})

test <- NULL
test <- remDr$findElement(using = "css", "#customer-reviews-panel > span")
test

remDr$executeScript("scrollBy(0, 8400)")

review <- NULL

for(i in 0:19){
  review_order <- paste0("#review-",i," > div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body > p.Review-comment-bodyText")
  review_hotel <- remDr$findElements(using = "css", review_order)
  review_result_one <- sapply(review_hotel, function(x){x$getElementText()})
  review <- c(review, unlist(review_result_one))
}
repeat{
  next_page <- remDr$findElement(using = "css", "#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i")
  next_page$clickElement()
  Sys.sleep(1)
  for(i in 0:19){
    review_order <- paste0("#review-",i," > div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body > p.Review-comment-bodyText")
    review_hotel <- remDr$findElements(using = "css", review_order)
    review_result_one <- sapply(review_hotel, function(x){x$getElementText()})
    review <- c(review, unlist(review_result_one))
  }
  if(length(next_page)==0){
    break;
  }
}
write(review,"hotel.txt")

Re_no <- length(review)
cat(Re_no,"개의 댓글 추출")
