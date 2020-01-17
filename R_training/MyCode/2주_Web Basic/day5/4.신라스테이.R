



remDr <- remoteDriver(remoteServerAddr = 'localhost',
                      port=4445, browserName = 'chrome')

#2
remDr$open()


#3
url = " https://www.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?%20cid=-204"
remDr$navigate(url)


laterTag <- remDr$findElement(using="css", '#SearchBoxContainer > div > div > div.Popup__container.Popup__container--garage-door > div > div > div.AlertMessage.CalendarAlertMessage > a')
laterTag$clickElement() 


#4 아이작스로 페이지 최신화시키는 홈페이지
test <- NULL
test <- remDr$findElement(using = 'css',
                          '#customer-reviews-panel > span')
test   #NULL



#5 자바스크립언어로 스크롤 내리기 _ (아이작스는 자바스크립프로그래밍)
remDr$executeScript("scrollBy(0, 8400)")



#6
url <- 'http://www.yes24.com//Product/goods/40936880'
remDr$navigate(url)
remDr$executeScript('scrollBy(0,8500)',args = list(webElem))






###############       신라스테이 이용후기 크롤링       ################

#1
remDr <- remoteDriver(remoteServerAddr = 'localhost',
                      port=4445, browserName = 'chrome')

#2
remDr$open()

#3
url <-'https://hkg.agoda.com/ko-kr/shilla-stay-seocho/hotel/seoul-kr.html?%20cid=-204'
remDr$navigate(url)


#4 이용후기 페이지 이동(내가)


#5 스크롤 내리기
#방법1
remDr$executeScript("scrollBy(0, 7300)")
remDr$executeScript("scrollBy(0, -7300)")

#방법2
webElem <- remDr$findElement("css", "body")
webElem$sendKeysToElement(list(key = "end"))


#6다음페이지 넘기기
nextTagNode <- remDr$findElements(using = 'css' , '#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i')
sapply(nextTagNode,function(x){x$clickElement()})


#7 내용스크랩핑

textNodes <- remDr$findElements(using = 'css', 'p.Review-comment-bodyText')
text <- sapply(textNodes,function(x){x$getElementText()})
text



#8 종합
ReviewHotel <- NULL
repeat {
        textNodes <- remDr$findElements(using = 'css', 'p.Review-comment-bodyText')
        text <- sapply(textNodes,function(x){x$getElementText()})
        ReviewHotel <- c(ReviewHotel,text)
        nextTagNode <- remDr$findElements(using = 'css' , '#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i')
        button <- sapply(nextTagNode,function(x){x$clickElement()})
        Sys.sleep(1)
        if(length(button)==0){
                break;
        }
}
#length(button)?
ReviewHotel
hotelReview<-unlist(ReviewHotel)
hotelReview<- data.frame(hotelReview)
write.table(hotelReview,'hotel.txt')






###############     신라스테이 이용후기 크롤링 _ 방법2     ###############


#다음페이지 넘기기 셋팅
nextTagNode <- remDr$findElements(using = 'css' , '#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span:nth-child(4)')
sapply(nextTagNode,function(x){x$clickElement()})

currnetTagNode <- remDr$findElements(using = 'css', '#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span.Review-paginator-number.Review-paginator-number--current')


ReviewHotel<-NULL

#1~4
for(i in 1:3){
        textNodes <- remDr$findElements(using = 'css', 'p.Review-comment-bodyText')
        text <- sapply(textNodes,function(x){x$getElementText()})
        ReviewHotel <- c(ReviewHotel,text)
        nextTagNode <- remDr$findElements(using = 'css' , '#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i')
        button <- sapply(nextTagNode,function(x){x$clickElement()})
        Sys.sleep(1)
        
}

#자동화
currnetTagNode <- remDr$findElements(using = 'css', '#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span.Review-paginator-number.Review-paginator-number--current')
c.num <- sapply(currnetTagNode,function(x){x$getElementText()})
c.Num <- as.numeric(c.num)
n.Num <-4


while(c.Num >= n.Num ){
        
        #반복문 알고리즘
        n.Num <- c.Num+1
        c.num <- sapply(currnetTagNode,function(x){x$getElementText()})
        c.Num <- as.numeric(c.num)
        
        #텍스트
        textNodes <- remDr$findElements(using = 'css', 'p.Review-comment-bodyText')
        text <- sapply(textNodes,function(x){x$getElementText()})
        ReviewHotel <- c(ReviewHotel,text)
        
        #다음페이지
        nextTagNode <- remDr$findElements(using = 'css' , '#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span:nth-child(4)')
        sapply(nextTagNode,function(x){x$clickElement()})


        Sys.sleep(1)
        
}      


#마지막페이지
nextTagNode <- remDr$findElements(using = 'css' , '#reviewSection > div:nth-child(4) > div > span.Review-paginator-numbers > span:nth-child(5)')
button <- sapply(nextTagNode,function(x){x$clickElement()})
textNodes <- remDr$findElements(using = 'css', 'p.Review-comment-bodyText')
text <- sapply(textNodes,function(x){x$getElementText()})


ReviewHotel
hotelReview<-unlist(ReviewHotel)
hotelReview<- data.frame(hotelReview)
write.table(hotelReview,'hotel(2).txt')


currnetTagNode != nextTagNode
ss<-as.numeric(c.Num)
ss

