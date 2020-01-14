url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
#베댓저장
remDr$navigate(url)
bestReviewNodes<-remDr$findElements(using = 'css selector',
                                    "ul.u_cbox_list span.u_cbox_contents")
bestReviewText<-sapply(bestReviewNodes,function(x){x$getElementText()})
#전체댓글1P
totalReview<-remDr$findElement(using='css','span.u_cbox_in_view_comment')
totalReview$clickElement()
totalReviewNodes<-remDr$findElements(using = 'css selector',
                                     "ul.u_cbox_list span.u_cbox_contents")
totalReviewText<-sapply(totalReviewNodes,function(x){x$getElementText()})
#전체댓글2~10P
for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
  totalReviewNodes<-remDr$findElements(using = 'css selector',
                                       "ul.u_cbox_list span.u_cbox_contents")
  totalReviewNext<-sapply(totalReviewNodes,function(x){x$getElementText()})
  totalReviewNext
  totalReviewText<-list(totalReviewText,totalReviewNext)
}
webtoon1<-list(bestReviewText,totalReviewText)
write(unlist(webtoon1), "webtoon1.txt")