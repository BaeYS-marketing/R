# 네이버 웹툰 댓글에서 베스트댓글, 
#전체댓글 10페이지를 읽어서 webtoon1.txt 파일에 저장하는 코드 작성하기
# 네이버 웹툰 페이지 네비게이팅
# 베스트 댓글을 읽어서 변수 저장
# 전체 댓글 보기 링크 클릭
# 첫페이지 댓글 내용 읽어서 변수에 추가
# 2,3,4-10 페이지까지 이동하여 변수에 추가
# 변수의 내용을 webtoon1.txt 저장해서
# webtoon1.txt, webtoon1.R 첨부

remDr$open()
url = "https://comic.naver.com/comment/comment.nhn?titleId=570503&no=135"
remDr$navigate(url)
bestReviewNodes = remDr$findElements(using='css selector', 'ul span.u_cbox_contents')
ALL1 = sapply(bestReviewNodes,function(x){x$getElementText()})


totalReview = remDr$findElement(using='css selector', 'a > span.u_cbox_in_view_comment')
totalReview$clickElement()
totalReviewNodes=remDr$findElements(using='css selector', 'div.u_cbox_comment_box > div > div.u_cbox_text_wrap')
ALL2 = sapply(totalReviewNodes,function(x){x$getElementText()})

for(i in 4:12){
  nextCss = paste0("#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(",i,") > span")
  nextPage = remDr$findElement(using="css", nextCss)
  nextPage$clickElement() 
  Sys.sleep(1)
  nextReviewNodes=remDr$findElements(using='css selector', 'div.u_cbox_comment_box > div > div.u_cbox_text_wrap')
  ALL3 = sapply(nextReviewNodes,function(x){x$getElementText()})
  ALL2 = list(ALL2, ALL3)
}

alltext = list(ALL1, ALL2)
write(unlist(alltext),"webtoon1.txt")