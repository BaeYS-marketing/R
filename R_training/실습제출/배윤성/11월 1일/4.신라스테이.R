


###############        신라스테이 이용후기 크롤링       ###############

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



