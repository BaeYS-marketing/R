
#동적크롤링 실습
install.packages("RSelenium")
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome") # 셀레늄 서버에 대해 접속하도록 설정한거임
remDr
str(remDr)
remDr$open()    #리모트 서버를 만들고 그 서버를 이용해서 브라우저를 열어줘 라는 의미임 
remDr$navigate("http://www.google.com/ncr")  # 그 브라우저를 이용해서 이 사이트를 열어줘

webElem <- remDr$findElement(using = "css", "[name = 'q']") #이름이 q인 엘리먼트를 찾아라
webElem
str(webElem)
webElem$sendKeysToElement(list("JAVA",key = "enter")) #리턴받은 엘리먼트에 키를 입력해라 (list로 처음엔 입력하고 싶은 검색어, 그다음엔 어떤 키를 줄지 만들면됨)
webElem$getElementTagName()


#네이버로 해보기
remDr$navigate("http://www.naver.com/")  

webElem <- remDr$findElement(using = "css", "[name = 'query']") 
webElem$sendKeysToElement(list("2019년 10월 31일",key = "enter")) 

#클릭이벤트 실습
remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")  
#방법1
more <- remDr$findElements(using="css",'#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a > span.u_cbox_sort_label')
sapply(more,function(x){x$clickElement()})
#방법2
more <- remDr$findElement(using="css",'#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a > span.u_cbox_sort_label')
more$clickElement()

#2페이지
two <- remDr$findElements(using="css", "div > a:nth-child(4) > span")
sapply(two, function(x){x$clickElement()})

#3페이지
three <- remDr$findElement(using="css", " div > a:nth-child(5) > span")
three$clickElement()

#자동으로 10페이지까지
for (i in 4:12) {
  nextCss <- paste0("div > a:nth-child(",i,") > span")
  nextPage <- remDr$findElement(using="css",nextCss)
  nextPage$clickElement()
  Sys.sleep(3)
}

#베스트 댓글 내용 읽어오기
bestReviewNodes <- remDr$findElements(using = "css selector", "div.u_cbox_text_wrap > span.u_cbox_contents")
sapply(bestReviewNodes, function(x){x$getElementText()})

#전체 댓글 링크 클릭후에 첫 페이지 내용 읽어오기
totalReview <- remDr$findElement(using = "css", "ul > li:nth-child(2) > a > span.u_cbox_sort_label")
totalReview$clickElement()
totalReviewNodes <- remDr$findElements(using = "css selector", "div > div.u_cbox_text_wrap > span")
sapply(totalReviewNodes,function(x){x$getElementText()})



# 링크 클릭으로 AJAX 로 처리되는 네이버 웹툰 댓글 읽어 오기
repl_v = NULL;
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#베스트 댓글 내용 읽어오기
doms1<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
vest_repl <- sapply(doms1,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(vest_repl))

toralReview <- remDr$findElement(using='css','span.u_cbox_in_view_comment')
toralReview$clickElement()
#전체 댓글의 첫 페이지 내용 읽어오기
doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
repl <-sapply(doms2,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(repl))

repeat {
  for (i in 4:12) {               
    nextCss <- paste("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span", sep="")                
    try(nextListLink<-remDr$findElement(using='css',nextCss))
    if(length(nextListLink) == 0)   break;
    nextListLink$clickElement()
    Sys.sleep(1)
    #전체 댓글의 해당 페이지 내용 읽어오기
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    repl <-sapply(doms3,function(x){x$getElementText()})
    repl_v <- c(repl_v, unlist(repl))                
  }
  
  try(nextPage<-remDr$findElement(using='css',
                                  "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  #try함수 쓴 이유는 오류가 나도 계속 진행하자고 하는 거임 
  if(length(nextPage) == 0)  break;  #"다음"이라는 버튼이 없을때 브레이크 준거임.
  nextPage$clickElement()
  Sys.sleep(1)
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write(repl_v, "webtoon2.txt")