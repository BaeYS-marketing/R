#네이버 웹툰 댓글에서 베스트댓글, 전체댓글 10페이지를 
#읽어서 wentoon1.txt파일에 저장하는 코드 저장하기

#1. 네이버 웹툰 페이지 navigate 부터 할것
#2. best댓글 부터 먼저 읽어서 변수 저장
#3. 전체댓글 보기 링크 클릭
#4. 첫페이지 댓글내용 읽어서 변수에 추가
#5. 2,3,4,...,10번째 페이지까지 이동하여 댓글내용 읽어서 변수에 추가
#최종 변수의 내용을 webtoon1.txt에 저장해서
#webtoon1.txt, webtoon1.R을 제출

library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)

bestReviewNodes = remDr$findElements(using = "css selector",
                                     "ul.u_cbox_list span.u_cbox_contents")
bestreviews = sapply(bestReviewNodes, function(x){x$getElementText()})
bestreviews
totalReview = remDr$findElement(using = "css",
                                'span.u_cbox_in_view_comment')
totalReview$clickElement()
totalReviewNodes = remDr$findElements(using = "css selector",
                                      'ul.u_cbox_list span.u_cbox_contents')
allreviews1 = sapply(totalReviewNodes,function(x){x$getElementText()}) # simple apply의 의미 vector!
allreviews1
a = cbind(bestreviews, allreviews1)
for(i in 4:12){
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
  totalReviewNodes = remDr$findElements(using = "css selector",
                                        'ul.u_cbox_list span.u_cbox_contents')
  allreviews  = sapply(totalReviewNodes,function(x){x$getElementText()}) # simple apply의 의미 vector!
  
  a = cbind(a, allreviews)
}

write(unlist(a), "webtoon1.txt")
