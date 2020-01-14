library(RSelenium)

#신라스테이 - 팝업창 내리고 스크롤 움직이고 이용후기 클릭
remDr <- remoteDriver(remoteServerAddr = "localhost", port=4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204
# ")
exit <- remDr$findElement(using='css',"#SearchBoxContainer   div.SearchBoxTextDescription__title")
exit$clickElement()
remDr$executeScript("scrollBy(0,100)")
see_review <- remDr$findElement(using='css',"#navbar > div > ul > li:nth-child(3) > span")
see_review$clickElement()


# 리뷰 크롤링
reviews <- NULL
j <- 0

while(1){
  j <-j+1
  
  for (i in 0:19){
    reviewNodes <- remDr$findElements(using = "css selector", paste0('#review-',i,' p.Review-comment-bodyText'))
    reviews <- append(reviews,sapply(reviewNodes, function(x){x$getElementText()}))
  }
  
  daum <- remDr$findElement(using='css',"#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i")
  tryCatch(daum$clickElement(),error=function(x){
    cat("마지막은 ",j,"페이지 입니다.",sep="")
    cat(length(reviews),"개의 댓글 추출",sep="")
    break
  })
}

write(unlist(reviews),"hotel.txt")
  
  

