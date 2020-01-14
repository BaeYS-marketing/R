library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost", port=4445, browserName = "chrome")
remDr$open()

# 네이버 웹툰 베댓 1페이지와 전체댓글 10페이지 읽어서 저장하기
remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")

bestReviewNodes <- remDr$findElements(using ="css selector","#cbox_module span.u_cbox_contents")
Review <- sapply(bestReviewNodes, function(x){x$getElementText()})

totalReview <- remDr$findElement(using = "css", "span.u_cbox_in_view_comment")
totalReview$clickElement()

for (i in 4:13){
  totalReviewNodes <- remDr$findElements(using = "css selector", 'ul > li> div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span')
  Review <- append(Review, sapply(totalReviewNodes, function(x){x$getElementText()}))
  
  if (i ==13) {break}
  nextCss <- paste0("#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(",i,")")
  nextPage <- remDr$findElement(using = "css", nextCss)
  nextPage$clickElement()
  Sys.sleep(1)
}

Review <- unlist(Review)
Review <- gsub("[[:punct:]]|[[:cntrl:]]","",Review)

write(Review, "webtoon1.txt")
