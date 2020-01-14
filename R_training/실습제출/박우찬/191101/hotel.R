# 아고다 소스 ]
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?cid=-204'
remDr$navigate(url)

#나중에 하기 클릭하여 팝업메뉴 없애기
laterAction = remDr$findElement(using='css',
                                'body > div.SearchboxBackdrop')
laterAction$clickElement()

# 스크롤 없애기기
remDr$executeScript("scrollBy(0, 8400)")

# 이용후기 클릭릭
test<-NULL
test<-remDr$findElement(using='css',
                        '#customer-reviews-panel > button > div > span')
test$clickElement()
result = NULL
 while (TRUE) {
  
  # 댓글 불러오기기
  totalReview = remDr$findElements(using = 'css','p.Review-comment-bodyText')
  reviews = sapply(totalReview, function(x){x$getElementText()})
  
  result = c(result,reviews)
  
  
  
  # 다음으로 넘어가기
  NextAction = remDr$findElement(using='css',
                                 '#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i')
  NextAction$clickElement()
  Sys.sleep(2)
  if(length(NextAction) == 0) 
    break;
 }
 cat(summary(unlist(result))[[1]],'개의 댓글추출',sep = '')
 write(unlist(result), ' hotel.txt')
 