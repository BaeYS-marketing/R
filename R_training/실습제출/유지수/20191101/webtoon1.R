#네이버 웹툰 댓글에서 베스트댓글, 전체댓글 10페이지를
#읽어서 webtoon1.txt 파일에 저장하는 코드 작성하기
#<방법>
#네이버 웹툰 페이지 네비게이팅
#베스트 댓글을 읽어서 변수 저장
#전체댓글 보기 링크 클릭
#첫페이지 댓글내용 읽어서 변수에 추가
#2,3,4 ~10 페이지까지 이동하여 댓글내용 읽어서 변수에 추가
#변수의 내용을 webtoon1.txt에 저장해서
#weebtoon.txt, webtoon1.R로 제출

#웹툰 페이지 이동
remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")
#베댓모음
bestReviewNodes <- remDr$findElements(using="css selector", "div span.u_cbox_contents")
best <- sapply(bestReviewNodes, function(x){x$getElementText()})

#전체페이지 보기 링크 클릭
totalReview <- remDr$findElement(using="css selector", "div span.u_cbox_in_view_comment")
totalReview$clickElement()

#첫페이지 댓글
totalReviewstrong <- remDr$findElements(using = "css", "span.u_cbox_contents")
page1 <- sapply(totalReviewstrong, function(x){x$getElementText()})

#2~10페이지 댓글
a <- c(best,page1)
for (i in 4:12) {
  nextCss <- paste0("#cbox_module > div > div.u_cbox_paginate > div >
                    a:nth-child(",i,") > span")
  nextPage <- remDr$findElements(using = 'css',nextCss)
  sapply(nextPage,function(x){x$clickElement()})
  totalReviewpage <- remDr$findElements(using = "css","div span.u_cbox_contents")
  allreviews <- sapply(totalReviewpage, function(x){x$getElementText()})
  a <- c(a,unlist(allreviews))
}
a
write(unlist(a), "webtoon1.txt")


