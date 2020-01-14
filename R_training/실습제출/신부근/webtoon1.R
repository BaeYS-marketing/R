#네이버 웹툰댓글에서 베스트 댓글,전체 댓글 10페이지
#네이버 웹툰 페이지 네비게이팅
#베스트 댓글을 읽어서 변수 저장
#전체댓글보기 링크 클릭
#첫페이지 댓글 내용 읽어서 변수에 추가
#2~10페이지까지 이동하여 댓글내용 읽어서 변수에 추가
#변수의 내용을 webtoon1.txt,webtoon1.R로 저장
#

remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")
bestReview<-remDr$findElements(using="css selector",'ul.u_cbox_list span.u_cbox_contents')
bestReview1<-sapply(bestReview,function(x){x$getElementText()})

totalRevivew<-remDr$findElement(using="css","span.u_cbox_in_view_comment")
totalRevivew$clickElement()
totalRevivewNodes<-remDr$findElements(using="css selector",'ul.u_cbox_list span.u_cbox_contents')
totalReview1<-sapply(totalRevivewNodes,function(x){x$getElementText()})

Review<-c(bestReview1,totalReview1)

for(i in 4:12){
  nextCss<-paste0("#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
  totalRevivewNodes<-remDr$findElements(using="css selector",'ul.u_cbox_list span.u_cbox_contents')
  totalReview<-sapply(totalRevivewNodes,function(x){x$getElementText()})
  Review<-c(Review,totalReview)
  Review<-unlist(Review)
}
write(Review,"webtoon1.txt")