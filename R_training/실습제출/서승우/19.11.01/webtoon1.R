url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
bestReviewNodes<-remDr$findElements(using="css selector",
                                    "div > div.u_cbox_text_wrap > span.u_cbox_contents")
bestReview<-sapply(bestReviewNodes,function(x){x$getElementText()})
totalReview<-remDr$findElement(using='css',
                               'span.u_cbox_in_view_comment')
totalReview$clickElement()
totalReviewNodes<-remDr$findElements(using='css selector',
                                     'ul.u_cbox_list span.u_cbox_contents')
totalReview<-sapply(totalReviewNodes, function(x){x$getElementText()})
for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(1)
  totalReviewNodes<-remDr$findElements(using='css selector',
                                       'ul.u_cbox_list span.u_cbox_contents')
  b<-sapply(totalReviewNodes, function(x){x$getElementText()})
  totalReview<-list(totalReview, b)
}
webtoon1<-c(totalReview, bestReview)
webtoon1<-unlist(webtoon1)
write(webtoon1, 'webtoon1.txt')