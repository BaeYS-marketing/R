#네이버 웹툰 댓글에서 베스트 댓글과 전체댓글 10페이지를 읽어서 webtoon1.txt파일에 저장
# 베스트 댓글글
remDr$navigate('https://comic.naver.com/comment/comment.nhn?titleId=570503&no=135')

totalReviewNodes = remDr$findElements(using = 'css',
                                      'ul.u_cbox_list span.u_cbox_contents')
page1 = sapply(totalReviewNodes, function(x){x$getElementText()})

# 첫번째 전체댓글
totalReview = remDr$findElement(using = 'css','span.u_cbox_in_view_comment')
totalReview$clickElement()
totalReviewNodes = remDr$findElements(using = 'css',
                                      'ul.u_cbox_list span.u_cbox_contents')
page2 = sapply(totalReviewNodes, function(x){x$getElementText()})

page3 = cbind(page1, page2)
for (i in 4:12){
  
  nextCss = paste0('a:nth-child(',i,') > span')
  nextPage = remDr$findElement(using = 'css',nextCss)
  nextPage$clickElement()
  Sys.sleep(1)
  totalReviewNodes = remDr$findElements(using = 'css',
                                        'ul.u_cbox_list span.u_cbox_contents')
  pagex = sapply(totalReviewNodes, function(x){x$getElementText()})
  page3 = cbind(page3, pagex)
  Sys.sleep(1)
  
}


write.table(unlist(page3), 'webtoon1.txt')