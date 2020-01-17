library(RSelenium)
library(rvest)

#네이버 웹툰 댓글 읽기

#1
remDr <- remoteDriver(remoteServerAddr = 'localhost',
                      port=4445, browserName = 'chrome')

#2
remDr$open()


#3
url = "http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135"
remDr$navigate(url)


#4 bestReview
bestNodes <- remDr$findElements(using= 'css', 'span.u_cbox_contents')

bestRview <- sapply(bestNodes, function(x)(x$getElementText()))
bestRview



#5. commonReview
#~1
totalNodes <- remDr$findElement(using="css", 'span.u_cbox_in_view_comment')
totalNodes$clickElement() 


#~2 
commonReviewTotal<-NULL
for(i in 4:12){
        commonNodes <- remDr$findElements(using= 'css', 'span.u_cbox_contents')
        commonReview <- sapply(commonNodes, function(x)(x$getElementText()))
        commonReviewTotal <- c(commonReviewTotal,commonReview)
        nextNodes <- paste0("#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(",i,")")
        nextPageTag <- remDr$findElements(using= 'css', nextNodes)
        # nextPageTag$clickElement()
        sapply(nextPageTag, function(x)(x$clickElement()))
        Sys.sleep(3)
}
commonReviewTotal

data<-unlist(c(bestRview,commonReviewTotal))
data

write(data,'webtoon1.txt')

getwd()
