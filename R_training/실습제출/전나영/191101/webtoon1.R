# 네이버 웹툰 댓글에서 베스트 댓글, 전체 댓글 10페이지를 읽어서 webtoon1.txt 파일에 저장하는 코드 작성하기
# 네이버 웹툰 페이지 네비게이팅
url <- "http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135"
remDr$navigate(url)
# 베스트 댓글을 읽어서 변수comment 저장
bestReviewNodes <- remDr$findElements(using = "css selector", "ul.u_cbox_list span.u_cbox_contents")
bestComment <- sapply(bestReviewNodes, function(x){x$getElementText()})
bestComment
# 전체 댓글 보기 링크 클릭
totalReview <- remDr$findElement(using = "css", "span.u_cbox_in_view_comment")
totalReview$clickElement()
# 첫 페이지 댓글 내용 읽어서 변수comment에 추가
totalReviewNodes <- remDr$findElements(using = "css selector", "ul.u_cbox_list span.u_cbox_contents")
comment <- sapply(totalReviewNodes, function(x){x$getElementText()})
comment
webtoon1 <- rbind(bestComment, comment)
webtoon1
# 2, 3, 4, ~ , 10페이지까지 이동하여 댓글 내용 읽어서 변수에 추가
for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div>a:nth-child(", i, ") > span")
  nextPage <- remDr$findElement(using = "css", nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
  totalReviewNodes <- remDr$findElements(using = "css selector", "ul.u_cbox_list span.u_cbox_contents")
  comment <- sapply(totalReviewNodes, function(x){x$getElementText()})
  webtoon1 <- rbind(webtoon1, comment)
}

webtoon1

write(unlist(webtoon1), "webtoon1.txt")
