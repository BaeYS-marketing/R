#아고다 review 웹크롤링
revi<-NULL
repeat{
  totalReviewNodes<-remDr$findElements(using='css selector','p.Review-comment-bodyText')
  totalReview<-sapply(totalReviewNodes, function(x){x$getElementText()})
  revi <- c(revi, unlist(totalReview))
  try(nextPage<-remDr$findElement(using='css',
                                  "#reviewSection > div:nth-child(4) > div > span:nth-child(3) > i"))
  if(length(nextPage) == 0)  break;
  nextPage$clickElement()
  Sys.sleep(1)
}
write(revi, 'hotel.txt')
cat(length(revi), "개의 댓글 추출", sep="")
