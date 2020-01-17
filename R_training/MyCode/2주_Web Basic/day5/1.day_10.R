# install.packages("RSelenium")
library(RSelenium)
"java -jar selenium-server-standalone.jar -port 4445
1.자바코드 프로그래밍 - RSelenium실행
2.chrome_driver 설치한 것으로 브라우저 환경"

# localhost는 나의 pc를 의미함
remDr<-remoteDriver(remoteServerAddr= "localhost", port = 4445, browserName= "chrome")

# url = "http://www.yes24.com/Product/goods/40936880"

# 브라우저 구동 및 특정 페이지 이동
remDr$open()
remDr$navigate("http://www.google.com/ncr")

webElem = remDr$findElement(using = "css", "[name = 'q']")
# webElem$getElementTagName()
# str(webElem)
webElem$clearElement() # 해당 필드 초기화
webElem$sendKeysToElement(list("JAVA", key = "enter"))

# element를 매 호출 시 다시 받아와야하는 듯 함
webElem = remDr$findElement(using = "css", "[name = 'q']")
webElem$sendKeysToElement(list("R selenium pdf", key = "enter"))

webElem = remDr$findElement(using = "css", "[id = 'hpcanvas']")
webElem$clickElement()

# remDr$findElement(using = )

webElem = remDr$findElement(using = "css", '[class = "gb_e"]')
webElem$clickElement()

remDr$navigate("http://www.naver.com")
webElem = remDr$findElement(using = "css", "[id = 'query']")
webElem$sendKeysToElement(list("Python", key = "enter"))









#############      네이버 웹툰 댓글 읽기   ##############

#[1] 셀레늄셋팅
remDr<-remoteDriver(remoteServerAddr= "localhost", port = 4445, browserName= "chrome")
remDr$open()


#[2].네비게이팅
url = "http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135"
remDr$navigate(url)




#[3].단수형 노드 추출 (전체페이지 보기 태그찾기)
more = remDr$findElement(using="css", 'span.u_cbox_in_view_comment')


#[4]. 찾은 전체페이지보기태그 클릭 
more$clickElement()   
                        #단수형은 바로, 복수형은 sapply
                         # sapply(more, function(x){x$clickElement()})





#[3]-2. 복수형 노드 추출 (전체페이지 보기 태그) 
more = remDr$findElements(using="css", 'a.u_cbox_select')
                                    #[class="u_cbox_sort_label"]
more[[1]]
more[[1]]$clickElement()
sapply(more, function(x){x$clickElement()})


#[4]-2 복수형 찾은 태그 클릭함수 시행
more = remDr$findElements(using="css", '[class = "u_cbox_select"]')
sapply(more, function(x){x$clickElement()})





#[5]-1. 페이지 넘기기 

# 2 page 
page = remDr$findElements(using="css", 'a.u_cbox_page')
#                             class(page)    #[1] "list"
page[[1]]$clickElement()

# 3 page
page = remDr$findElements(using="css", 'a.u_cbox_page')
page[[2]]$clickElement()

# 4 page
page = remDr$findElements(using="css", 'a.u_cbox_page')
page[[3]]$clickElement()



#[5]-2. 페이지 넘기기 
more <- remDr$findElements(using = 'css','a:nth-child(5)>span')




#[6]. for문 돌려서 페이지별 추출 (종합) 

#1 css 셀렉터
remDr$navigate(url)
more = remDr$findElements(using="css", 'a.u_cbox_select')
sapply(more, function(x){x$clickElement()})
for (i in 4:12){           #개발자 도구 태그위치 복사
  next_css = paste0("#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(", i, ") > span")
  next_page = remDr$findElement(using = 'css', next_css)
  next_page$clickElement()
  Sys.sleep(3)
}

#2 xpath
remDr$navigate(url)
more = remDr$findElements(using="css", 'a.u_cbox_select')
sapply(more, function(x){x$clickElement()})
for (i in 1:10){              #css 위치랑 xpath위치랑 달라서 해보았다.
  next_xpath = paste0("//*[@id='cbox_module']/div/div[7]/div/a[", i, "]/span")
  next_page = remDr$findElement(using = 'xpath', next_xpath)
  next_page$clickElement()
  Sys.sleep(3)
}








##### 구현된 페이지 데이터 크롤링 ######





#[7] 베스트 댓글 내용 읽어오기  - 함수시행 필요X        
url = "http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135"
remDr$navigate(url)

content = remDr$findElements(using="css", 'span.u_cbox_contents')
# simple apply : 간단한 데이터 형식으로 리턴하는 함수
# list apply : 리스트 형식으로 리턴
texts = sapply(content, function(x){x$getElementText()})
print(texts)




#[8] 전체 댓글링크 클릭 후에 첫 페이지 내용 읽어오기.  ########
'에이작스 비동기 통신 : 요청하고 나서 응답 기다리지 않고 다음 출력
     ex. 문앞에 택배, 랜더링 데이터를 가져오기도 전에 다음 명령 수행할 경우가 가끔 있다. _ 
        서버 상황 / 네트워크 상황에 따라서. 이럴 때 sys.sleep(2)으로 죽는거 방지' 

#1 전체댓글로 이동
totalReview <- remDrfindElement(using ='css','span.u_cbox_contents')
totalReview$clickElement()

#2 댓글 텍스트 읽어오기 
totalReviewNodes <- remDr$findElements(using = 'css selector','span.u_cbox_contents')
sapply(totalReviewNodes,function(x){x$getElementText()})
'#css   /  css selelctor  같다고 보면 된다.
#css : css selector + css Attribute
#~ 여기서 우리는 크롤링이라서 css셀렉터만 쓴다.'






#실습
#네이버 웹툰 댓글에서 베스트 댓글, 전체댓글 10페이지를
#읽어서 webtoon1.txt 파일에 저장하기 
'1. 네이버 웹툰 페이지 네비게이팅
 2. 베스트 댓글을 읽어서 변수 저장
 3. 전체댓글 보기 링크 클릭
 4. 첫페이지 댓글 내용 읽어서 변수에 추가
 5. 2,3,4~10 페이지 까지 이동하여 댓글내용 읽어서 변수에 추가
 6. 변수를 webtoon1.txt로 저장해서 제출'